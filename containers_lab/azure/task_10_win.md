# Tagging and pushing a container to the registry

## Tagging Images

Adding a tag to your image is quite simple because the Docker developers have rolled the necessary tools into the docker command.
Assuming you're tagging a local image you would use the format: `docker tag <IMAGE ID> image/TAG`

Lets try it out

 1. Execute the command: **`docker image ls dotnet-demo`** to get the Image ID of the image we created earlier in task 6
 2. Next execute the command: **`docker tag  <IMAGE ID> dotnet-demo:v1`**

## Pushing to a Repo
 3. As we will be using Azure's Container Registry (ACR) we need to set it up and login
 4. First create a Resource Group using the command **`az group create --name containers101 --location centralus`** and you can verify it with **`az group show --name containers101`**
![az group show](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_group_show_posh.png)

 5. Next create a container registry with the command **`az acr create --resource-group containers101 --name <firstNameLastNameACR> --sku Basic`** **the name has to be dns unique**
![az acr create](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_acr_create_posh.png)

 6. Now, execute the following command to build, tag, and upload our image to your ACR **`az acr build --registry <firstNameLastNameACR> --image dotnet-demo:v1 .`**
![az acr build](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_dotnet_acr_build_posh.png)

 - - - -

If you are going to push the image to Docker Hub or another private repo, you will first need to login via the **`docker login`** command

  1. Then, you would need to create an additional tag to your local image: **`docker tag <IMAGE ID> localrepo.io/<username>/dotnet-demo:v1`**
  2. Last, you would push the image via the command: **`docker push localrepo.io/<username>/dotnet-demo:v1`**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_11.md)
