---


---

<h2 id="build-a-docker-image">Build a docker image</h2>
<p>After you’ve created your Dockerfile, you need to compile the image.</p>
<ol>
<li>Execute the command: <code>docker build -t python-http-demo:latest .</code></li>
<li>You will see it pull down the python container if you don’t already have it locally, then it will walk through your build steps one by one creating new layers</li>
<li>When it’s done, you can execute the command <code>docker images</code> and see the newly created image. (Note its size!)</li>
<li>Go back and edit your <strong>Dockerfile</strong>, change it to match below:</li>
</ol>
<code>
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

ENTRYPOINT ["python"]
CMD ["app.py"]
</code>
<ol start="5">
<li>Run the same build command,  and then run <code>docker image ls</code> again and note the difference in size.</li>
</ol>
<p><strong>It pays to know the source of your container images and often times you’ll end up making your own due to size or package constraints.</strong></p>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_6.md">Continue to the Next Task</a></p>

