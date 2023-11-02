cat /etc/kubernetes/manifests/kube-apiserver.yaml | yq .enable-admission-plugins
curl localhost:8001/apis/authorization.k8s.io
docker build -t webapp-color .
docker build -t webapp-color .
docker image history python:3.6
docker image inspect python:3.6
docker run -d -p 8080:8282 webapp-color
docker run -d -p 8080:8282 webapp-color
docker run python:3.6 cat /etc/*release*
docker run python:3.6 cat /etc/*release*
export ns=default
export ns=default
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
helm install bravo bitnami/drupal
helm install bravo bitnami/drupal
helm list
helm pull --untar  bitnami/apache
helm pull --untar bitnami/wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
helm search hub wordpress
helm search repo apache
helm search repo wordpress
kubectl
kubectl
kubectl
kubectl
kubectl
kubectl
kubectl -n elastic-stack logs kibana
kubectl -n elastic-stack logs kibana
kubectl -n webhook-demo create secret tls webhook-server-tls --cert "/root/keys/webhook-server-tls.crt" --key "/root/keys/webhook-server-tls.key"
kubectl auth can-i create deployments
kubectl auth can-i create deployments
kubectl auth can-i create deployments --as dev-user
kubectl auth can-i create deployments --as dev-user
kubectl auth can-i delete nodes
kubectl auth can-i delete nodes
kubectl auth can-i list pods --as dev-user
kubectl auth can-i list pods --as dev-user
kubectl auth can-i list storageclasses --as michelle
kubectl auth can-i list storageclasses --as michelle
kubectl config
kubectl config
kubectl config current-context
kubectl config current-context
kubectl config set-context --current --namespace blue
kubectl config set-context --current --namespace blue
kubectl config set-context --current --namespace=elastic-stack
kubectl config set-context --current --namespace=elastic-stack
kubectl config set-context $(kubectl config current-context) --namespace=dev
kubectl config set-context $(kubectl config current-context) --namespace=dev
kubectl config view --minify | grep namespace:
kubectl config view --minify | grep namespace:
kubectl create -f .
kubectl create -f .
kubectl create clusterrolebinding michelle-storage-admin --clusterrole=storage-admin --user=michelle
kubectl create clusterrolebinding michelle-storage-admin --clusterrole=storage-admin --user=michelle
kubectl create deployment <deployment name> --image <name>
kubectl create deployment <deployment name> --image <name>
kubectl create quota myrq --hard=cpu=1,memory=1G,pods=2 --dry-run=client -o yaml
kubectl create quota myrq --hard=cpu=1,memory=1G,pods=2 --dry-run=client -o yaml
kubectl create role developer --verb=list,create,delete --resource=pods
kubectl create role developer --verb=list,create,delete --resource=pods
kubectl create service clusterip my-cs --tcp=5678:8080 --dry-run -o yaml
kubectl create service-account dashboard-sa
kubectl create service-account dashboard-sa
kubectl create token dashboard-sa
kubectl create token dashboard-sa
kubectl deploy --help
kubectl deploy --help
kubectl describe ingress --namespace app-space
kubectl describe ingress --namespace app-space
kubectl describe pod kube-apiserver-controlplane -n kube-system | grep  authorization-mode # --authorization-mode=Node,RBAC
kubectl describe pod kube-apiserver-controlplane -n kube-system | grep  authorization-mode # --authorization-mode=Node,RBAC
kubectl describe pod my-kubernetes-dashboard
kubectl describe pod my-kubernetes-dashboard
kubectl describe rolebinding kube-proxy -n kube-system
kubectl describe rolebinding kube-proxy -n kube-system
kubectl edit pod <pod-name> command to edit pod properties.
kubectl edit pod <pod-name> command to edit pod properties.
kubectl edit role developer -n blue
kubectl edit role developer -n blue
kubectl exec -it my-kubernetes-dashboard cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-kubernetes-dashboard cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount
kubectl exec -it my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount
kubectl exec ${POD*NAME} -- whoami
kubectl exec ${POD*NAME} -- whoami
kubectl exec kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep enable-admission-plugins
kubectl exec kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep enable-admission-plugins
kubectl exec webapp -- cat /log/app.log
kubectl exec webapp -- cat /log/app.log
kubectl explain replicaset
kubectl explain replicaset
kubectl explain resourcequota
kubectl explain resourcequota
kubectl expose deployment frontend --type=NodePort --name=frontend-service --port=6262 --target-port=8080
kubectl get all
kubectl get all
kubectl get all --all-namespaces=true
kubectl get all --all-namespaces=true
kubectl get netpol
kubectl get netpol
kubectl get networkpolicy
kubectl get networkpolicy
kubectl get po nginx -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get po nginx -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get po nginx -oyaml
kubectl get po nginx -oyaml
kubectl get pod <pod-name> -o yaml > pod-definition.yaml
kubectl get pod <pod-name> -o yaml > pod-definition.yaml
kubectl get pods --selector env=dev
kubectl get pods --selector env=dev
kubectl get role
kubectl get role
kubectl get role -A --no-headers -n kube-system
kubectl get role -A --no-headers -n kube-system
kubectl get rolebindings -n kube-system
kubectl get rolebindings -n kube-system
kubectl get service-account
kubectl get service-account
kubectl logs nginx
kubectl logs nginx
kubectl logs nginx --previous
kubectl logs nginx --previous
kubectl proxy
kubectl proxy
kubectl proxy 8001&
kubectl replace --force -f /tmp/file.yaml
kubectl replace --force -f /tmp/file.yaml
kubectl run bsybox --image=busybox:latest --rm -it --restart=Never
kubectl run bsybox --image=busybox:latest --rm -it --restart=Never
kubectl run busybox --image=busybox --dry-run --generator=cronjob/v1beta1 --schedule="*/1 \_ \* \* \*" -- /bin/sh -c "date; echo hello from kubernetes cluster"
kubectl run busybox --image=busybox --dry-run --generator=cronjob/v1beta1 --schedule="*/1 \_ \* \* \*" -- /bin/sh -c "date; echo hello from kubernetes cluster"
kubectl run busybox --image=busybox --rm -it --restart=Never -- wget -O- 10.1.1.131:80
kubectl run busybox --image=busybox --rm -it --restart=Never -- wget -O- 10.1.1.131:80
kubectl run busybox --image=busybox -it --rm --restart=Never -- /bin/sh -c 'echo hello world'
kubectl run busybox --image=busybox -it --rm --restart=Never -- /bin/sh -c 'echo hello world'
kubectl run frontend --replicas=2 --labels=run=load-balancer-example --image=busybox  --port=8080
kubectl run nginx --image=nginx   (deployment)
kubectl run nginx --image=nginx  --restart=OnFailure --schedule="* * * * *" (cronJob)
kubectl run nginx --image=nginx --restart=Never
kubectl run nginx --image=nginx --restart=Never
kubectl run nginx --image=nginx --restart=Never   (pod)
kubectl run nginx --image=nginx --restart=OnFailure   (job)
kubectl run nginx --image=nginx:latest --generator=run-pod/v1 --limts="cpu=200m,memory=512Mi"
kubectl run nginx --image=nginx:latest --generator=run-pod/v1 --limts="cpu=200m,memory=512Mi"
kubectl run nginx --restart=Never --image=nginx --env=var1=val1 -it --rm -- env
kubectl run nginx --restart=Never --image=nginx --env=var1=val1 -it --rm -- env
kubectl run nginx -image=nginx --restart=Never --port=80 --namespace=myname --command --serviceaccount=mysa1 --env=HOSTNAME=local --labels=bu=finance,env=dev  --requests='cpu=100m,memory=256Mi' --limits='cpu=200m,memory=512Mi' --dry-run -o yaml - /bin/sh -c 'echo hello world'
kubectl run redis --image=redis --restart=Never -n finance
kubectl run redis --image=redis --restart=Never -n finance
kubectl run tmp --restart=Never --rm -i --image=busybox --command -- wget -O- www.google.com
kubectl run tmp --restart=Never --rm -i --image=busybox --command -- wget -O- www.google.com
kubectl run tmp --restart=Never --rm -i --image=nginx:alpine --command -- curl www.google.com
kubectl run tmp --restart=Never --rm -i --image=nginx:alpine --command -- curl www.google.com
kubectl scale --replicas=4 rs/new-replica-set
kubectl scale --replicas=4 rs/new-replica-set
kubectl set image pod/nginx nginx=nginx:1.7.1
kubectl set image pod/nginx nginx=nginx:1.7.1
kubectl set serviceaccount deployment frontend myuser
kubectl top node
kubectl top node
kubectl top pod
kubectl top pod