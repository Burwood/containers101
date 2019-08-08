## View workloads from the GKE Dashboard


 1.  In your browser, open up the [GKE Console](https://console.cloud.google.com/kubernetes/workload?) to the workloads section
 Here, you can see all of the **Deployments** we have ran and the various namespaces they belong to.
 ![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_workload_view2.png)

2. Next click on the **python-todo** deployment to see your deployments details and notice at the bottom it lists the pods.
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_workload_deployment.png)

3. Now click on the python-todo pod to see your pods details and notice at the top, there's a **logs** tab which can come in handy when troubleshooting a new deployment package![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_workload_pod.png)

4.  Now click on **Services** on the left and choose the **python-todo-service** and notice the **External endpoints** and **Load Balancer IP**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_services_detail.png)
 
 3. Finally, from the command-line, go ahead and **`kubectl delete namespace secure-app`** to clean everything up.



[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_15.md)
