---


---

<h2 id="create-a-dockerfile">Create a Dockerfile</h2>
<p>The <strong>Dockerfile</strong> is what the docker engine requires to build new images and is essentially written in a do this, then that recipe style. Let’s build a sample app!</p>
<ol>
<li>
<p>Clone the repo:  <code>https://github.com/Burwood/python-http.git</code></p>
</li>
<li>
<p>In the newly created directory, create a file named <strong>Dockerfile</strong> with the below contents and fill in your name.</p>
<pre><code>FROM python:3-stretch

LABEL maintainer="James Anderton &lt;janderton@burwood.com&gt;"
LABEL description="Demo Python App"

WORKDIR /app

COPY ["src/", "/app/"]

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["python"]
CMD ["app.py"]
</code></pre>
</li>
</ol>

