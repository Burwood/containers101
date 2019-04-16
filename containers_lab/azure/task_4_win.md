
## Dockerfile for Windows Container

The **Dockerfile** is what the docker engine requires to build new images and is essentially written in a do this, then that recipe style. Let's build a sample app!

 1. Clone the repo:  **`https://github.com/cwilhit/SampleASPContainerApp.git`**
 2. In the newly created directory, create a file named **Dockerfile** with the below contents. (you can issue the command **`code Dockerfile`** to open it in VS Code) and add the below contents:

``` 
FROM microsoft/aspnetcore:1.1
WORKDIR /app
COPY ./out/ .
EXPOSE 80
ENTRYPOINT ["dotnet", "MvcMovie.dll"]
```

![Edit Dockerfile](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_vscode_dotnet_dockerfile_posh.png)


[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_5_win.md)
