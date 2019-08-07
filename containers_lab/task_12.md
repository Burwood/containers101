##Automating Container Builds with Google CloudBuild

Mental context switching is one of the quickest ways to kill a programmer's productivity. Remembering how to build Docker Images can sometimes be just enough of a context switch to take the programmer out of "the zone", so let's automate the builds and keep them to their comfort zone of just committing code to a Git Repo!

 1. First, we need to open **Google Cloud Build** in the GCP Console

 2. Next, we need to create a new **Trigger**

You can choose from one of two types... a simple "Dockerfile" build where upon receiving a webhook from github/bitbucket it goes and reads the Dockerfile it finds in the given repo and builds an image from it, and tags it with a single specific tag, then pushes it to a repo. You can only use one tag this way and only do this one thing, but for building base images, it's often enough. Let's try it:


 3. Now, let's say you want to tag an image with a specific build number for versioning, but you also want to have a **latest** tag for nightly images. Let's use the **cloudbuild file** option to try that. In the github repo we've already used for our go-http-demo app I've prepared a cloudbuild.yaml file for you that you can see below:

```
steps:

- name: 'gcr.io/cloud-builders/docker'
  args: [
    'build',
    '-t', "gcr.io/$PROJECT_ID/go-http-demo:$SHORT_SHA",
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
 * **-name:** <name of the builder image to use>
 * The args to pass it
 * An identifier for logging and control
 * A timeout value
And lastly, the images being produced.


[Return to the Index](https://github.com/Burwood/containers101/blob/master/containers_lab/README.md)
