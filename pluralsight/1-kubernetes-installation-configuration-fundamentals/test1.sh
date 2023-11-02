# https://www.liquidweb.com/kb/how-to-install-kubernetes-using-kubeadm-on-ubuntu-18/
sudo su - 
apt update -y && apt upgrade -y

grep swap  /etc/fstab
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
swapoff -a

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

apt update
apt -y install vim git curl wget kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

kubectl version --client && kubeadm version
