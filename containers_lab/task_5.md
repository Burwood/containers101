## Build a docker image
After you've created your Dockerfile, you need to compile the image.

 1. Execute the command: `docker build -t python-http-demo:latest .`

This command tells the docker daemon to build a docker image from a file named "Dockerfile" the current working directory (.) and name it python-http-demo and tag it "latest". You can specify a different file name with the **-f <file_name>** flag as well if you need multiple versions of your Dockerfile.

 2. You will see it pull down the python container if you don't already have it locally, then it will walk through your build steps one by one creating new layers
 3. When it's done, you can execute the command `docker images` and see the newly created image. (Note its size!)
 4. Go back and edit your **Dockerfile**, change it to match below:

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
 5. Run the same build command,  and then run `docker image ls` again and note the difference in size.

**It pays to know the source of your container images and often times you'll end up making your own due to size or package constraints.**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_6.md)
