## Pulling Images
In order to pull images from a non-local repository, you need to either execute a **`docker pull`** or have the **FROM** command in your Dockerfile.

Try it now with the node container we searched for earlier:
**`docker pull docker.io/node`**

You will see it pull down all the layers this image is made up of and reconstitute them for use locally. If you run it a second time it will look for changes and only pull the changed layers.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/azure/task_4.md)
