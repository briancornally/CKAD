# This demo will be run from c1-cp1 since kubectl is already installed there.
# This can be run from any system that has the Azure CLI client installed.

#Ensure Azure CLI command line utilitles are installed
#https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
RG="Kubernetes-Cloud"
KNAME=CSCluster2

#Log into our subscription
az login
az account set --subscription "Demonstration Account"

#Create a resource group for the serivces we're going to create
az group create --name $RG --location SoutheastAsia

#Let's get a list of the versions available to us, 
az aks get-versions --location SoutheastAsia -o table

#let's check out some of the options available to us when creating our managed cluster
az aks create -h | more

#Let's create our AKS managed cluster. 
az aks create \
    --resource-group $RG \
    --generate-ssh-keys \
    --name $KNAME \
    --node-count 3 
#default Node count is 3

#If needed, we can download and install kubectl on our local system.
az aks install-cli

#Get our cluster credentials and merge the configuration into our existing config file.
#This will allow us to connect to this system remotely using certificate based user authentication.
az aks get-credentials --resource-group $RG --name $KNAME --overwrite-existing

#List our currently available contexts
kubectl config get-contexts

#set our current context to the Azure context
kubectl config use-context $KNAME

#run a command to communicate with our cluster.
kubectl get nodes

#Get a list of running pods, we'll look at the system pods since we don't have anything running.
#Since the API Server is HTTP based...we can operate our cluster over the internet...esentially the same as if it was local using kubectl.
kubectl get pods --all-namespaces

#az aks delete --resource-group $RG --name $KNAME #--yes --no-wait

