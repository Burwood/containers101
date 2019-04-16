## Pulling Images
In order to pull images from a non-local repository, you need to either execute a **`docker pull`** or have the **FROM** command in your Dockerfile.

1. Try it now with the node container we searched for earlier:
**`docker pull docker.io/node`**
![Docker pull](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_docker_pull_posh.png)
You will see it pull down all the layers this image is made up of and reconstitute them for use locally. If you run it a second time it will look for changes and only pull the changed layers.

2. What's going on inside this image? As mentioned before, lets execute the following command: **`docker inspect node`**. 

Pay special attention the fields **Parent**, **ENV**, **Cmd**,  among other things for things you may need to know when troubleshooting.
![Docker inspect](https://github.com/Burwood/containers101/blob/azure/containers_lab/images/Azure_docker_image_inspect_posh.png)


[Continue to the Next Task using .NET Core](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_4_win.md)
[Continue to the Next Task using Python](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_4.md)
