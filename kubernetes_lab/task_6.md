## Expose a Deployment via a Service
In tasks 3 and 4 we used a pod that had a defined containerPort and communicated with it via the Pod's IP address. However, Pods are intended to be ephemeral and this creates a problem when you have an application with front-end pods that talk to back-end pods and other services. You need a stable IP something to keep track of where they are all located. The **Service** abstraction enables this by keeping track of the coming and going of pods for the deployments that it is coupled to. There are several ServiceTypes available, and the cluster-internal **ClusterIP** is the default. 

Let's make our application available to the cluster via a service.

 1. Using the yaml file I created, use **`kubectl create -f https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/python-app-service.yml`** to create the python-app service object and use **`kubectl get service`** to verify it was created![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_service.png)

 2. Use **kubectl** and the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/sleep-pod.yaml)  from task 3 to create another sleep-pod.
13. Use **kubectl get service** to get the Service's IP address
14. Now, use **kubectl exec**  on the **sleep-pod** pod to open a **`/bin/sh`** and use **`curl http://<IP_ADDRESS>:80`** to see that the port is open![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_curl_service.png)

15. **This time, leave your deployment and service running for our next task**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_7.md)
