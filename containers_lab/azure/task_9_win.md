## How do I modify a file in a running container?
While in production, containers are intended to be immutable and should only be changed via replacing the existing container with a new instance from an updated image build, but sometimes while developing the initial container image we need to troubleshoot a problem and this can require updating a file. Let's explore this...

 1. Create a detached container on port 8080 named **rubber-duck** to run our dotnet demo from [task 6](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_6_win.md) **See [task 7](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_7_win.md) to refresh how to create a detached container**
 2. Open a brower tab to **`http://<IP_ADDRESS>:8080`** and note the image
 3. Execute the command: **`wget https://github.com/Burwood/containers101/raw/azure/containers_lab/images/duck.svg -O ~/duck.svg`** to download a new image to swap into the image carousel on our app
 4. Now, execute the command: **`docker cp ~/duck.svg rubber-duck:/app/wwwroot/images/banner1.svg`**
 5. Refresh your browser page and in slot one on the image carousel you should be rewarded with a picture of very useful debugging tool.(credit to the [Pragmatic Programmer](https://www.youtube.com/watch?v=huOPVqztPdc))
 ![enter image description here](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/duck.png)
 
 
 6. Once again, stop and delete the container instance 
    
[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_10_win.md)
