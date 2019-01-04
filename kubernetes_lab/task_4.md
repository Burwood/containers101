## Deploy an application via a Deployment Object
As Pods are meant to be ephemeral in nature, you will almost never want to actually deploy a stand alone pod. One of the biggest reasons being that there will be nothing there to restart the containers when the pod dies due to an environmental or user caused problem. There have been several attempts to solve this dilema, and Deployments are the way the community has chosen to standardize on. Lets explore Deployments.

 1. Use **kubectl** to get a list of the deployments currently in the cluster. The deployment object **app** was created by default when we used **`kubectl run <image:tag>`** in the prior task as opposed to creating a standalone pod.
 2. Next use **kubectl** to get the deployment named **app** and --output it to a yaml file![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_deployment.png)

 3. Note the **spec** section of the deployment yaml... it has keys such as **strategy** which controls how the pods are updated, and **template** which lays out the spec for how the pods are built as well as labels for both and a namespace.
 
 4. Copy the contents of the yaml deployment file **python-app-pod.yaml** and name the new file **python-app-deployment.yaml**
 5.  Now use **kubectl** to create a deployment with the new file![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_deployment.png)

 6. Use **kubectl** and delete one of the python-app pods, then note what happens when you use **`kubectl get pods`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_delete_pods.png)
The deployment creates a new pod and schedules the old one for termination but waits till the new one is running plus the termination-graceperiod stated in the deployment file's pod spec.
7. Use **kubectl** to clean up our mess but pay attention and delete the **deployment** object or you'll just watch a new pod get created again.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_6.md)
