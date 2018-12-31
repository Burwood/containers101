---


---

<h2 id="inspecting-images">Inspecting Images</h2>
<p>As mentioned, one of the beauties of containers is that you can layer on your ideas atop others existing work so you don’t have to reinvent the wheel… But, anyone can push images to publicly available via repositories like Docker Hub and <a href="http://Quay.io">Quay.io</a> or Google’s GCR, so how do we know what’s in them? Should we just trust the creator or take a look to see how it was made?</p>
<p>There are several things you can look at before taking a leap and trusting a public image for your project.</p>
<ol>
<li>Is this an official image? - When you do a <strong><code>docker search</code></strong> one of the columns of information listed is <strong>official</strong></li>
<li>Are many people using this image? - Like food, the number of people consuming an image tends to lend credence to its quality. Another one of the columns of <strong><code>docker search</code></strong> is <strong>Stars</strong></li>
<li>Is this an automated build? - Image as Code or Automated Builds allow you to see in file form exactly how this image was created and note any failures</li>
<li>What’s going on inside a non-automated build?  - Once you pull down an image you can execute the following command: <strong><code>docker inspect node</code></strong><br>
The output of that command shows things like <strong>Parent</strong>, <strong>ENV</strong>, <strong>Cmd</strong>,  among other things.</li>
</ol>
<p><a href="https://github.com/Burwood/containers101/blob/master/containers_lab/task_3.md">Continue to the Next Task</a></p>

