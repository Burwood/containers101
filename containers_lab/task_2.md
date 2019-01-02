## Inspecting Images
As mentioned, one of the beauties of containers is that you can layer on your ideas atop others existing work so you don't have to reinvent the wheel... But, anyone can push images to publicly available via repositories like Docker Hub and Quay.io or Google's GCR, so how do we know what's in them? Should we just trust the creator or take a look to see how it was made?

There are several things you can look at before taking a leap and trusting a public image for your project.

 1. Is this an official image? - When you do a **`docker search`** one of the columns of information listed is **official**
 2. Are many people using this image? - Like food, the number of people consuming an image tends to lend credence to its quality. Another one of the columns of **`docker search`** is **Stars**
 3. Is this an automated build? - Image as Code or Automated Builds allow you to see in file form exactly how this image was created and note any failures
 4. What's going on inside a non-automated build?  - Once you pull down an image you can execute the following command: **`docker inspect node`**
The output of that command shows things like **Parent**, **ENV**, **Cmd**,  among other things.

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_3.md)

