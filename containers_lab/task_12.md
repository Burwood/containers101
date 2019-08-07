## Automating Container Builds with Google CloudBuild

Mental context switching is one of the quickest ways to kill a programmer's productivity. Remembering how to build Docker Images can sometimes be just enough of a context switch to take the programmer out of "the zone", so let's automate the builds and keep them to their comfort zone of just committing code to a Git Repo!

 1. Let's clone the [go-http-demo repo](https://github.com/janderton/golang-http-demo.git) into your cloud shell or local environment if you havent already
 
 2. Now, let's create a [**Google Cloud Source Repository**](https://source.cloud.google.com/)

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCSR_Add_Repo.png)

Choose Create a New Repo
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCSR_Create_New_Repo.png)

Give the repo the name golang-http-demo
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCSR_New_Repo_Name.png)

Now take note on how to push the code from our previously cloned repo into the new repo
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCSR_Push_Local_Code.png)

Now that we have a Google Source Code Repository, we're all ready to setup the **Triggers** to receive the webhooks when a new commit is made to the repo.

 1. First, we need to open **Google Cloud Build** in the [GCP Console](https://console.cloud.google.com/cloud-build/builds)

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild.png)

 2. Next, we need to create a new **Trigger**

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Create_Trigger.png)
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Create_Trigger_GCSR.png)

Choose the defaults provided except for the **Dockerfile Name**... use **Dockerfile.monolithic**

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Create_Trigger_GCSR_Docker_Options.png)

 3. Click on the "Run Trigger" link on the right
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Finished_Trigger.png)

 4. Now Click on **History** link to the left to follow what it is doing
![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_History.png)

 5. Go to the **Google Container Repository** [GCR.IO](https://console.cloud.google.com/gcr/images/) and check out your new container


You can choose from one of two types... a simple "Dockerfile" build where upon receiving a webhook from github/bitbucket it goes and reads the Dockerfile it finds in the given repo and builds an image from it, and tags it with a single specific tag, then pushes it to a repo. You can only use one tag this way and only do this one thing, but for building base images, it's often enough. 

**Now, let's say you want to tag an image with a specific build number for versioning**, but you also want to have a **latest** tag for nightly images.

 6. Let's use the **cloudbuild file** option to try that. In the github repo we've already used for our go-http-demo app I've prepared a cloudbuild.yaml file for you that you can see below:

```
steps:

- name: 'gcr.io/cloud-builders/docker'
  args: [
    'build',
    '-t', "gcr.io/$PROJECT_ID/go-http-demo:$SHORT_SHA",
    '-t', "gcr.io/$PROJECT_ID/go-http-demo:latest",
    '--file', "Dockerfile.monolithic",
    '.']
  id: 'build_monolithic'
  timeout: 600s

- name: 'gcr.io/cloud-builders/docker'
  args: ['push', "gcr.io/$PROJECT_ID/go-http-demo:$SHORT_SHA"]
  id: 'push_short_sha'
  wait_for: ['build_monolithic']

- name: 'gcr.io/cloud-builders/docker'
  args: ['push', "gcr.io/$PROJECT_ID/go-http-demo:latest"]
  id: 'push_latest'
  wait_for: ['build_monolithic']

images: [
  "gcr.io/$PROJECT_ID/go-http-demo:$SHORT_SHA",
  "gcr.io/$PROJECT_ID/go-http-demo:latest",
]
```

You can see it's a yaml file and the steps are marked by:
 * **-name:** ```<name of the builder image to use>```
 * The args to pass it
 * An identifier for logging and control
 * A timeout value
And lastly, the images being produced.

 4. Go ahead and create a **New Trigger** and choose **Cloudbuild File** this time instead... Then Click the **Run Trigger** link next to it and follow along on the **History page** from the menu on the left.

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Finished_Trigger.png)

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_History.png)

 5. Go to the **Google Container Repository** [GCR.IO](https://console.cloud.google.com/gcr/images/) and check out your new containers!

![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/GCP_CloudBuild_Result.png)

[Return to the Index](https://github.com/Burwood/containers101/blob/master/containers_lab/README.md)

