# dalvi

Dalvi Agro - Organic mangoes from Chiplun with latest technology

## Getting Started

### E-Commerce Application using flutter
# Architecture
- [Flutter] (https://flutter.dev/)
- [nodejs] (https://nodejs.org/en/learn/getting-started/introduction-to-nodejs)
- [Headless CMS Sanity.io] (https://www.sanity.io/)
- mongodb
- Firebase
- [Cloudinary] (https://cloudinary.com/blog/)
- # Tools
  - VSCode
  - Android Studio

## TODO
- # Build Instructions
- ''
- Working directory : MangoApp.Rescale

cd server
docker built -t dalvi_app .

# See docker images 
docker images

# Run the docker container with above image on port 8080
docker run -p 8080:3000 dalvi_app

#View the docker containers
docker ps


# Tag your Docker image
docker tag dalvi_app chndu6ue/dalvi_app

#Log in to Docker Hub
docker login

#Push the Docker image to Docker Hub:
docker push chndu6ue/dalvi_app


Verify the image on Docker Hub: After the push completes successfully, you can verify that the image is on Docker Hub by visiting the Docker Hub website and navigating to your repository page.

Terminal Output 

$ docker tag dalvi_app chndu6ue/dalvi_app
$ docker login
Authenticating with existing credentials...
Login Succeeded


$ docker push chndu6ue/dalvi_app
Using default tag: latest
The push refers to repository [docker.io/chndu6ue/dalvi_app]
87980bdf22e3: Preparing
aadacd48e8c0: Preparing
21e5223e1cf7: Preparing
45551347af4d: Preparing
4cbba91e0071: Preparing
8abbad55477e: Preparing
7c4673abcb9d: Preparing
d4fc045c9e3a: Preparing
8abbad55477e: Waiting
7c4673abcb9d: Waiting
d4fc045c9e3a: Waiting
4cbba91e0071: Pushed
45551347af4d: Pushed
21e5223e1cf7: Pushed
87980bdf22e3: Pushed
aadacd48e8c0: Pushed
8abbad55477e: Pushed
d4fc045c9e3a: Pushed
7c4673abcb9d: Pushed
latest: digest: sha256:83d5f1d584f84f528601e7dc00310cff69078a7960da9f48b54b3f64392e478e size: 1996

$''
- # Production Deployment
  - Build docker
  - Deploy on GCP kubernetes as a service

Changes by Teja

