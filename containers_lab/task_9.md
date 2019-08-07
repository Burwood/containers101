## How do I modify a file in a running container?
While in production, containers are intended to be immutable and should only be changed via replacing the existing container with a new instance from an updated image build, but sometimes while developing the initial container image we need to troubleshoot a problem and this can require updating a file. Let's explore this...

 1. Create a detached container on port 8080 named **rubber-duck** to run our python demo from [task 6](https://github.com/Burwood/containers101/blob/master/containers_lab/task_6.md)
 2. Press the Web Preview button Or Open a brower tab to **`http://localhost:8080`** and note the image
 3. From the [previously cloned git repo directory](https://github.com/Burwood/python-http), execute the command: **`docker cp src/duck.png rubber-duck:/app/logo.png`**
 4. Refresh your browser page and you should be rewarded with a picture of very useful debugging tool.(credit to the [Pragmatic Programmer](https://www.youtube.com/watch?v=huOPVqztPdc))
 ![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/duck.png)
 
 
 5. Once again, stop and delete the container instance 
    
[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_10.md)
