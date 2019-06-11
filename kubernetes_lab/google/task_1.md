## Connecting to a GKE Cluster
Google provides each person with a gmail account a $300 trial voucher for Google Cloud Platform (GCP).  For this workshop we will be working with Google's Kubernetes Engine (GKE) so let's begin by creating a Project and a GKE Cluster.

 1. Open a browser to https://console.cloud.google.com and login with your gmail account.
 2. If you have never logged into GCP before, you'll need to create a Project first.![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GCP_frontpage.png)
 3. Create a Project named "Containers101
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GCP_CreateProject.png)

 4. Next navigate to the Kubernetes Engine via the Hamburger menu at Top Left![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GCP_Menu.png)

 5. Now we will create our first GKE Cluster.![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_frontpage.png)

 6. Name the cluster and choose a zone  and click Create. (Leave the rest as default)![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_CreateCluster.png)

 7. Once the green circle is done spinning and the cluster has been created, click the connect button![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_ClusterView.png)

 8. Click the **Run in Cloud Shell** button ![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_ClusterConnect.png)

 9. Feel free to pop-out the shell from the browser window for convenient access
 10.The command to pull the google credentials needed for connecting kubectl to your cluster have been pre-entered, go ahead and press enter to run it .

![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_CloudShell.png)


[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_2.md)
