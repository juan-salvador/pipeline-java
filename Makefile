IMAGE_NAME = pipeline-java
CONTAINER_NAME = java-application
current_dir:=$(shell pwd)
verify_status=$(shell ssh -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker ps -a | grep ${CONTAINER_NAME} | wc -l")

build:
	docker build -t ${IMAGE_NAME} .

save-image:
	docker save ${IMAGE_NAME} | gzip > ${IMAGE_NAME}.tar.gz

copy-image:
	scp -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ${IMAGE_NAME}.tar.gz ec2-user@172.31.70.13:/home/ec2-user/

load-image:
	if [ "$(verify_status)" > 0 ]; then\
        ssh -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker stop ${CONTAINER_NAME} | docker rm -f ${CONTAINER_NAME} | docker rmi -f ${IMAGE_NAME}";\
		ssh -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker load < /home/ec2-user/${IMAGE_NAME}.tar.gz";\
    else\
		ssh -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker load < /home/ec2-user/${IMAGE_NAME}.tar.gz";\
	fi

up:
	ssh -o "StrictHostKeyChecking no" -i /keys/jenkins-pipeline.pem ec2-user@172.31.70.13 "docker run -d --name java-application -p 80:8080 ${IMAGE_NAME}"

deploy:
	@make save-image
	@make copy-image
	@make load-image
	@make up
	@echo "Drenando contenedor..."
	@sleep 20

run-postman:
	newman run https://www.getpostman.com/collections/ab842a6267cc9beeede5