# Tagging and pushing a container to the registry

## Tagging Images

Adding a tag to your image is quite simple because the Docker developers have rolled the necessary tools into the docker command.
Assuming you're tagging a local image you would use the format: `docker tag <IMAGE ID> image/TAG`

Lets try it out

 1. Execute the command: **`docker image ls python-http-demo`** to get the Image ID of the image we created earlier in task 6
 2. Next execute the command: **`docker tag  <IMAGE ID> python-http-demo:1.0`**

## Pushing to a Repo
**This is the first task requiring the Google Cloud Trial Account being activated** If you do not wish to activate the trial, you can sign up for and use Docker Hub.
 1. As we will be using Google's Container Registry (GCR) we need to enable the docker helper. 
 2. In the Cloud Shell, execute the command: **`gcloud auth configure-docker`** and you will see something like
```
The following settings will be added to your Docker config
filelocated at [/home/anderton_james/.docker/config.json]:
{credHelpers": { "gcr.io": "gcloud", "us.gcr.io": "gcloud", 
eu.gcr.io": "gcloud", "asia.gcr.io": "gcloud", "staging-k8s.gcr.io": 
gcloud", "marketplace.gcr.io": "gcloud" }}Do you want to continue 
Y/n)? y
Docker configuration file updated.
```
 3. If you are going to push the image to Docker Hub or a private repo,
    you will first need to **`docker login`**
    
 4. Now, execute the command **```gcloud projects list```** to get your PROJECT_ID **Note that its not always the same as the Project Name**

```
lab$ gcloud projects list
PROJECT_ID                      NAME                            PROJECT_NUMBER
acoustic-cargo-230321           My First Project                1039024787855
ai-lab-196622                   AI Lab                          799823614232
```

 5. Next, you will need to create an additional tag to your local image:
 **`docker tag <IMAGE ID> gcr.io/<PROJECT_ID>/python-http-demo:1.0`** where PROJECT_ID is your Google project id (containers101)
 
 6. Last, you will push the image via the command: **`docker push gcr.io/<PROJECT_ID>/python-http-demo:1.0`**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_11.md)
