## Creating and using labels, selectors and annotations
When you get going, you may have a dozen or so pods in development, but when you make it to production (especially with a microservice based app) you could have hundreds of pods in your cluster and you'll need a way to categorize and work with these pods for debugging, deployment, and logging. Lets apply some labels and try it out.

 1. Redeploy our **python-app-deployment.yaml** file from the last task
 2. Use **kubectl** to get a list of the pods that were created
 3. Execute the command **`kubectl label pods python-app-<uuid> app.owner=janderton`** for one of the pods
 4. Now use **kubectl** to get the pods and use --show-labels=true to show all the labels
 5. Try **`kubectl get pods -L app.owner`** or **`kubectl get pods -l app.owner=<USER_NAME>`** as well to show the label in **get pods** output or to filter on just that label![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_pod_labels.png)

 6. Copy the **python-app-deployment.yaml** file from before and save it as **python-app-prod-deployment.yaml**. Change the name and labels accordingly.
 7. Use **kubectl** to create a new deployment with this file.
 8. Use the command **`kubectl label deployments python-app environment=development`** and **`kubectl label deployments python-app -prod environment=production`**  to create an environment label
 9. Use the command **`kubectl label deployments python-app tier=frontend`** and **`kubectl label deployments python-app-prod tier=frontend`**  to create an tier label
  
    
Via a _label selector_, you can identify a set of objects. The label selector is the core grouping primitive in Kubernetes and allows you to say "All objects with this label are part of this deployment". There are two kinds of selectors, **Equality based** and **Set based**. That is to say for example:
```
environment = production
tier != frontend
```
is an equality based  selector, while this for example:
```
environment in (production, qa)
tier notin (frontend, backend)
partition
!partition
```
is a set based selector.
 
 11. Let's  use the **`kubectl  get deployments -l environment=development,tier=frontend`** to find only the pods matching both labels![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_multi_labels.png)
 
 Annotations, are like labels in that they are a key/value metadata about an object, but unlike labels, they are not used for selection and the metadata in an annotation can be small or large, structured or unstructured, and can include characters not permitted by labels. This metadata can be read via the api and used in third-party management applications. 
 
 12. Execute the command  **`kubectl annotate deployment python-app app.owner.pager='(909) 999-9999'`** to give the deployment an app owner phone number.
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_annotations.png)

13. Once again, make sure do delete your deployments with **kubectl**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_6.md)
