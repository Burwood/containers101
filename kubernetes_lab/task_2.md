## Learning your tools
Being an Orchestrator of containers, there are various tools that you will use to manage Kubernetes. 

 1. The most basic one is Kubectl (pronounced Cube-Cuddle or Cube-Control...[yes this is a religious argument](https://www.reddit.com/r/kubernetes/comments/5qthoc/how_should_i_pronounce_kubectl/))
Kubectl controls the Kubernetes cluster manager and our good friends at both Google and Docker have made life easier and included it in their SDK's now as well.

Find more information at: https://kubernetes.io/docs/reference/kubectl/overview/
```
Basic Commands (Beginner):
  create         Create a resource from a file or from stdin.
  expose         Take a replication controller, service, deployment or pod and expose it as a new Kubernetes Service
  run            Run a particular image on the cluster
  set            Set specific features on objects

Basic Commands (Intermediate):
  explain        Documentation of resources
  get            Display one or many resources
  edit           Edit a resource on the server
  delete         Delete resources by filenames, stdin, resources and names, or by resources and label selector

  ```
2. Kubeadm and Kubefed are two more tools that have recently come to general availability that help you to stand up and manage clusters if you are building stand-alone systems, but as we are focused on GKE it is outside the scope of this tutorial.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_3.md)
