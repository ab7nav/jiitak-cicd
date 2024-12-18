Tasks completed
Created a simple web application

Containerized the webapplication by using a Dockerfile.
I have pushed the image to dockerhub anahilate77/jiitak_web_app:1.0

Delpoyed the Application in AWS ec2.
This application was deployed by pulling the docker image anahilate77/jiitak_web_app:1.0 from docker hub
using docker pull anahilate77/jiitak_web_app:1.0
The docker container is exposed at port 5000
you can access the deployed application through http://13.61.151.20:5000
I have setup the security group to allow incoming traffic only through ports 22,5000 and 5001

Implementation of CI/CD
CI/CD is implemented through jenkins.
I have created a Jenkins Pipeline that has three stages
1> Git checkout stage
2> build image stage
   The build image stage creates a new tag for each image.
   This is done by using the build env by jenkins.
3> run container stage
   This stage checks for any existing container using port 5001 on the host machine.
   If found, the container is stoped and removed before the new container is run.
The application deplaoyed through CI/CD can be accessed at http://13.61.151.20:5001


