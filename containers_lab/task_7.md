---


---

<h2 id="how-do-i-leave-a-container-running">How do I leave a container running?</h2>
<p>After running your first container you were probably left wondering… how is this useful? I need to leave my application running for it to be useful. Have no fear, Daemons are here!</p>
<ol>
<li>
<p>Execute the following command to run it as a detached container:<br>
<code>docker run -d --name python-demo -p 8080:8080 python-http-demo</code></p>
</li>
<li>
<p>This will drop you back to a prompt, so execute <code>docker ps</code> to see your running container</p>
</li>
<li>
<p>Clean up your instance of this docker image with the command:<br>
<strong><code>docker stop python-demo &amp;&amp; docker rm python-demo</code></strong> so that we can reuse that name again later</p>
</li>
<li>
<p>When you have started the container interactively (with -it instead of -d), and are in a bash-like environment, you’d usually type <strong>ctrl+c</strong> to exit the session. This causes the command to stop, which in turns stops the container. What if you want it to keep running, but not in the terminal? You can exit an interactive Docker session, without doing the above by daemonizing the container. By doing this, you’ll get what you’d have if you started it with  <em>-d</em>  in the first place.</p>
</li>
<li>
<p>Now execute the following command to run it as an interactive session again:<br>
<code>docker run -it --name python-demo -p 8080:8080 python-http-demo</code><br>
This will leave you with a container running but a busy terminal. If you needed to change something for debugging, the container would stop and you would lose what you were doing… Now, instead of the usual <strong>ctrl+c</strong> try the below:</p>
</li>
<li>
<p>Press  <strong>ctrl+p</strong> and <strong>ctrl+q</strong> after each other and you will turn  interactive mode to daemon mode. Now when you press <strong>ctrl+c</strong> it keeps the container running but frees up your terminal.<br>
You can attach to it later using <strong><code>docker attach python-demo</code></strong>, if you need to interact with the container more.</p>
</li>
<li>
<p>Once again, clean up your instance of this docker image with the command:<br>
<strong><code>docker stop python-demo &amp;&amp; docker rm python-demo</code></strong> so that we can reuse that name again later</p>
</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_8.md">Continue to the Next Task</a></p>

