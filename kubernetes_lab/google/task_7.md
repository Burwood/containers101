## Create an Ingress

In general Kubernetes is a declarative system and as we noticed in tasks 3 and 4, you cannot communicate with pods from outside of the cluster by default. An Ingress is an API object that manages external access to the services in a cluster, (typically HTTP) and provides load balancing, SSL termination and name-based virtual hosting. Ingress, added in Kubernetes v1.1, exposes HTTP and HTTPS routes from outside the cluster to  [services](https://kubernetes.io/docs/concepts/services-networking/service/)  within the cluster. Traffic routing is controlled by rules defined on the ingress resource.

```
    internet
        |
   [ Ingress ]
   --|-----|--
   [ Services ]
```
One thing to note, An ingress does not expose arbitrary ports or protocols. Exposing services other than HTTP and HTTPS to the internet typically uses a service of type **Service.Type=NodePort** or **Service.Type=LoadBalancer**.
The major difference between a **Service** and an **Ingress** is the first is "Layer 4" (TCP/UDP over IP) and the second is "Layer 7" (HTTP)

Lets create an Ingress so we can see our application from a browser:

 1. Using the [yaml](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/python-app-ingress.yaml) file I created, run the command **` kubectl create -f python-app-ingress.yaml`** to create your Ingress object. **Note: Even though it completes right away, it will be pending for a few minutes. Keep checking with the `kubectl get ingress` command and wait till there is an IP Address assigned.**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_ingress.png)

 2. Once complete, open your browser to the IP address listed for the ingress and you should see our logo.
 3. Now, run the command: **`kubectl describe ingress python-app-ingress`** and note the **Rules** section:
 ```
 Rules:
  Host  Path  Backends
  ----  ----  --------
  *        /   python-app-service:80 (<none>)
```
4. Lastly, the command **`kubectl edit ingress python-app-ingress`** and note that you can edit the ingress details like **paths** on the fly. Normally one should do this intentionally via yaml files stored in source control, but sometimes this is useful for debugging.

5.  Once again, leave your Ingress, Service, and Deployment in place for the next task.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_8.md)
