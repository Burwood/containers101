# Tagging and pushing a container to the registry

## Tagging Images

Adding a tag to your image is quite simple because the Docker developers have rolled the necessary tools into the docker command.
Assuming you're tagging a local image you would use the format: `docker tag <IMAGE ID> image/TAG`

Lets try it out

1. Execute the command: **`docker image ls python-http-demo`** to get the Image ID of the image we created earlier in task 6
2. Next execute the command: **`docker tag  <IMAGE ID> python-http-demo:1.0`**

## Pushing to a Repo
3. As we will be using Azure's Container Registry (ACR) we need to set it up and login
4. Execute the command **`az group create --name containers101 --location centralus`** and you can verify it with **`az group show <firstName.LastName.acr>`**
![az group show](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_group_show_posh.png)

5. Next execute the command **`az acr create --resource-group containers101 --name <firstNameLastNameACR> --sku Basic`**
![az acr create](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_acr_create_posh.png)

6. Now, execute the following command to build, tag, and upload our image to your ACR **`az acr build --registry <firstNameLastNameACR> --image python-http-demo:v2 .`**
![az acr build](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_cli_build_posh.png)


7. **If you are going to push the image to Docker Hub or another private repo,
    you will first need to **`docker login`** **
    
  8. Then, you would need to create an additional tag to your local image:
 **`docker tag <IMAGE ID> localrepo.io/<username>/python-http-demo:1.0`**
 
  9. Last, you would push the image via the command: **`docker push localrepo.io/<username>/python-http-demo:1.0`**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_11.md)
