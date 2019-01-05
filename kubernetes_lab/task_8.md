## Create a new Namespace for a second application
The need for unique resource names, application and team isolation, security boundaries and more brought about the creation of **Namespaces** as a means for multi-tenancy in Kubernetes. Here we are going to start up a second namespace and deploy an application, showing the separation between its resources and the others.

 1. Use the command **`kubectl create namespace sample-app`**
 2. Give your namespace a label **app** equals **sample-app *(we learned how to do this in step 5)*![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_namespaces.png)

 3. Using the **kubectl ** command, view the pods in the default namespace.
 4. Now use the command **`kubectl -n sample-app get pods`** to view what you can see from the new namespace![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_pods_in_namespaces.png)

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_9.md)
