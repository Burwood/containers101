## Run a docker container with the new image
After creating the container image we need to create an instance and run it.

1. Execute the command: **`docker-machine url $machineName`** and take note of the ip address
![Verify App](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_docker-machine_url_posh.png)

2. Next, execute the command: **`az vm open-port --resource-group docker-machine --name $machineName --port 8080`**
![Verify App](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_open_port_posh.png)

3. Now execute the command: 
 **`docker run -it --name dotnet-demo -p 8080:80 dotnet-demo:v1`**
 
    This starts up an interactive session instance of the dotnet-demo:v1 instance named dotnet-demo, and publishes the exposed internal port 80 to the host's port 8080
    
4. In your browser, use the IP Address from step 1 to verify the app is running and you see our sample .NET Core App ![Verify App](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_dotnet_docker_run.png)

_If you are developing locally, open your browser to <http://localhost:8080>_

5. *If you forget to name it, it will assign a random name for you and you can find it using **`docker ps -a`** after you're done running it.*
6. Press **ctrl+c** to exit the container
 
    **As we used the `--name dotnet-demo` parameter, we cannot create another with the same name later on in the demo unless we remove the one we created here.**
7. Clean up your instance of this docker image with the command: 
 **`docker rm dotnet-demo`** so that we can reuse that name again later

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_7_win.md)
