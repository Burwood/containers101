## Using a Service Account with your application

When you access the cluster (for example, using `kubectl`), you are authenticated by the apiserver as a particular User Account. Processes in containers inside pods can also contact the apiserver. When they do, they are authenticated as a particular Service Account. Every namespace has a default service account resource called  `default`. 

1. List the serviceAccount resources in the namespace with this command: **`kubectl get serviceAccounts`**

```shell
kubectl get serviceAccounts
NAME      SECRETS    AGE
default   1          1d
```
To use a non-default service account, simply set the `spec.serviceAccountName` field of a pod to the name of the service account you wish to use.  

Lets create a service account in our secure-app namespace:

2. Use the command **`kubectl -n secure-app create serviceaccount secure-app`** to create our secure-app service account

3. Use **kubectl** to describe the **serviceaccount**

4. Using the command **`kubectl -n secure-app get serviceaccount secure-app -o yaml`** dump out the yaml version and think about what you'd need to be able to create your own from a file later.

You will wind up with something like this: (plus some labels)
 ```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: secure-app
  namespace: secure-app
 ```

5. Let's recreate that Mongo Service and StatefulSet in our `secure-app` namespace.
    1. Create the mongo service on our namespace from this [mongo-service.yaml](https://raw.githubusercontent.com/Burwood/containers101/master/kubernetes_lab/assets/mongo-service.yaml) file
    2. Use this [diff](https://gist.github.com/janderton/806165940859978fe525236ea8c8a858) to see where to modify the [mongo-statefulset.yaml](https://raw.githubusercontent.com/Burwood/containers101/master/kubernetes_lab/assets/mongo-statefulset.yaml) from before then **kubectl** to create it
    3. connect to the mongo pod and initialize the mongo replic set   
    **`kubectl -n sample-app exec -it mongo-0 mongo`**   
    **`rs.initiate()`**
 
6. Next, use the provided [yaml file](https://github.com/Burwood/python-mongo_todo/raw/master/python-todo-deployment.yaml) to deploy a pod using the secure-app service account. This will also point to the configMap we created earlier to grab that mongo-uri.

7. Display the pods in our **secure-app** namespace and describe the pod created for the python-todo deployment![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_use_serviceaccount.png)

   Now lets deploy a service so we can see our application. 
8. Use the [yaml file](https://github.com/Burwood/python-mongo_todo/raw/master/python-todo-service.yaml) provided to **kubectl** create the service

9. Use **kubectl describe** and check periodically to see when your service has an external IP address and open it in the browser once it does.

 ![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_view_python-todo.png)

   Its a lonely web form, but it takes a key/value pair and feeds it to our mongo service and reads back all the values that have been entered.
   
10. For now, let's leave our pods running.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_13.md)
