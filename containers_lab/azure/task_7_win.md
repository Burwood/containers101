## How do I leave a container running?
After running your first container you were probably left wondering... how is this useful? I need to leave my application running for it to be useful. Have no fear, Daemons are here!

1. Execute the following command to run it as a detached container:
 **`docker run -d  --name dotnet-demo -p 8080:80 dotnet-demo:v1`**
The **-d** switch leaves the container detached and running as a daemon as opposed to the -it switch which puts you in n interactive terminal

2. The previous command will drop you back to a prompt, so execute **`docker ps`** to see your running container
![Docker Run](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_dotnet_docker_run_posh.png)
3. Clean up your instance of this docker image with the command: 
 **`docker stop dotnet-demo; docker rm dotnet-demo`** so that we can reuse that name again later
 
4. When you have started the container interactively (with -it instead of -d), and are in a bash-like environment, you’d usually type **ctrl+c** to exit the session. This causes the command to stop, which in turns stops the container. What if you want it to keep running, but not in the terminal? You can exit an interactive Docker session, without doing the above by daemonizing the container. By doing this, you'll get what you’d have if you started it with  **_-d_**  in the first place.
5. Now execute the following command to run it as an interactive session again:
 **`docker run -it  --name dotnet-demo -p 8080:80 dotnet-demo:v1`**
 This will leave you with a container running but a busy terminal. If you needed to change something for debugging, the container would stop and you would lose what you were doing... Now, instead of the usual **ctrl+c** try the below:
6. Press  **ctrl+p** and **ctrl+q** after each other and you will turn  interactive mode to daemon mode. Now when you press **ctrl+c** it keeps the container running but frees up your terminal. 
You can attach to it later using **`docker attach dotnet-demo`**, if you need to interact with the container more.
7. Open your browser to the IP address from last task again and verify you see our Sample App

![Docker Run](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_dotnet_docker_run.png)

8. Once again, clean up your instance of this docker image with the command: 
 **`docker stop dotnet-demo; docker rm dotnet-demo`** so that we can reuse that name again later

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_8_win.md)
