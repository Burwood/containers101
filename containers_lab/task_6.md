---


---

<h2 id="run-a-docker-container-with-the-new-image">Run a docker container with the new image</h2>
<p>After creating the container image we need to create an instance and run it.</p>
<ol>
<li>Execute the command: <code>docker run --name python-demo -p 8080:8080 python-http-demo</code></li>
<li>This starts up an instance of the python-http-demo instance and publishes the exposed internal port 8080 to the host’s port 8080 and names the instance python-demo.</li>
<li><em>If you forget to name it, it will assign a random name for you and you can find it using <code>docker ps -a</code> after you’re done running it.</em></li>
<li>When you want to stop the container press ctrl+c to kill it. (You may need to do this twice on Windows)</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_7.md">Continue to the Next Task</a></p>

