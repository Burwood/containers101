---


---

<h2 id="run-a-docker-container-with-the-new-image">Run a docker container with the new image</h2>
<p>After creating the container image we need to create an instance and run it.</p>
<ol>
<li>Execute the command:<br>
<strong><code>docker run --name python-demo -p 8080:8080 python-http-demo</code></strong></li>
<li>This starts up an instance of the python-http-demo instance and publishes the exposed internal port 8080 to the host’s port 8080 and names the instance python-demo.</li>
<li><em>If you forget to name it, it will assign a random name for you and you can find it using <strong><code>docker ps -a</code></strong> after you’re done running it.</em></li>
<li>When you have started the container interactively, and are in a bash-like environment, you’d usually type <strong>ctrl+c</strong> to exit the session. This causes the command to stop, which in turns stops the container. What if you want it to keep running, but not in the terminal? You can exit an interactive Docker session, without doing the above by daemonizing the container. By doing this, you’ll get what you’d have if you started it with  <em>-d</em>  in the first place.</li>
<li>Press  <strong>ctrl+p</strong> and <strong>ctrl+q</strong> after each other and you will turn  interactive mode to daemon mode. Now when you press <strong>ctrl+c</strong> it keeps the container running but frees up your terminal.<br>
You can attach to it later using <strong><code>docker attach python-demo</code></strong>, if you need to interact with the container more.</li>
<li>Clean up your instance of this docker image with the command:<br>
<strong><code>docker stop python-demo &amp;&amp; docker rm python-demo</code></strong> so that we can reuse that name again later</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_7.md">Continue to the Next Task</a></p>

