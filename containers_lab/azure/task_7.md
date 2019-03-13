## How do I leave a container running?
After running your first container you were probably left wondering... how is this useful? I need to leave my application running for it to be useful. Have no fear, Daemons are here!

1. Execute the following command to run it as a detached container:
 **`docker run -d  --name python-demo -p 8080:8080 python-http-demo`**
2. This will drop you back to a prompt, so execute **`docker ps`** to see your running container
3. Clean up your instance of this docker image with the command: 
 **`docker stop python-demo && docker rm python-demo`** so that we can reuse that name again later
 
4. When you have started the container interactively (with -it instead of -d), and are in a bash-like environment, you’d usually type **ctrl+c** to exit the session. This causes the command to stop, which in turns stops the container. What if you want it to keep running, but not in the terminal? You can exit an interactive Docker session, without doing the above by daemonizing the container. By doing this, you'll get what you’d have if you started it with  _-d_  in the first place.
5. Now execute the following command to run it as an interactive session again:
 **`docker run -it  --name python-demo -p 8080:8080 python-http-demo`**
 This will leave you with a container running but a busy terminal. If you needed to change something for debugging, the container would stop and you would lose what you were doing... Now, instead of the usual **ctrl+c** try the below:
6. Press  **ctrl+p** and **ctrl+q** after each other and you will turn  interactive mode to daemon mode. Now when you press **ctrl+c** it keeps the container running but frees up your terminal. 
You can attach to it later using **`docker attach python-demo`**, if you need to interact with the container more.
7. Open your browser to [http://localhost:8080](http://localhost:8080/) and verify you see our logo
8. Once again, clean up your instance of this docker image with the command: 
 **`docker stop python-demo && docker rm python-demo`** so that we can reuse that name again later

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/master/containers_lab/azure/task_8.md)
