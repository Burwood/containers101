## Connecting to Azure Cloud Shell
Microsoft provides each person with a microsoft account a $200 trial voucher for the Azure Platform.  For this section of the workshop we will be working with Azure's free Cloud Shell instance, so let's begin by creating an account and your Cloud Shell.

1. Open a browser to https://portal.azure.com and login with your email account.
2. Click on the icon on the right that looks like a terminal prompt![Azure Home Page](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_Cloud_Shell.png)

3. Now Choose your preferred shell to work in.![Opening Azure Cloud Shell](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_Cloud_Shell_open.png)

![Azure Cloud Shell - Power Shell](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_Cloud_Shell_posh.png)

4. Also note that you can use the VS Code editor inline as well as upload/downloading files to the Cloud Shell.![Using Azure Cloud Shell](https://github.com/Burwood/containers101/raw/azure/containers_lab/images/Azure_Cloud_Shell_editor.png)

5. Next, we need to create a Docker Host for us to test our work. Run the commands below: 
```
$subscription=az account show|jq .id
$machine-name=containers101
docker-machine --driver azure --azure-subscription-id $subscription $machine-name
docker-machine env $machine-name --shell powershell

```

[Continue to the Next Task](https://github.com/Burwood/containers101/blob/azure/containers_lab/azure/task_1.md)
