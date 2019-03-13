
## Create a Dockerfile for Linux

The **Dockerfile** is what the docker engine requires to build new images and is essentially written in a do this, then that recipe style. Let's build a sample app!

 1. Clone the repo:  **`https://github.com/Burwood/python-http.git`**
 2. In the newly created directory, create a file named **Dockerfile** with the below contents and fill in your name.
 
		FROM python:3-stretch

		LABEL maintainer="James Anderton <janderton@burwood.com>"
		LABEL description="Demo Python App"

		WORKDIR /app

		COPY ["src/", "/app/"]

		ENV PORT 8080
		EXPOSE 8080

		ENTRYPOINT ["python"]
		CMD ["app.py"]

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_5.md)
