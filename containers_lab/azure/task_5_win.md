## Build a docker image
After you've created your Dockerfile, you need to compile the image.

 1. Since this is a .NET Core app, we will need to make sure we have the .NET Core Runtime 
 1. Execute the command: `docker build -t dotnet-demo:v1 .`
 2. You will see it pull down the windows base image container if you don't already have it locally... it is quite large and may take some time. Then it will walk through your build steps one by one creating new layers
 3. When it's done, you can execute the command `docker images` and see the newly created image. (Note its size!)
 5. Execute the command: `docker image ls` again and note the size.

![Docker image ls](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_docker_image_ls_posh.png)

**It pays to know the source of your container images and often times you'll end up making your own due to size or package constraints.**


[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_6.md)
