## Multi-Stage Docker Images
A common scenario in the container world is to have a containerized web server and have its content copied into the container at build time or compiling a Go Binary to run in a container. Doing this with standard base images works, but leaves fat containers and security vulnerabilities behind... A much cleaner way to achieve this second scenario is to use a base image and multi-stage builds to compile the binary but then only copy the resulting binary into a container by itself leaving all the build tools behind for saftey and security.

 1. First, lets start by cloning a demo Http Server app written in Go. [go-http-demo](https://github.com/janderton/golang-http-demo.git)
 1. Now, Create your **Dockerfile** as below also changing where $USER@USER.com is your email address:
```
# Monolithic Build
FROM golang:alpine
LABEL maintainer=" $USER <$USER@$USER.com>"
LABEL description="Demo GoLang App"

WORKDIR /app

RUN apk add --no-cache --update build-base gcc abuild binutils binutils-doc gcc-doc git musl-dev
RUN go get github.com/codegangsta/negroni && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/yosssi/ace

ADD . .

RUN cd src && CGO_ENABLED=0 GOOS=linux go build -o goapp .

ENV PORT 8080
EXPOSE 8080

ADD /src/goapp /app/

ENTRYPOINT ["/app/goapp"]
```
 1. Next build your container and tag it **go-http-demo:v1** and **run it remembering to publish the container port 8080 to 8080 on your localhost**

 1. Click the **Web Preview Button** in the cloud shell or if you are running this locally, open the browser to [your new app](http://localhost:8080)

 1. Go ahead and Kill/Stop your container now.

 1. Finally, go back and edit your **Dockerfile**, change it to match below:

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
 5. Run the same build command, **but tag this one go-http-demo:v2**,  and then run `docker image ls` again and note the difference in size. You have nothing in your container but the binary and its sqlite3 database file!

**What does this mean? Multi-stage builds are awesome and you should almost always use them**

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_6.md)

