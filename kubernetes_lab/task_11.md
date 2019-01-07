## Using ConfigMaps and Secrets

The well known twelve-factor methodology for building modern apps states that configuration should be injected into containers at runtime. These values are expected from one of the following: 1.) The command line. 2.) Environment variables or 3.) From files or volumes.

We are going to setup an environment variable for a python app so that we can set it's MONGO_URI dynamically.
1. Use **kubectl** to create the secure-app namespace
 2. Using **`kubectl -n secure-app create -f https://github.com/Burwood/python-mongo_todo/raw/master/python-todo-configmap.yaml`** generate our **ConfigMap**
 3. Use both **`kubectl get configmap <object> -o yaml`** and **`kubectl describe`** to view the contents![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_configmap.png)

This works great for things that you dont mind being out in the open, however, when you have access keys and secrets you'll want them to be stored opaquely so users cannot see them. Kubernetes Secrets take care of this for us.

 1. Using the below, create a yaml file and upload it to the **secure-app** namespace
 ```apiVersion: v1
kind: Secret
metadata:
  name: backend-secrets
  namespace: secure-app
type: Opaque
data:
  IMAGE_PULL_SECRET: aHR0cDovLzRiMzFwc2QyaGw5bmxoOjVSZDJfNDF0VWc1RU5BUHQtWE1fbFdhWmNBQHVzLWVhc3Qtc3RhdGljLTA0LnF1b3RhZ3VhcmQuY29tOjkyOTM=
  ```
  
**Notice that the data for the secret has been ran through base64 encryption beforehand**

![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_secrets.png)

Notice that now, unlike with configMaps, the secret data is opaque and not available to the human eye.

For now, let's leave our Namespace/configMaps/Secrets intact.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_12.md)
