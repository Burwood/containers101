## Using a Service Account with your application

When you access the cluster (for example, using `kubectl`), you are authenticated by the apiserver as a particular User Account. Processes in containers inside pods can also contact the apiserver. When they do, they are authenticated as a particular Service Account. Every namespace has a default service account resource called  `default`. 

1. List the serviceAccount resources in the namespace with this command: **`kubectl get serviceAccounts`**
```shell
kubectl get serviceAccounts
NAME      SECRETS    AGE
default   1          1d
```
To use a non-default service account, simply set the `spec.serviceAccountName` field of a pod to the name of the service account you wish to use.  Lets create a new namespace and provision a pod into it with a non-default service account:
2. Now, use the command **`kubectl -n secure-app create serviceaccount secure-app`** to create our secure-app service account
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

5. Next, use the provided [yaml file](https://github.com/Burwood/python-mongo_todo/raw/master/python-todo-deployment.yaml) to build a pod using the secure-app service account

6. Display the pods in our **secure-app** namespace and describe the pod created for the python-todo deployment![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_use_serviceaccount.png)

For now, let's leave our pods running.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_13.md)
