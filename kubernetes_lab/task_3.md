## Deploy and manage a pod
A _Pod_ is the basic building block of Kubernetes, is the smallest and simplest unit in the Kubernetes object model that you create or deploy and is a group of one or more containers that are always co-located, co-scheduled, run in a shared context with shared storage/network, and have a specification for how to run the containers. Let's check out how to deploy a pod.

1. Clone the repo:  **`https://github.com/Burwood/python-http.git`**
2. In the newly created directory, create a file named**Dockerfile**, change it to match below:

```
FROM alpine:latest
LABEL maintainer="James Anderton <janderton@burwood.com>"
LABEL description="Demo Python App"
COPY ["requirements.txt", "."]

RUN apk --update add --no-cache python3 py3-pip \
&& pip3 install -U pip \
&& pip3 install -r requirements.txt \
&& pip3 list modules

ENV PORT 8080
EXPOSE 8080

WORKDIR /app
COPY ["src/", "/app/"]

ENTRYPOINT ["python3"]
CMD ["app.py"]
```
 1. Go ahead a build the docker file
 2.  Next tag the image `gcr.io/[PROJECT-ID]/[IMAGE]` using your google project id (containers101) and an image name, and push it to your repo
 3. Now execute the command **`kubectl run app gcr.io/[PROJECT-ID]/[IMAGE]`**
 4. To verify your pod is running correctly let's run **`kubectl get pods`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_pods.png)

 5. If **`kubectl run`** ran successfully, but your **STATUS** shows ImageBackoff, you can run **`kubectl logs pod <pod-id>`** and see if the runtime left any useful errors. Oftentimes the CMD in the Dockerfile was wrong.
 6. Next lets dump out the Pod's YAML description so we can take a look:
**`kubectl get pod <pod-id> --output yaml`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_pod_yaml.png)
It is pretty much the same as what you get when you describe the pod, however, now you can trim the excess and reuse it as a template for other pods

Let's use the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/python-app-pod.yml)  I prepared and create a new pod:

7. Copy the contents of the file and paste it into a new file in the Cloud Shell called **python-app-pod.yaml**
8. Now create the new pod with the command: **`kubectl create -f python-app-pod.yaml`**
9. Use the **`kubectl get pods`** command to see if your pod was created
10. Lets's verify your pod another way, run **`kubectl exec -it python-app /bin/sh`** to enter a shell session your pod and run the **`ls`** command
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_pod.png) 
While the pod will only give you a session if the container started up correctly, this can be a valuable tool on many occasions when your pod half-way works.
11. Type **`Exit`** to leave the pod shell session

    Now, let's use another pod to test and see that our port is available.
12. Using **kubectl** and the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/sleep-pod.yml)  I prepared to create a pod called sleep-pod.
13. Use **kubectl describe** to get the Pod's IP address
14. Now, use **kubectl exec** to open a **`/bin/sh`** and use **`curl http://<IP_ADDRESS>:8080`** to see that the port is open![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_curl_pod.png)

    *You will notice, if you try to reach the python app from outside the cluster, it will not be available. You will need  a few more pieces to make it available and we will walk through those in the coming labs.*

16. Run the command **`kubectl delete pod python-app`** to remove the pod we created.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_4.md)
