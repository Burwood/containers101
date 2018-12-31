---


---

<h2 id="how-do-i-leave-a-container-running">How do I leave a container running?</h2>
<p>After running your first container you were probably left wondering… how is this useful? I need to leave my application running for it to be useful. Have no fear, Daemons are here!</p>
<ol>
<li>Execute the following command to run the container as a daemon:<br>
<code>docker run -d --name python-demo -p 8080:8080 python-http-demo</code></li>
<li>This will drop you back to a prompt, so execute <code>docker ps</code> to see your running container</li>
<li>Clean up your instance of this docker image with the command:<br>
<strong><code>docker rm python-demo</code></strong> so that we can reuse that name again later</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_8.md">Continue to the Next Task</a></p>

