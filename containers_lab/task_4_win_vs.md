## Create a Dockerfile for Windows **SEE AZURE BRANCH FOR UPDATED WINDOWS CONTENT**

The **Dockerfile** is what the docker engine requires to build new images and is essentially written in a do this, then that recipe style. Let's publish a sample app with Visual Studio!

 1. Clone the repo:  **`https://github.com/dotnet-architecture/eShopModernizing/tree/master/eShopLegacyMVCSolution`**
 2. In the newly created directory, open the Solution File (**eShopLegacyMVC.sln**)

Visual Studio 2017 provides great support for containerizing an application. You right-click the project node and then select Add and Docker Support. The Docker project template adds a new project to the solution called docker-compose. The project contains the Docker assets (simple .yml metadata files) that compose the Docker images and containers' startup settings you need, as shown in the figure below.

![image](https://github.com/Burwood/containers101/raw/master/containers_lab/images/vs_add_docker.png)

Then, in the next figure you can see how your project and solution has been modified with the Docker metadata.

![image](https://github.com/Burwood/containers101/raw/master/containers_lab/images/vs_add_docker_metadata.png)

In the simplest monolithic scenarios like this one, the application will be the single application service/container defined at the docker-compose.yml file that you will need to deploy. In other more complex scenarios like N-Tier applications, you will have a multi-container application defined in the docker-compose.yml file. The template also changes your startup project to point to the docker-compose project so it will run on Docker when launching the solution. Pressing Ctrl+F5 or F5 now compiles the .NET application bits, creates the Docker image and launches the Docker container all in a single step for you, as shown in the next image.

![image](https://github.com/Burwood/containers101/raw/master/containers_lab/images/vs_show_container_app.png)
```

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_5.md)
