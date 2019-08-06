## Multi-Stage Docker Images
A common scenario in the container world is to have a containerized web server and have its content copied into the container at build time or compiling a Go Binary to run in a container. Doing this with standard base images works, but leaves fat containers and security vulnerabilities behind... A much cleaner way to achieve this second scenario is to use a base image and multi-stage builds to compile the binary but then only copy the resulting binary into a container by itself leaving all the build tools behind for saftey and security.

 1. First, lets start by cloning a demo Http Server app written in Go. [https://github.com/janderton/golang-http-demo](https://github.com/janderton/golang-http-demo.git)
 2. Now, Create your **Dockerfile** as below also changing where $USER@USER.com is your email address:

```
FROM golang:alpine
LABEL maintainer=" $USER <$USER@$USER.com>"
LABEL description="Demo GoLang App"

WORKDIR /app

RUN apk add --no-cache --update build-base gcc abuild binutils binutils-doc gcc-doc git musl-dev
RUN go get github.com/codegangsta/negroni && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/yosssi/ace

ADD src/dev.db /app/dev.db
ADD templates /app/templates/
ADD src/main.go /app/main.go

RUN CGO_ENABLED=1 GOOS=linux go build -a -o goapp .

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["/app/goapp"]
```

This Dockerfile is using the Golang community provided Alpine Linux Image as its base **(FROM golang:alpine)**, then setting the current working directory to **/app**. Next, it is running apk and installing the necessary dev tooling packages that we'll need to build a golang app, followed by running the **go get** package manager to get the modules we'll need to build our app. Then it adds all of the files from the current host directory into the working directory on the container. Lastly, we'll run the **go build** command, expose our ports, and setup our entrypoint so that only our go binary runs.


 3. Now, using the commands from previous tasks, build your container and tag it **go-http-demo:v1** and **run it remembering to publish the container port 8080 to 8080 on your localhost**

 4. Click the **Web Preview Button** in the cloud shell or if you are running this locally, open the browser to [your new app](http://localhost:8080)

 5. Go ahead and Kill/Stop your container now.

 6. Finally, go back and edit your **Dockerfile**, change it to match below:

```
FROM golang:alpine as builder
LABEL maintainer=" $USER <$USER@$USER.com>"
LABEL description="Demo GoLang App"

WORKDIR /app

RUN apk add --no-cache --update build-base gcc abuild binutils binutils-doc gcc-doc git musl-dev
RUN go get github.com/codegangsta/negroni && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/yosssi/ace

ADD . .

### go-sqlite3 requires CGO_ENABLED=1 and static linked mode to work in the scratch container
RUN cd src && CGO_ENABLED=1 GOOS=linux go build -a -ldflags '-linkmode external -extldflags "-static"' -o goapp .

# Final Stage
FROM scratch


WORKDIR /app

ADD src/dev.db /app/dev.db
ADD templates /app/templates/

COPY --from=builder /app/src/goapp /app/goapp

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["/app/goapp"]

```

This Dockerfile is coming to the same conclusion but from a totally different and more secure angle. We are starting off with the same **FROM** but labelling it as **builder** so that we can reference its results later. Then, we'll setup the build environment the same as before, but now when we **RUN** the **go build** command we added some flags so that we are staticly linking and including all the dependencies in the resulting binary because our next line we're using a second **FROM** pointing to **scratch** which quite literally means an empty container, then setting the working directory and adding just the files we need from our local pc into the directory as well as copying the compiled go binary from **builder** our labelled image from before and of course exposing the ports and setting our entrypoint.

 7. Now, run the same build command again, **but tag this one go-http-demo:v2**,  and then run `docker image ls` again and note the difference in size. You have nothing in your container but the binary and its sqlite3 database file!

**What does this mean? Multi-stage builds are awesome and you should almost always use them**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_7.md)

