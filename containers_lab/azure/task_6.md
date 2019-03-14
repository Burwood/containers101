## Run a docker container with the new image
After creating the container image we need to create an instance and run it.

1. Execute the command: **`docker-machine url $machineName`** and take note of the ip address
2. Next, execute the command: **`az vm open-port --resource-group docker-machine --name $machineName --port 8080`**
2. Now execute the command: 
 **`docker run -it --name python-demo -p 8080:8080 python-http-demo:v2`** 
 
    This starts up an interactive session instance of the python-http-demo instance named python-demo, and publishes the exposed internal port 8080 to the host's port 8080
    
3. In your browser, use the IP Address from step 1 to verify the app is running and you see our logo ![Verify App](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_browse_app.png)

_If you are developing locally, open your browser to <http://localhost:8080>_

4. *If you forget to name it, it will assign a random name for you and you can find it using **`docker ps -a`** after you're done running it.*
5. Press **ctrl+c** to exit the container
 
    **As we used the `--name python-demo` parameter, we cannot create another with the same name later on in the demo unless we remove the one we created here.**
6. Clean up your instance of this docker image with the command: 
 **`docker rm python-demo`** so that we can reuse that name again later

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_7.md)
