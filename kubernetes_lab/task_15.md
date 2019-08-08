## Automating Kubernetes Deployments with Google Cloud Build

So far we've worked directly with the **kubectl** command to deploy our applications into the cluster, and that is fine for testing, but in production you only want your automation to have access launch applications into the cluster. Let's try using Google Cloud Build to build our image, store the image in the repo, and then deploy the image into our clusters. If you have already completed [Container Lab/Task 12](https://github.com/Burwood/containers101/blob/master/containers_lab/task_12.md) please back and re-clone the repo and re-upload it to your Google Cloud Source Repository, so you have the latest code... OR if you havent done the Container Lab/Task 12, please go there and setup your container and image repositories and then come back.

 1. From the cloud shell, use **```kubectl apply -f https://github.com/janderton/golang-http-demo/raw/master/deployment.yaml```** to launch our Golang demo app into the cluster.
 
 2. Use **kubectl** to get and describe the pod in the **demo namespace** and note its image name and version tag.

 3. In your cloud shell, in the go demo app source code update the file **k8s.cloudbuild.yaml** to change the lines below to have your cluster region (ie. us-east1) and your cluster name and commit this file to your Google Cloud Source Repository.
:
```  env:
  - 'CLOUDSDK_COMPUTE_ZONE=<$YOUR_CLUSTER_REGION>'
  - 'CLOUDSDK_CONTAINER_CLUSTER=<$YOUR_CLUSTER_NAME>'
```

 3. Following the same procedures we used in Container Lab/Task 12, create a new trigger using a **Cloudbuild File** named **k8s.cloudbuild.yaml**, then **Run the Trigger**

 4. Use **kubectl** to get and describe the pod in the **demo namespace** and note its image name and **new** version tag.

 5. Finally, from the command-line, go ahead and **`kubectl delete -f https://github.com/janderton/golang-http-demo/raw/master/deployment.yaml`** to clean everything up.



[Return to the Index](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/README.md)
