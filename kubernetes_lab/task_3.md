## Deploy and manage a pod
A _Pod_ is the basic building block of Kubernetes and the smallest and simplest unit in the Kubernetes object model that you create or deploy. A Pod represents a running process and its combined file system on your cluster. Let's deploy a pod.

1. Clone the repo:  **`https://github.com/Burwood/python-http.git`**
2. In the newly created directory, create a file named**Dockerfile**, change it to match below:

```
FROM alpine:latest
LABEL maintainer="James Anderton <janderton@burwood.com>"
LABEL description="Demo Python App"
COPY ["requirements.txt", "."]

RUN apk --update add --no-cache python3 py3-pip \
&& pip3 install -U pip \
&& pip3 install -r requirements.txt \
&& pip3 list modules

ENV PORT 8080
EXPOSE 8080

WORKDIR /app
COPY ["src/", "/app/"]

ENTRYPOINT ["python3"]
CMD ["app.py"]
```

 3. Go ahead a build the docker file and tag the image
 4. Now execute the command **`kubectl run app <IMAGE_NAME:TAG>`**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/kubernetes_lab/task_4.md)
