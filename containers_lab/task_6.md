---


---

<h2 id="run-a-docker-container-with-the-new-image">Run a docker container with the new image</h2>
<p>After creating the container image we need to create an instance and run it.</p>
<ol>
<li>Execute the command:<br>
<strong><code>docker run -it --name python-demo -p 8080:8080 python-http-demo</code></strong></li>
<li>This starts up an interactive session instance of the python-http-demo instance named python-demo, and publishes the exposed internal port 8080 to the host’s port 8080.</li>
<li><em>If you forget to name it, it will assign a random name for you and you can find it using <strong><code>docker ps -a</code></strong> after you’re done running it.</em></li>
<li>Press <strong>ctrl+c</strong> to exit the container</li>
<li>Clean up your instance of this docker image with the command:<br>
<strong><code>docker rm python-demo</code></strong> so that we can reuse that name again later</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_7.md">Continue to the Next Task</a></p>

