## Run a docker container with the new image
After creating the container image we need to create an instance and run it.

1. Execute the command: 
 **`docker run -it --name python-demo -p 8080:8080 python-http-demo`** 
 
    This starts up an interactive session instance of the python-http-demo instance named python-demo, and publishes the exposed internal port 8080 to the host's port 8080
    
2. Open your browser to <http://localhost:8080> and verify you see our logo

3. *If you forget to name it, it will assign a random name for you and you can find it using **`docker ps -a`** after you're done running it.*
4. Press **ctrl+c** to exit the container
 
    **As we used the `--name python-demo` parameter, we cannot create another with the same name later on in the demo unless we remove the one we created here.**
 5. Clean up your instance of this docker image with the command: 
 **`docker rm python-demo`** so that we can reuse that name again later

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_7.md)
