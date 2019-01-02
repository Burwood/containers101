## How do I modify a file in a running container?
While in production, containers are intended to be immutable and should only be changed via replacing the existing container with a new instance from an updated image build, but sometimes while developing the initial container image we need to troubleshoot a problem and this can require updating a file. Let's explore this...

 1. Execute the command: **`docker run -it --name python-demo -p 8080:8080 python-http-demo`** to run our python demo from task 6
 2. Open a brower tab to **`http://localhost:8080`** and note the image
 3. From the [previously cloned git repo directory](https://github.com/Burwood/python-http), execute the command: **`docker cp src/duck.png python-demo:/app/logo.png`**
 
 You should be rewarded with a picture of very useful debugging tool.(credit to the [Pragmatic Programmer](https://www.youtube.com/watch?v=huOPVqztPdc))
 ![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/duck.png)
 
 
 4. Once again, press **ctrl+c** to kill the container and run **```docker
    rm python-demo```** to delete the container instance 
[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_10.md)
