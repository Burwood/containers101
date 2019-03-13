## Create a Dockerfile for Windows

The **Dockerfile** is what the docker engine requires to build new images and is essentially written in a do this, then that recipe style. Let's build a sample app!

 1. Clone the repo:  **`https://github.com/dotnet-architecture/eShopModernizing/tree/master/eShopLegacyMVCSolution`**
 2. In the newly created directory, create a file named **Dockerfile** with the below contents and fill in your name.

```
`FROM microsoft/aspnet  
LABEL maintainer="James Anderton <janderton@burwood.com>"
LABEL description="Demo Python App"
ARG source  
WORKDIR /inetpub/wwwroot  
COPY ${source:-obj/Docker/publish} . `
```

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/azure/task_5.md)
