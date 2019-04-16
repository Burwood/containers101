## Build a docker image
After you've created your Dockerfile, you need to compile the image.

 1. Since this is a .NET Core app, you would need to make sure we have the .NET Core Runtime, but using Azure Cloud Shell we already have this installed.
 2. First execute the command **`dotnet restore`**
 3. Next run the command **`dotnet publish -c Release -o out`**
 1. Execute the command: **`docker build -t dotnet-demo:v1 .`**
 2. You will see it pull down the windows base image container if you don't already have it. (It is quite large and may take some time, this is why you're using Azure instead of a local laptop!) Then it will walk through your build steps one by one creating new layers
![Docker image ls](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_vscode_dotnet_dockerbuild_posh.png)
 3. When it's done, you can execute the command **`docker images`** and see the newly created image. (Note its size!)

![Docker image ls](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_dotnet_docker_image_ls_posh.png)

**It pays to know the source of your container images and often times you'll end up making your own due to size or package constraints.**


[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_6_win.md)
