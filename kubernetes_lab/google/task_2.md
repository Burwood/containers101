## Learning your tools
Being an Orchestrator of Containers, there are various tools that you will use to manage Kubernetes. 

1. The most basic one is Kubectl (pronounced Cube-Cuddle or Cube-Control...[yes this is a religious argument](https://www.reddit.com/r/kubernetes/comments/5qthoc/how_should_i_pronounce_kubectl/))
Kubectl controls the Kubernetes cluster manager and our good friends at both Google and Docker have made life easier and included it in their SDK's now as well.
2. In the Cloud Shell, enter the **`kubectl`** command and take note of the commands and option available to you
 
3. First lets make sure we are working with the right cluster. Execute the **`kubectl config get-contexts`** command. This command is handy when you are working with multiple clusters as you see it tells you your current context and using the use-context option will allow you to switch between clusters.![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_config_get-contexts.png)
 
4. Execute the command **`kubectl cluster-info`** to see that you are connected to your cluster
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_cluster-info.png)

5. Now lets execute the **`kubectl get namespaces`** command![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_show_namespaces.png)
 Note that there is a **default** namespace and two **kube-\*** namespaces. Default is where your pods, deployments, etc. would go if you didnt specify a namespace and kube-* is for system level things like drivers and add-ons.

6. Kubeadm and Kubefed are two more tools that have recently come to general availability that help you to stand up and manage clusters if you are building stand-alone systems, but as we are focused on GKE it is outside the scope of this tutorial.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_3.md)
