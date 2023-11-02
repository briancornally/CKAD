# simulator

```
brew install --cask lens
brew install helm
kubectl config get-contexts | awk '{print $2}'
kubectl config use-context docker-desktop
kubectl config use-context k3d-demo
kubectl config use-context microk8s
kubectl config use-context minikube
```

# minikube - best

- https://minikube.sigs.k8s.io/docs/tutorials/multi_node/
- https://medium.com/womenintechnology/create-a-3-node-kubernetes-cluster-with-minikube-8e3dc57d6df2
- only docker driver supported

```
minikube start --help
minikube start --nodes=3 --alsologtostderr
head ~/.minikube/machines/minikube*/config.json
minikube addons enable metrics-server
minikube status
minikube stop
minikube delete
kubectl get nodes
kubectl label node minikube-m02 node-role.kubernetes.io/worker=worker
kubectl label node minikube-m03 node-role.kubernetes.io/worker=worker
kubectl get nodes
kubectl label nodes minikube-m02 role=worker
kubectl label nodes minikube-m03 role=worker
kubectl apply -f redis.yaml
kubectl apply -f apache.yaml
kubectl get pods -o wide
```

# cleanup

```
kubectl delete deployments <httpd_deployment_name> <redis_deployment_name>
kubectl delete nodes <node_name> <node_name> <node_name>
minikube stop
minikube delete
```

# k3s e.g. killercoda

- https://github.com/k3s-io/k3s
- https://avilpage.com/2023/03/setup-k8s-anywhere-k3d.html

```
brew install k3d
k3d cluster create demo
k3d cluster create demo --servers 1 --agents 2
k3d cluster list
k3d cluster delete demo
kubectl get nodes
kubectl cluster-info
```

# k8s

# Kubeadm - in real exam

# rancher desktop

# https://killercoda.com/playgrounds/scenario/kubernetes

# https://labs.play-with-k8s.com/

# https://microk8s.io/

- https://multipass.run
- https://github.com/canonical/multipass
- https://devoriales.com/post/267/creating-a-local-multi-node-k8s-cluster-with-microk8s-and-multipass

```
brew install ubuntu/microk8s/microk8s
brew install --cask multipass

microk8s install --cpu 2 --mem 2 --disk 10 --channel=1.28
microk8s status --wait-ready
microk8s enable dashboard
microk8s enable dns
microk8s enable registry
microk8s enable observability # user/pass: admin/prom-operator
# microk8s enable istio not available
microk8s kubectl get all --all-namespaces
microk8s enable --help
microk8s dashboard-proxy
```

- multi node

```
multipass version
multipass list | awk '/micro/ {print $3,$1}'
multipass delete --all
multipass purge
NAME=microk8s-vm
NAME=microk8s-vm2
NAME=microk8s-vm3
multipass launch 22.04 --name $NAME --cpus 1 --mem 2G --disk 10G
```

- on each node

```
multipass shell microk8s-vm3

cat <<EOF | sudo tee -a /etc/hosts > /dev/null
192.168.64.7 microk8s-vm
192.168.64.5 microk8s-vm2
192.168.64.6 microk8s-vm3
EOF
cat /etc/hosts

sudo snap install multipass
sudo snap install microk8s --classic --channel=1.28/stable # nodes 2 & 3
sudo usermod -a -G microk8s ubuntu
newgrp microk8s
```

- control plane

```
multipass shell microk8s-vm
microk8s add-node
```

- worker nodes - new token for each

```
microk8s join 192.168.64.7:25000/15bb23ee98f18ee9b4a44c8b8617360d/bd3959c4a8d1 --worker
```

- validation

```
microk8s kubectl get nodes
microk8s kubectl get pods -o wide --all-namespaces
```
- config merge
```
microk8s config > ~/.kube/microk8s-config
KUBECONFIG=~/.kube/config:~/.kube/microk8s-config
kubectl config view --flatten > ~/.kube/merged_kubeconfig
```

- start/stop

```
microk8s start
microk8s stop
microk8s uninstall
```

- cleanup

````
microk8s stop
multipass delete microk8s-vm
multipass delete microk8s-vm2
multipass delete microk8s-vm3
multipass purge
brew uninstall --zap multipass
brew uninstall microk8s
```**

# kind - k8s in docker

# prometheus

- https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
- https://www.squadcast.com/blog/install-prometheus-kubernetes

````

kubectl create namespace darwin
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace darwin
kubectl get pods -n darwin
kubectl port-forward -n darwin prometheus-prometheus-kube-prometheus-prometheus-0 9091:9090

```

# tests

KodeKloud Pro subscription, you can attempt our Ultimate Mock Exam series

https://docs.linuxfoundation.org/tc-docs/certification/lf-handbook2/exam-user-interface/examui-performance-based-exams
https://docs.linuxfoundation.org/tc-docs/certification/lf-handbook2/exam-user-interface#lf_remote_desktop69fKd8/s/-M5QaeeC1mG9VndIpgJe/certification/lf-handbook2/exam-user-interface%23lf_remote_desktop
https://github.com/fireflycons/tips-for-CKA-CKAD-CKS#launching-the-exam
https://github.com/kodekloudhub/community-faq#can-i-use-an-external-monitor
https://github.com/lucassha/CKAD-resources
https://itnext.io/cks-cka-ckad-changed-terminal-to-remote-desktop-157a26c1d5e
https://killercoda.com/kimwuestkamp/scenario/cks-cka-ckad-remote-desktop
https://medium.com/@harioverhere/ckad-certified-kubernetes-application-developer-my-journey-3afb0901014
https://speed.cloudflare.com
https://training.linuxfoundation.org/training/kubernetes-for-developers/
https://video-diagnostics.twilio.com
https://webcamtests.com
https://www.linkedin.com/pulse/my-ckad-exam-experience-atharva-chauthaiwale/
https://www.onlinemictest.com
```
