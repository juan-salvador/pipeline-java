# Pipeline-Java-Application

![enter image description here](https://badgen.net/badge/version/0.0.1/green)

**Objetivo:**
Crear un pipeline CI/CD para una aplicación Java

**Solución:**
Se desplego Jenkins dentro de un contenedor Docker para poder realizar el flujo de CI/CD. En este caso se hace uso de los comandos docker save y docker load para poder disponibilizar la imagen docker de la aplicación en la instancia EC2 donde se encontrará desplegada.

**Parámetros:**

Se utilizó parametros de Jenkins para poder hacer dinámico el despliegue:

 - **UNIT_TEST**: Para ejecutar pruebas unitarias de la aplicación.
 - **DEPLOY**: Para realizar un build a la imagen de docker y desplegar en EC2.
 - **FUNCTIONAL_TEST**: Para ejecutar pruebas funcionales usando newman como CLI de Postman

![enter image description here](https://image-readme-repositories.s3.amazonaws.com/parameters.png)
 

**Iniciar Jenkins:**

El container docker de jenkins se encuentra dentro del folder **jenkins** de este repositorio, para iniciarlo se debe ejecutar el siguiente comando y proceder con la instalación:

        docker run --rm -u root -p 80:8080 -v "$PWD":/var/jenkins_home -v /keys:/keys -v /var/run/docker.sock:/var/run/docker.sock jenkins-container


**Lenguajes de Programación:**

 - Java 8

**Tecnologías:**

 - Maven
 - Makefile
 - Spring Boot
 - EC2
 - Jenkins
 - Docker
 - Postman / Newman

**Recursos:** 

 - [http://18.235.196.15/health](http://18.235.196.15/health)

**Pipeline:**

![enter image description here](https://image-readme-repositories.s3.amazonaws.com/pipeline-jenkins.png)

**Despliegue:**

![enter image description here](https://image-readme-repositories.s3.amazonaws.com/jenkins-deploy.jpg)

