## Using RBAC roles to secure namespaces

With GKE, IAM is the foundation for authorization and RBAC is the structure built on top of that.

In practice, that means granting  `edit`  or  `admin`  roles within your cluster to specific users at a namespace level to build on the read only access you’ve granted them with IAM. A simple role binding to grant Jane edit access within the  `web`  namespace would look something like this:

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: jane-web
  namespace: web
subjects:
- kind: User 
  name: jane@example.com  
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: edit
  apiGroup: rbac.authorization.k8s.io
```
Roles themselves take the form of rules -> resources -> verbs. If we wanted to setup a role called secret-reader for applications needing to read in secrets, we could do it like this:
```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
```
Setting up a Pods and logs reader would look something like this:
```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: pod-and-pod-logs-reader
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log"]
  verbs: ["get", "list"]
```
You can also aggregate Cluster Roles using selectors and the rules are automatically filled in by the controller manager.
```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: monitoring
aggregationRule:
  clusterRoleSelectors:
  - matchLabels:
      rbac.example.com/aggregate-to-monitoring: "true"
rules: []
```
Creating a ClusterRole that matches the label selector will add rules to the aggregated ClusterRole. In this case rules can be added to the “monitoring” ClusterRole by creating another ClusterRole that has the label  `rbac.example.com/aggregate-to-monitoring: true`.

```yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: monitoring-endpoints
  labels:
    rbac.example.com/aggregate-to-monitoring: "true"
# These rules will be added to the "monitoring" role.
rules:
 1. apiGroups: [""]
  resources: ["services", "endpoints", "pods"]
  verbs: ["get", "list", "watch"]
```

Lasly, you can create a clusterrolebinding that will do what it sounds like... bind a role to a user or serviceaccount. Let's go ahead and try that last one.

 1. Run the command: **`kubectl create clusterrolebinding secure-app-admin --clusterrole cluster-admin --serviceaccount=secure-app:default`**

 2. Go ahead and view the clusterrolebinding![enter image description here](https://github.com/Burwood/containers101/raw/master/kubernetes_lab/images/kubectl_view_clusterrolebinding.png)


Let's leave everything running for the last task.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_14.md)
