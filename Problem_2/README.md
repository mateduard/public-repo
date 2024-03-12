Second problem.
**Task 1:**
I chose the app.py file, as I am more used to its syntax.
**Task 2:**
First, we’ll create a dockerfile which will look like this:

![](./screenshots2/image1.png)

**Task 3:**
Then, we’ll build the image “my-python-app” based on this Dockerfile, using 
**docker build -t my-python-app .**

![](./screenshots2/image2.png)

Verify that the image exists:

![](./screenshots2/image3.png)

We run the image and see the expected output:

![](./screenshots2/image4.png)

**Task 4:**
We tag the docker image before the push with the command: 
**docker tag my-python-app mateduard/my-python-app:latest**
Then, we push to dockerhub with the command **docker push mateduard/my-python-app:latest**

![](./screenshots2/image5.png)

The image was pushed to the following repo:
https://hub.docker.com/repository/docker/mateduard/my-python-app/general

![](./screenshots2/image6.png)

As for the rest of the task, I think there will be necessary to have a PRO DockerHub account, which I don’t, unfortunately:

![](./screenshots2/image7.png)