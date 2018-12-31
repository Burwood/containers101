---


---

<h2 id="pulling-images">Pulling Images</h2>
<p>In order to pull images from a non-local repository, you need to either execute a <code>docker pull</code> or have the <strong>FROM</strong> command in your Dockerfile.</p>
<p>Try it now with the node container we searched for earlier:<br>
<code>docker pull docker.io/node</code></p>
<p>You will see it pull down all the layers this image is made up of and reconstitute them for use locally. If you run it a second time it will look for changes and only pull the changed layers.</p>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_4.md">Continue to the Next Task</a></p>

