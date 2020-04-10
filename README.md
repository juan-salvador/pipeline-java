# Pipeline-Java-Application

![enter image description here](https://badgen.net/badge/version/0.0.1/green)

**Objetivo:**
Crear un pipeline CI/CD para una aplicación Java

**Solución:**
Se plantean dos soluciones para hacer un pipeline CI/CD, los cuales se encuentran en los siguientes branchs del repositorio:

* **without_registry:** Se desplego Jenkins dentro de un contenedor Docker para poder realizar el flujo de CI/CD. En este caso se hace uso de los comandos docker save y docker load para poder disponibilizar la imagen docker de la aplicación en la instancia EC2 donde se encontrará desplegada.
* **registry:** Se desplego Jenkins dentro de un contenedor Docker para poder realizar el flujo de CI/CD. En este caso se hace uso del servicio ECR de AWS para poder disponibilizar la imagen docker de la aplicación en la instancia EC2 donde se encontrará desplegada.

**Recursos:** 

 - [http://18.235.196.15/health](http://18.235.196.15/health)

**Pipeline:**

![enter image description here](https://image-readme-repositories.s3.amazonaws.com/pipeline-jenkins.png)


