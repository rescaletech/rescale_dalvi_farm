# dalvi

Dalvi Agro, Chiplun - Organic mangoes from Chiplun with best quality mangoes directly to your home

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


## Build Instructions
 
  
** Working directory ** : MangoApp.Rescale
cd server
docker built -t dalvi_app .

# See docker images 
docker images

# Run the docker container with above image on port 8080
docker run -p 8080:3000 -e PORT=3000 dalvi_app

# View the docker containers
docker ps


# Tag your Docker image and publish to docker.hub
docker tag dalvi_app chndu6ue/dalvi_app

# Log in to Docker Hub
docker login

# Push the Docker image to Docker Hub:
docker push chndu6ue/dalvi_app


Verify the image on Docker Hub: After the push completes successfully, you can verify that the image is on Docker Hub by visiting the Docker Hub website and navigating to your repository page.

# Terminal Output 
$ docker tag dalvi_app chndu6ue/dalvi_app
$ docker login
Authenticating with existing credentials...
Login Succeeded



- # Production Deployment
  - Build docker
  - Deploy on GCP kubernetes as a service

Changes by Teja

