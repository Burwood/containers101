---


---

<hr>
<hr>
<h2 id="attaching-a-volume-to-a-container-for-persistent-data">Attaching a volume to a container for persistent data</h2>
<p>While containers were originally designed for stateless applications where data was stored in a object based  system,  the community quickly realized that there were many legacy apps begging to be modernized and local storage was required. Out of this need volume mounts were created. Let’s use an off the shelf Cloud Storage application and attach a volume to it.</p>
<ol>
<li>
<p>Run the following commands:<br>
<code>docker pull minio/minio</code><br>
<code>docker run -it -p 9000:9000 minio/minio server /data</code></p>
</li>
<li>
<p>Open your browser to <a href="http://localhost:9000">http://localhost:9000</a> and enter the AccessKey and SecretKey provided from the commandline when you launched the container</p>
</li>
<li>
<p>Press the Red Plus button at the bottom right corner and then press the Create Bucket button to create a bucket named <strong>“test”</strong>. (The icon is the second yellow one)<img src="https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_create.png" alt="enter image description here"></p>
</li>
<li>
<p>Next press the Upload file button right above that and upload a test file.<img src="https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_show_files.png" alt="enter image description here"></p>
</li>
<li>
<p>Now in the terminal, press <strong>ctrl+c</strong> to kill the container and run <code>docker run -it -p 9000:9000 minio/minio server /data</code> to create a new one.<br>
Notice that your uploaded file is gone? press <strong>ctrl+c</strong> once more.</p>
</li>
<li>
<p>This time lets add a volume mount so we can make the data persistent. Run the below commands:</p>
</li>
<ul>
<li><code>docker volume create minio-data &amp;&amp; docker volume create minio-config</code></li>
<li><code>docker run -it -p 9000:9000 --name minio1 -v minio-data:/data -v minio-config:/root/.minio minio/minio server /data</code></li>
</ul>
<li><p>Open your browser again to <a href="http://localhost:9000">http://localhost:9000</a> and enter the AccessKey and SecretKey provided from the command line when you launched the container</p></li>
<li><p>Press the Red Plus button and then create a bucket again named <strong>“test”</strong> and upload a test file.<img src="https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_create.png" alt="enter image description here"></p></li>
<li><p>Now in the terminal, press <strong>ctrl+c</strong> to kill the container and run <code>docker rm minio1</code> to delete the container instance.</p></li>
<li><p>Run the command:<br>
<code>docker run -it -p 9000:9000 --name minio1 -v minio-data:/data -v minio-config:/root/.minio minio/minio server /data</code>  and browse to the site again. Note that your files are still there!<br>
<img src="https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_show_files.png" alt="enter image description here"></p></li>
<li><p>Once again, press <strong>ctrl+c</strong> to kill the container and run <code>docker rm minio1</code> to delete the container instance and <code>docker volume prune</code> to clean up your volumes.</p></li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_9.md">Continue to the Next Task</a></p>

