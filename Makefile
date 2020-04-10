IMAGE_NAME = pipeline-java
CONTAINER_NAME = java-application
REGISTRY_NAME = pipeline-java-registry
ACCOUNT_ID = 530088275162
REGION = us-east-1
REGISTRY_URL = ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/

verify_status=$(shell ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker ps -a | grep ${CONTAINER_NAME} | wc -l")

build:
	docker build -t ${IMAGE_NAME} .
	docker tag ${IMAGE_NAME}:latest ${REGISTRY_URL}${IMAGE_NAME}:latest

push:
	aws ecr get-login --no-include-email --region ${REGION} | sh
	docker push ${REGISTRY_URL}${IMAGE_NAME}:latest

load-image:
	ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "aws ecr get-login --no-include-email --region ${REGION} | sh";\
	if [ "$(verify_status)" > 0 ]; then\
        ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker stop ${CONTAINER_NAME} | docker rm -f ${CONTAINER_NAME} | docker rmi -f ${REGISTRY_URL}${IMAGE_NAME}:latest";\
		ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker pull ${REGISTRY_URL}${IMAGE_NAME}:latest";\
    else\
		ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker pull ${REGISTRY_URL}${IMAGE_NAME}:latest";\
	fi

up:
	ssh -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker run -d --name java-application -p 80:8080 ${REGISTRY_URL}${IMAGE_NAME}:latest"

deploy:
	@make load-image
	@make up
	@echo "Drenando contenedor..."
	@sleep 20

run-postman:
	newman run https://www.getpostman.com/collections/ab842a6267cc9beeede5