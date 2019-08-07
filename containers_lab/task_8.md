## 
Attaching a volume to a container for persistent data

While containers were originally designed for stateless applications
where data was stored in a object based system, the community quickly
realized that there were many legacy apps begging to be modernized and
local storage was required. Out of this need volume mounts were created.
Let’s use an off the shelf Cloud Storage application and attach a volume
to it.

 1. Run the following commands:   **`docker pull minio/minio`   `docker
    run -it -p 9000:9000 minio/minio server /data`**
2. Press the **Web Preview** button and choose **Change Port** to set your port to **9000** and then launch the preview, or if you are developing locally, open your browser to <http://localhost:9000> and enter the AccessKey
    and SecretKey provided from the commandline when you launched the
    container
3. Press the **Red +** button at the bottom right corner and then press
    the **Create Bucket** button to create a bucket named **“test”**. (The
    icon is the second yellow one)![enter image description
    here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_create.png)
    
4. Next press the Upload file button right above that and upload a test
    file.![enter image description
    here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_show_files.png)
    
5. Now in the terminal, press **ctrl+c** to kill the container and run
    **`docker run -it -p 9000:9000 minio/minio server /data`** to create a
    new one.   Notice that your uploaded file is gone? press **ctrl+c**
    once more.
    
6. This time lets add a volume mount so we can make the data
    persistent. Run the below commands:
    
      - **`docker volume create minio-data && docker volume create
        minio-config`**
      - **`docker run -it -p 9000:9000 --name minio1 -v minio-data:/data -v
        minio-config:/root/.minio minio/minio server /data`**
    
7. Press the Web Preview button or Open your browser again to <http://localhost:9000> and enter the
    AccessKey and SecretKey provided from the command line when you
    launched the container
    
8. Press the **Red +** button and then create a bucket again named
    **“test”** and upload a test file.![enter image description here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_create.png)
    
9. Now in the terminal, press **ctrl+c** to kill the container and run
    **`docker rm minio1`** to delete the container instance.
    
10. Run the command:   **`docker run -it -p 9000:9000 --name minio1 -v
    minio-data:/data -v minio-config:/root/.minio minio/minio server
    /data`** and browse to the site again. Note that your files are still
    there\!   ![enter image description
    here](https://github.com/Burwood/containers101/raw/master/containers_lab/images/minio_show_files.png)
11. Once again, let's clean up our mess
	1. Press **ctrl+c** to kill the container
	2. Run **```docker
    rm minio1```** to delete the container instance 
    3. Lastly, let's use a new command **```docker volume
    prune```** to clean up our volumes

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/task_9.md)
