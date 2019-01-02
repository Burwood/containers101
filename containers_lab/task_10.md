# Tagging and pushing a container to the registry

## Tagging Images

Adding a tag to your image is quite simple because the Docker developers have rolled the necessary tools into the docker command.
Assuming you're tagging a local image you would use the format: `docker tag <IMAGE ID> image/TAG`

Lets try it out

 1. Execute the command: **`docker image ls python-http-demo`** to get the Image ID of the image we created earlier in task 6
 2. Next execute the command: **`docker tag  <IMAGE ID> python-http-demo:1.0`**

## Pushing to a Repo

 1. If you are going to push the image to Docker Hub or a private repo,
    you will first need to **`docker login`**
    
 2. Next, you will need to create an additional tag to your local image:
 **`docker tag <IMAGE ID> <HUBUSER_ID>/python-http-demo:1.0`**
 
 3. Last, you will push the image via the command: **`docker push <HUBUSER_ID>/python-http-demo:1.0`**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_11.md)
