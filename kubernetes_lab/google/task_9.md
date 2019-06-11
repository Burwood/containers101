## Creating a new storageClass for Persistent Volume Claims
When developing with standard Docker and using volumes, you had to deal with making sure the directories were on the host and making the host had space and mounting the volumes in your container and so on, but Kubernetes handles all of this for you and all you need to do is submit a Persistent Volume Claim. Behind the scenes, there can be many different types of volumes. Google's GKE provides a default hdd based storageClass for you, but we're going to create an **SSD** based storage class as well for database storage.

 1. Start by running **`kubectl get storageClasses`** so we can see the default class provided![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_storageClasses.png)

 2. Now, using the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/ssd_storageClass.yaml) I have created, let's build a new storage class using **`kubectl create`**  and then view the new storageClass![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_storageClass.png)

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_10.md)
