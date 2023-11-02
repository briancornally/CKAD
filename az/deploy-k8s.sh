RG=k8s-c1-1
LOCATION=southeastasia
VNET=k8s-vnet 
NAMES=(c1-cp1 c1-node1 c1-node2 c1-node3 c1-storage)
# NAMES=(c1-node1 c1-node2 c1-node3 c1-storage)
SA=k8s8765434

az group create --name $RG --location $LOCATION

az network vnet create -g $RG -n $VNET --address-prefix 172.16.0.0/16 --subnet-name default --subnet-prefix 172.16.94.0/24

az storage account create --name $SA --resource-group $RG --location $LOCATION --sku Standard_LRS

for n in "${NAMES[@]}"; do 
az vm create \
--admin-username aen \
--custom-data cloud-init.txt \
--image UbuntuLTS \
--name $n \
--no-wait \
--nsg-rule SSH \
--public-ip-address-allocation static \
--public-ip-sku Standard \
--resource-group $RG \
--size Standard_D2s_v3 \
--ssh-key-value ~/.ssh/id_rsa.pub \
--storage-account $SA \
--storage-container-name vhds \
--subnet default \
--use-unmanaged-disk \
--vnet-name $VNET
done

# for n in "${NAMES[@]}"; do az vm auto-shutdown -g $RG -n $n --time 13:00; done
RAND=$(echo $RANDOM | md5 | head -c 20; echo)
for n in "${NAMES[@]}"; do az deployment group create --name $n-$RAND -g $RG --template-file deploy.json --parameters '@autoshutdown-params.json' --parameter virtualMachineName=$n --no-wait; done 

sed -i '' '/c1/d' ~/.ssh/known_hosts
sudo sed -i '' '/c1/d' /etc/hosts

# pip
cat /etc/hosts
az vm list-ip-addresses --ids $(az vm list -g $RG --query "[].id" -o tsv) --query "[].virtualMachine.{pip: network.publicIpAddresses[0].ipAddress, name: name}" -o tsv | sort -k 2 | tee hosts
cat hosts | sudo tee -a /etc/hosts
cat /etc/hosts

# local
cat <<EOF | tee hosts.local
127.0.0.1 localhost

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
EOF
az vm list-ip-addresses --ids $(az vm list -g $RG --query "[].id" -o tsv) --query "[].virtualMachine.{ip: network.privateIpAddresses[0], name: name}" -o tsv | sort -k 2 | tee -a hosts.local

for n in "${NAMES[@]}"; do scp -v hosts.local $n:~; done
for n in "${NAMES[@]}"; do ssh $n sudo mv hosts.local /etc/hosts; done
scp ~/.ssh/id_rsa c1-cp1:~/.ssh/id_rsa

ssh aen@c1-cp1
sudo apt-get install -y bash-completion
echo "alias ssh='ssh -o "StrictHostKeyChecking no"'" >> ~/.bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc

az group delete --name $RG --yes --no-wait

sudo kubeadm join 172.16.94.7:6443 --token abcdef.0123456789abcdef --discovery-token-ca-cert-hash sha256:a1d7c34dd5addec54026fe00d850eed1d34dc861ce785b73a52188a19f4c483c 





