## Deploy a MongoDB instance as a StatefulSet  with Persistent Storage
Before StatefulSets when you had an application that needed volumes and replication between nodes, you had to manually create a disk, a ReplicationController, and a service for each replica. Scaling the set up and down meant managing all of these resources manually, which is an opportunity for error, and would put your stateful application at risk. Pods created under a StatefulSet also have a few unique attributes. The name of the pod is not random, instead each pod gets an ordinal name. Combined with the Headless Service, this allows pods to have stable identification. In addition, pods are created one at a time instead of all at once, which can help when bootstrapping a stateful system. You can read more about StatefulSets in the [documentation](http://kubernetes.io/docs/concepts/abstractions/controllers/statefulsets/). Let's explore StatefulSets using MongoDB as an example.

First, we need to create another type of **Service** called a **Headless Service** to point to our MongoDB Pods. It's called **Headless** because it has no loadbalancer and is just used for DNS. 
 1. Using the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/mongo-service.yaml) provided, **`kubectl create`** our Service object in the new namespace **sample-app** and view it once its deployed.
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_get_headless_service.png)
*Pay special attention to the **selector** in the service yaml file, if the pods we're about to create in the stateful set do not match the selector, traffic will not get routed to them*

 2. Next use the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/mongo-statefulset.yaml) provided to **`kubectl create`** the Mongo StatefulSet![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_create_statefulset.png)

 3. Connect to the mongo pod and run the mongo console with the command **`kubectl -n sample-app exec -it mongo-0 mongo`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_exec_mongo.png)

 4. Initialize the MongoDB replica set with the command **`rs.initiate()`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_mongo_initiate.png)

Now let's insert some data.

5. First, run the command **`use test-database-1`**

6. Next, run the command **`db.mytable.insert({"author": "Duke", "title" : "PyMongo 101", "tags" : ["MongoDB", "PyMongo", "Tutorial"], "date" :"01/05/2019")`**![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_mongo_write.png)
7.  Next, run the command **`db.mytable.find()`** to print out all records![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_mongo_find.png)
*for those that wondered, I have two items because I didnt snap the screenshot the first time.*

8. Now run the command **`kubectl -n sample-app run --rm=true -it --pod-running-timeout=1m0s mongo-python-demo --image
=janderton/mongo-python-demo --restart=Never`** to kick off a run once job using a docker image I created with a simple python script to query our database from a **separate** pod to prove we can contact the database across the internal cluster network. [(click here for the source code)](https://github.com/janderton/python-mongo-demo.git)![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_run_once_mongo-demo-pod.png)

9.  Now, use **`kubectl delete statefulset mongo`** to delete your mongo deployment

10.Next use the [yaml file](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/assets/mongo-statefulset.yaml) provided to recreate the Mongo StatefulSet 

11. Now run the command **`kubectl -n sample-app run --rm=true -it --pod-running-timeout=1m0s mongo-python-demo --image
=janderton/mongo-python-demo --restart=Never`** to kick off the run once job again and note the output.![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_run_once_mongo-demo-pod_second.png)
 **There is a fourth entry even though you deleted the MongoDB StatefulSet!** This is the value of persistent storage. 

12. Now run **`kubectl delete namespace sample-app`**
13. Here is the gui view of the cluster pre-namespace delete![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_workload_view.png)

and here is the view after. 
![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/GKE_workload_view_postDelete.png)
**Think about the difference in speed of cleanup this was from doing it object by object!** 
It not only cleaned up your StatefulSet, but it also cleaned up the Service object and the Persistent Volume Claim for each pod in the set.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_12.md)
