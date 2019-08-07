## Cleaning up old images and containers
Developing locally with containers is handy in many ways but it can quickly eat up space on small cloud instances or laptops so its a good habit to get into cleaning up your instances and images. 

So let's clean up the mess we made:

 1. First execute the command: **`docker container prune`**
 2. Next run: **`docker image prune`**
 4. Lastly, run **`docker image prune -a`** and note the difference...
 4. Now run: **`docker volume prune`**


[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_12.md)
