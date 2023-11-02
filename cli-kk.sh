apt-get install -y apt-utils etcd-client
args: [/bin/sh, -c,'i=0; while true; do echo "$i: $(date)"; i=$((i+1)); sleep 1; done']
args: I"-c", "mkdir -p collect; while true; do cat /var/data/* > /collect/data.txt; sleep 10; done"]
args: I"-c", "while true; do date > /var/log/app.txt; sleep 5;done"]
basenc -d --base64url -i <your_file> | jq # JWT decode
cat /etc/kubernetes/manifests/kube-apiserver.yaml | yq .enable-admission-plugins
curl localhost:8001/apis/authorization.k8s.io
docker build -t webapp-color .
docker image history python:3.6
docker image inspect python:3.6
docker run -d -p 8080:8282 webapp-color
docker run python:3.6 cat /etc/*release*
export ns=default
from: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-ingress-em-
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
helm install bravo bitnami/drupal
helm list
helm pull --untar  bitnami/apache
helm pull --untar bitnami/wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
helm search hub wordpress
helm search repo apache
helm search repo wordpress
k get configmaps
kubect describe pods | grep --context=10 Events:
kubect describe pods | grep -context=10 annotations:
kubectl -n elastic-stack logs kibana
kubectl -n webhook-demo create secret tls webhook-server-tls --cert "/root/keys/webhook-server-tls.crt" --key "/root/keys/webhook-server-tls.key"
kubectl annotate --overwrite pods foo description='my frontend running nginx'
kubectl annotate -f pod.json description='my frontend'
kubectl annotate pods --all description='my frontend running nginx'
kubectl annotate pods foo description-
kubectl annotate pods foo description='my frontend running nginx' --resource-version=1
kubectl annotate pods foo description='my frontend'
kubectl api-resources
kubectl api-resources --api-group=extensions
kubectl api-resources --namespaced=false
kubectl api-resources --namespaced=true
kubectl api-resources --sort-by=name
kubectl api-resources -o wide
kubectl api-versions
kubectl apply --prune -f manifest.yaml --all --prune-whitelist=core/v1/ConfigMap
kubectl apply --prune -f manifest.yaml -l app=nginx
kubectl apply -f ./pod.json
kubectl apply -k dir/
kubectl apply edit-last-applied -f deploy.yaml -o json
kubectl apply edit-last-applied deployment/nginx
kubectl apply set-last-applied -f deploy.yaml
kubectl apply set-last-applied -f deploy.yaml --create-annotation=true
kubectl apply set-last-applied -f path/
kubectl apply view-last-applied -f deploy.yaml -o json
kubectl apply view-last-applied deployment/nginx
kubectl attach mypod
kubectl attach mypod -c ruby-container
kubectl attach mypod -c ruby-container -i -t
kubectl attach rs/nginx
kubectl auth can-i --list --namespace=foo
kubectl auth can-i '*' '*'
kubectl auth can-i create deployments
kubectl auth can-i create deployments --as dev-user
kubectl auth can-i create pods --all-namespaces
kubectl auth can-i delete nodes
kubectl auth can-i get /logs/
kubectl auth can-i get pods --subresource=log
kubectl auth can-i list deployments.apps
kubectl auth can-i list jobs.batch/bar -n foo
kubectl auth can-i list pods --as dev-user
kubectl auth can-i list storageclasses --as michelle
kubectl auth reconcile -f my-rbac-rules.yaml
kubectl autoscale deployment foo --min=2 --max=10
kubectl autoscale rc foo --max=5 --cpu-percent=80
kubectl certificate approve allows a cluster admin to approve a certificate signing request (CSR). This action tells a certificate signing controller to issue a certificate to the requestor with the attributes requested in the CSR.
kubectl certificate approve csr-sqgzp
kubectl certificate deny allows a cluster admin to deny a certificate signing request (CSR). This action tells a certificate signing controller to not to issue a certificate to the requestor.
kubectl certificate deny csr-sqgzp
kubectl cluster-info
kubectl cluster-info dump
kubectl cluster-info dump --all-namespaces
kubectl cluster-info dump --namespaces default,kube-system --output-directory=/path/to/cluster-state
kubectl cluster-info dump --output-directory=/path/to/cluster-state
kubectl completion bash > ~/.kube/completion.bash.inc
kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
kubectl completion zsh > "${fpath[1]}/_kubectl"
kubectl config
kubectl config current-context
kubectl config current-context
kubectl config delete-cluster minikube
kubectl config delete-context minikube
kubectl config delete-user minikube
kubectl config get-clusters
kubectl config get-contexts
kubectl config get-contexts my-context
kubectl config get-users
kubectl config rename-context old-name new-name
kubectl config set clusters.my-cluster.certificate-authority-data $(echo "cert_data_here" | base64 -i -)
kubectl config set clusters.my-cluster.server https://1.2.3.4
kubectl config set contexts.my-context.cluster my-cluster
kubectl config set users.cluster-admin.client-key-data cert_data_here --set-raw-bytes=true
kubectl config set-cluster e2e --embed-certs --certificate-authority=~/.kube/e2e/kubernetes.ca.crt
kubectl config set-cluster e2e --insecure-skip-tls-verify=true
kubectl config set-cluster e2e --server=https://1.2.3.4
kubectl config set-cluster e2e --tls-server-name=my-cluster-name
kubectl config set-context --current --namespace blue
kubectl config set-context --current --namespace=elastic-stack
kubectl config set-context $(kubectl config current-context) --namespace=dev
kubectl config set-context gce --user=cluster-admin
kubectl config set-credentials cluster-admin --auth-provider=gcp
kubectl config set-credentials cluster-admin --auth-provider=oidc --auth-provider-arg=client-id=foo --auth-provider-arg=client-secret=bar
kubectl config set-credentials cluster-admin --auth-provider=oidc --auth-provider-arg=client-secret-
kubectl config set-credentials cluster-admin --client-certificate=~/.kube/admin.crt --embed-certs=true
kubectl config set-credentials cluster-admin --client-key=~/.kube/admin.key
kubectl config set-credentials cluster-admin --exec-arg=arg1 --exec-arg=arg2
kubectl config set-credentials cluster-admin --exec-command=/path/to/the/executable --exec-api-version=client.authentication.k8s.io/v1beta1
kubectl config set-credentials cluster-admin --exec-env=key1=val1 --exec-env=key2=val2
kubectl config set-credentials cluster-admin --exec-env=var-to-remove-
kubectl config set-credentials cluster-admin --username=admin --password=uXFGweU9l35qcif
kubectl config unset contexts.foo.namespace
kubectl config unset current-context
kubectl config use-context minikube
kubectl config view
kubectl config view --minify | grep namespace:
kubectl config view --raw
kubectl config view -o jsonpath='{.users[?(@.name == "e2e")].user.password}'
kubectl cordon foo
kubectl cp /tmp/foo <some-namespace>/<some-pod>:/tmp/bar
kubectl cp /tmp/foo <some-pod>:/tmp/bar -c <specific-container>
kubectl cp /tmp/foo_dir <some-pod>:/tmp/bar_dir
kubectl cp <some-namespace>/<some-pod>:/tmp/foo /tmp/bar
kubectl create -f .
kubectl create -f ./pod.json
kubectl create -f docker-registry.yaml --edit -o json
kubectl create clusterrole "foo" --verb=get --non-resource-url=/logs/*
kubectl create clusterrole foo --verb=get,list,watch --resource=pods,pods/status
kubectl create clusterrole foo --verb=get,list,watch --resource=rs.extensions
kubectl create clusterrole monitoring --aggregation-rule="rbac.example.com/aggregate-to-monitoring=true"
kubectl create clusterrole pod-reader --verb=get --resource=pods --resource-name=readablepod --resource-name=anotherpod
kubectl create clusterrole pod-reader --verb=get,list,watch --resource=pods
kubectl create clusterrolebinding cluster-admin --clusterrole=cluster-admin --user=user1 --user=user2 --group=group1
kubectl create clusterrolebinding michelle-storage-admin --clusterrole=storage-admin --user=michelle
kubectl create configmap app-config --from-file=app config.properties
kubectl create configmap app-config --from-file=app_config.properties
kubectl create configmap app-config --from-literal=APP_COLOR=blue --from-literal=APP_MOD=prod
kubectl create configmap app-config --from-literal=APP_COLOR=blue --from-literal=APP_MOD=prod
kubectl create configmap my-config --from-env-file=path/to/bar.env
kubectl create configmap my-config --from-file=key1=/path/to/bar/file1.txt --from-file=key2=/path/to/bar/file2.txt
kubectl create configmap my-config --from-file=path/to/bar
kubectl create configmap my-config --from-literal=key1=config1 --from-literal=key2=config2
kubectl create cronjob my-job --image=busybox --schedule="*/1 * * * *"
kubectl create cronjob my-job --image=busybox --schedule="*/1 * * * *" -- date
kubectl create deploy nginx --image=nginx:1.18.0 --replicas=2 --port=80
kubectl create deployment <deployment name> --image <name>
kubectl create deployment my-dep --image=busybox
kubectl create deployment my-dep --image=busybox -- date
kubectl create deployment my-dep --image=busybox --port=5701
kubectl create deployment my-dep --image=nginx --replicas=3
kubectl create deployment my-dep -o yaml --dry-run=client | kubectl label --local -f - environment=qa -o yaml | kubectl create -f -
kubectl create ingress annotated --class=default --rule="foo.com/bar=svc:port" --annotation ingress.annotation1=foo --annotation ingress.annotation2=bla
kubectl create ingress catch-all --class=otheringress --rule="/path=svc:port"
kubectl create ingress ingdefault --class=default --default-backend=defaultsvc:http --rule="foo.com/*=svc:8080,tls=secret1"
kubectl create ingress ingress1 --class=default --rule="foo.com/path*=svc:8080" --rule="bar.com/admin*=svc2:http"
kubectl create ingress ingsecret --class=default --rule="foo.com/*=svc:8080,tls=secret1"
kubectl create ingress ingtls --class=default --rule="foo.com/=svc:https,tls" --rule="foo.com/path/subpath*=othersvc:8080"
kubectl create ingress multipath --class=default --rule="foo.com/=svc:port" --rule="foo.com/admin/=svcadmin:portadmin"
kubectl create ingress simple --rule="foo.com/bar=svc1:8080,tls=my-cert"
kubectl create job my-job --image=busybox
kubectl create job my-job --image=busybox -- date
kubectl create job test-job --from=cronjob/a-cronjob
kubectl create namespace my-namespace
kubectl create pdb my-pdb --selector=app=nginx --min-available=50%
kubectl create poddisruptionbudget my-pdb --selector=app=rails --min-available=1
kubectl create priorityclass default-priority --value=1000 --global-default=true --description="default priority"
kubectl create priorityclass high-priority --value=1000 --description="high priority"
kubectl create priorityclass high-priority --value=1000 --description="high priority" --preemption-policy="Never"
kubectl create quota best-effort --hard=pods=100 --scopes=BestEffort
kubectl create quota my-quota --hard=cpu=1,memory=1G,pods=2,services=3,replicationcontrollers=2,resourcequotas=1,secrets=5,persistentvolumeclaims=10
kubectl create quota myrq --hard=cpu=1,memory=1G,pods=2 --dry-run=client -o yaml
kubectl create role developer --verb=list,create,delete --resource=pods
kubectl create role foo --verb=get,list,watch --resource=pods,pods/status
kubectl create role foo --verb=get,list,watch --resource=rs.extensions
kubectl create role pod-reader --verb=get --resource=pods --resource-name=readablepod --resource-name=anotherpod
kubectl create role pod-reader --verb=get --verb=list --verb=watch --resource=pods
kubectl create rolebinding admin --clusterrole=admin --user=user1 --user=user2 --group=group1
kubectl create rolebinding admin --role=admin --user=admin -o yaml --dry-run=client | kubectl set subject --local -f - --user=foo -o yaml
kubectl create secret docker-registry my-secret --docker-server=DOCKER_REGISTRY_SERVER --docker-username=DOCKER_USER --docker-password=DOCKER_PASSWORD --docker-email=DOCKER_EMAIL
kubectl create secret docker-registry my-secret --from-file=.dockerconfigjson=path/to/.docker/config.json
kubectl create secret generic app-secret --from-file=app_secret.properties
kubectl create secret generic app-secret --from-literal=DB_Host=mysql --from-literal=DB_User=root --from-literal=DB_Password=paswrd
kubectl create secret generic my-secret --from-env-file=path/to/bar.env
kubectl create secret generic my-secret --from-file=path/to/bar
kubectl create secret generic my-secret --from-file=ssh-privatekey=path/to/id_rsa --from-file=ssh-publickey=path/to/id_rsa.pub
kubectl create secret generic my-secret --from-file=ssh-privatekey=path/to/id_rsa --from-literal=passphrase=topsecret
kubectl create secret generic my-secret --from-literal=key1=supersecret --from-literal=key2=topsecret
kubectl create secret tls tls-secret --cert=path/to/tls.cert --key=path/to/tls.key
kubectl create service clusterip my-cs --clusterip="None"
kubectl create service clusterip my-cs --tcp=5678:8080
kubectl create service clusterip my-cs --tcp=5678:8080 --dry-run -o yaml
kubectl create service clusterip my-cs -†cp=5678:8080 -dry-run -o yaml
kubectl create service clusterip my-svc --clusterip="None" -o yaml --dry-run=client | kubectl set selector --local -f - 'environment=qa' -o yaml | kubectl create -f -
kubectl create service externalname my-ns --external-name bar.com
kubectl create service loadbalancer my-lbs --tcp=5678:8080
kubectl create service nodeport my-ns --tcp=5678:8080
kubectl create service-account dashboard-sa
kubectl create serviceaccount my-service-account
kubectl create token dashboard-sa
kubectl debug --image=myproj/debug-tools -c debugger mypod
kubectl debug mypod --copy-to=my-debugger --set-image=*=busybox
kubectl debug mypod -it --copy-to=my-debugger --container=mycontainer -- sh
kubectl debug mypod -it --copy-to=my-debugger --image=debian --set-image=app=app:debug,sidecar=sidecar:debug
kubectl debug mypod -it --image=busybox
kubectl debug mypod -it --image=busybox --copy-to=my-debugger
kubectl debug node/mynode -it --image=busybox
kubectl delete -f ./pod.json
kubectl delete -k dir
kubectl delete pod foo --force
kubectl delete pod foo --now
kubectl delete pod,service baz foo
kubectl delete pod/busybox1
kubectl delete pods --all
kubectl delete pods,services -l name=myLabel
kubectl deploy --help
kubectl describe -f pod.json
kubectl describe ingress --namespace app-space
kubectl describe nodes kubernetes-node-emt8.c.myproject.internal
kubectl describe po -l name=myLabel
kubectl describe pod kube-apiserver-controlplane -n kube-system | grep  authorization-mode # --authorization-mode=Node,RBAC
kubectl describe pod my-kubernetes-dashboard
kubectl describe pods
kubectl describe pods frontend
kubectl describe pods/nginx
kubectl describe rolebinding kube-proxy -n kube-system
kubectl diff -f pod.json
kubectl drain foo --force
kubectl drain foo --grace-period=900
kubectl edit deployment/mydeployment -o yaml --save-config
kubectl edit job.v1.batch/myjob -o json
kubectl edit pod <pod-name> command to edit pod properties.
kubectl edit role developer -n blue
kubectl edit svc/docker-registry
kubectl exec -it my-kubernetes-dashboard cat /var/run/secrets/kubernetes.io/serviceaccount/token
kubectl exec -it my-kubernetes-dashboard ls /var/run/secrets/kubernetes.io/serviceaccount
kubectl exec -n <some-namespace> <some-pod> -- tar cf - /tmp/foo | tar xf - -C /tmp/bar
kubectl exec ${POD*NAME} -- whoami
kubectl exec deploy/mydeployment -- date
kubectl exec kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep enable-admission-plugins
kubectl exec mypod -- date
kubectl exec mypod -c ruby-container -- date
kubectl exec mypod -c ruby-container -i -t -- bash -il
kubectl exec mypod -i -t -- ls -t /usr
kubectl exec svc/myservice -- date
kubectl exec webapp -- cat /log/app.log
kubectl explain cronjob.spec.jobTemplate -recursive
kubectl explain deploy.spec.template.spec.containers.ports
kubectl explain pods
kubectl explain pods.spec.containers
kubectl explain replicaset
kubectl explain resourcequota
kubectl expose -f nginx-controller.yaml --port=80 --target-port=8000
kubectl expose deployment frontend --type=NodePort --name=frontend-service --port=6262 --target-port=8080
kubectl expose deployment nginx --port=80 --target-port=8000
kubectl expose pod valid-pod --port=444 --name=frontend
kubectl expose rc nginx --port=80 --target-port=8000
kubectl expose rc streamer --port=4100 --protocol=UDP --name=video-stream
kubectl expose rs nginx --port=80 --target-port=8000
kubectl expose service nginx --port=443 --target-port=8443 --name=nginx-https
kubectl get -f pod.yaml -o json
kubectl get -k dir/
kubectl get -o json pod web-pod-13je7
kubectl get -o template pod/web-pod-13je7 --template={{.status.phase}}
kubectl get all
kubectl get all --all-namespaces=true
kubectl get deployments.v1.apps -o json
kubectl get netpol
kubectl get networkpolicy
kubectl get po nginx -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get po nginx -oyaml
kubectl get pod <pod-name> -o yaml > pod-definition.yaml
kubectl get pod mypod -o yaml | sed 's/\(image: myimage\):.*$/\1:v4/' | kubectl replace -f -
kubectl get pod test-pod -o custom-columns=CONTAINER:.spec.containers[0].name,IMAGE:.spec.containers[0].image
kubectl get pods
kubectl get pods --selector env=dev
kubectl get pods -o wide
kubectl get rc,services
kubectl get rc/web service/frontend pods/web-pod-13je7
kubectl get replicationcontroller web
kubectl get role
kubectl get role -A --no-headers -n kube-system
kubectl get rolebindings -n kube-system
kubectl get service-account
kubectl kustomize
kubectl kustomize /home/config/production
kubectl kustomize https://github.com/kubernetes-sigs/kustomize.git/examples/helloWorld?ref=v1.0.6
kubectl label --overwrite pods foo status=unhealthy
kubectl label -f pod.json status=unhealthy
kubectl label pods --all status=unhealthy
kubectl label pods foo bar-
kubectl label pods foo status=unhealthy --resource-version=1
kubectl label pods foo unhealthy=true
kubectl logs --insecure-skip-tls-verify-backend nginx
kubectl logs --since=1h nginx
kubectl logs --tail=20 nginx
kubectl logs -f -c ruby web-1
kubectl logs -f -l app=nginx --all-containers=true
kubectl logs -l app=nginx --all-containers=true
kubectl logs -p -c ruby web-1
kubectl logs deployment/nginx -c nginx-1
kubectl logs job/hello
kubectl logs nginx
kubectl logs nginx
kubectl logs nginx --all-containers=true
kubectl logs nginx --previous
kubectl options
kubectl patch -f node.json -p '{"spec":{"unschedulable":true}}'
kubectl patch node k8s-node-1 -p '{"spec":{"unschedulable":true}}'
kubectl patch node k8s-node-1 -p $'spec:\n unschedulable: true'
kubectl patch pod valid-pod --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value":"new image"}]'
kubectl patch pod valid-pod -p '{"spec":{"containers":[{"name":"kubernetes-serve-hostname","image":"new image"}]}}'
kubectl port-forward --address 0.0.0.0 pod/mypod 8888:5000
kubectl port-forward --address localhost,10.19.21.23 pod/mypod 8888:5000
kubectl port-forward deployment/mydeployment 5000 6000
kubectl port-forward pod/mypod :5000
kubectl port-forward pod/mypod 5000 6000
kubectl port-forward pod/mypod 8888:5000
kubectl port-forward service/myservice 8443:https
kubectl proxy
kubectl proxy --api-prefix=/
kubectl proxy --api-prefix=/custom/
kubectl proxy --api-prefix=/k8s-api
kubectl proxy --port=0
kubectl proxy --port=8011 --www=./local/www/
kubectl proxy --www=/my/files --www-prefix=/static/ --api-prefix=/api/
kubectl proxy 8001&
kubectl replace --force -f ./pod.json
kubectl replace --force -f /tmp/file.yaml
kubectl replace -f ./pod.json
kubectl rollout history daemonset/abc --revision=3
kubectl rollout history deployment/abc
kubectl rollout pause deployment/nginx
kubectl rollout restart daemonset/abc
kubectl rollout restart deployment/nginx
kubectl rollout resume deployment/nginx
kubectl rollout status daemonset/foo
kubectl rollout status deployment/nginx
kubectl rollout undo --dry-run=server deployment/abc
kubectl rollout undo daemonset/abc --to-revision=3
kubectl rollout undo deployment/abc
kubectl run -i -t busybox --image=busybox --restart=Never
kubectl run bsybox --image=busybox:latest --rm -it --restart=Never
kubectl run busybox --image=busybox --dry-run --generator=cronjob/v1beta1 --schedule="*/1 \_ \* \* \*" -- /bin/sh -c "date; echo hello from kubernetes cluster"
kubectl run busybox --image=busybox --rm -it --restart=Never -- wget -O- 10.1.1.131:80
kubectl run busybox --image=busybox -it --rm --restart=Never -- /bin/sh -c 'echo hello world'
kubectl run frontend --replicas=2 --labels=run=load-balancer-example --image=busybox  --port=8080
kubectl run frontend -replicas=2 -labels=run=load-balancer-example -image=busybox -port=8080 kubect expose deployment frontend -type=NodePort name=frontend-service --port=6262 -target-port=8080
kubectl run hazelcast --image=hazelcast/hazelcast --env="DNS_DOMAIN=cluster" --env="POD_NAMESPACE=default"
kubectl run hazelcast --image=hazelcast/hazelcast --labels="app=hazelcast,env=prod"
kubectl run hazelcast --image=hazelcast/hazelcast --port=5701
kubectl run nginx --image=nginx
kubectl run nginx --image=nginx   (deployment)
kubectl run nginx --image=nginx  --restart=OnFailure --schedule="* * * * *" (cronJob)
kubectl run nginx --image=nginx -- <arg1> <arg2> ... <argN>
kubectl run nginx --image=nginx --command -- <cmd> <arg1> ... <argN>
kubectl run nginx --image=nginx --command -- <cmd> <arg1> ... <argN>
kubectl run nginx --image=nginx --dry-run=client
kubectl run nginx --image=nginx --overrides='{ "apiVersion": "v1", "spec": { ... } }'
kubectl run nginx --image=nginx --restart=Never   (pod)
kubectl run nginx --image=nginx --restart=OnFailure   (job)
kubectl run nginx --image=nginx -restart=Never (pod)
kubectl run nginx --image=nginx:latest --generator=run-pod/v1 --limts="cpu=200m,memory=512Mi"
kubectl run nginx --restart=Never --image=nginx --env=var1=val1 -it --rm -- env
kubectl run nginx -image=nginx --restart=Never --port=80 --namespace=myname --command --serviceaccount=mysa1 --env=HOSTNAME=local --labels=bu=finance,env=dev  --requests='cpu=100m,memory=256Mi' --limits='cpu=200m,memory=512Mi' --dry-run -o yaml - /bin/sh -c 'echo hello world'
kubectl run nginx -image=nginx -restart=Never -port=80 -namespace=myname -command --serviceaccount=mysal -env=HOSTNAME=local --labels=bu=finance,env=dev --requests='cpu=100m,memory=256Mi' -limits='cpu=200m,memory=512Mi' -dry-run -o yamI /bin/sh -c 'echo hello world'
kubectl run nginx -image=nginx -restart=OnFailure -schedule="* * * * * *" (cronJob)
kubectl run nginx -image=nginx -restart=OnFailure (job)
kubectl run nginx -image=nginx (deployment)
kubectl run redis --image=redis --restart=Never -n finance
kubectl run tmp --restart=Never --rm -i --image=busybox --command -- wget -O- www.google.com
kubectl run tmp --restart=Never --rm -i --image=nginx:alpine --command -- curl www.google.com
kubectl scale --current-replicas=2 --replicas=3 deployment/mysql
kubectl scale --replicas=3 -f foo.yaml
kubectl scale --replicas=3 rs/foo
kubectl scale --replicas=3 statefulset/web
kubectl scale --replicas=4 rs/new-replica-set
kubectl scale --replicas=5 rc/foo rc/bar rc/baz
kubectl set env --from=configmap/myconfigmap --prefix=MYSQL_ deployment/myapp
kubectl set env --from=secret/mysecret deployment/myapp
kubectl set env --keys=my-example-key --from=configmap/myconfigmap deployment/myapp
kubectl set env -f deploy.json ENV-
kubectl set env deployment/registry STORAGE_DIR=/local
kubectl set env deployment/sample-build --list
kubectl set env deployment/sample-build STORAGE_DIR=/data -o yaml
kubectl set env deployments --all --containers="c1" ENV-
kubectl set env pods --all --list
kubectl set env rc --all ENV=prod
kubectl set image -f path/to/file.yaml nginx=nginx:1.9.1 --local -o yaml
kubectl set image daemonset abc *=nginx:1.9.1
kubectl set image deployment/nginx busybox=busybox nginx=nginx:1.9.1
kubectl set image deployments,rc nginx=nginx:1.9.1 --all
kubectl set image pod/nginx nginx=nginx:1.7.1
kubectl set resources -f path/to/file.yaml --limits=cpu=200m,memory=512Mi --local -o yaml
kubectl set resources deployment nginx --limits=cpu=0,memory=0 --requests=cpu=0,memory=0
kubectl set resources deployment nginx --limits=cpu=200m,memory=512Mi --requests=cpu=100m,memory=256Mi
kubectl set resources deployment nginx -c=nginx --limits=cpu=200m,memory=512Mi
kubectl set sa -f nginx-deployment.yaml serviceaccount1 --local --dry-run=client -o yaml
kubectl set serviceaccount deployment frontend myuser
kubectl set serviceaccount deployment frontend myuser
kubectl set serviceaccount deployment nginx-deployment serviceaccount1
kubectl set subject clusterrolebinding admin --serviceaccount=namespace:serviceaccount1
kubectl set subject rolebinding admin --user=user1 --user=user2 --group=group1
kubectl taint node -l myLabel=X  dedicated=foo:PreferNoSchedule
kubectl taint nodes foo bar:NoSchedule
kubectl taint nodes foo dedicated-
kubectl taint nodes foo dedicated:NoSchedule-
kubectl taint nodes foo dedicated=special-user:NoSchedule
kubectl top node
kubectl top node NODE_NAME
kubectl top pod
kubectl top pod --namespace=NAMESPACE
kubectl top pod -l name=myLabel
kubectl top pod POD_NAME --containers
kubectl uncordon foo
kubectl version
kubectl wait --for=condition=Ready pod/busybox1
kubectl wait --for=condition=Ready=false pod/busybox1
kubectl wait --for=delete pod/busybox1 --timeout=60s
shell: a=10;b=5; if [ $a-le $b ]; then echo "a is small"; else echo "b is small"; fi
shell: x=1; while [$× -le 10 ]; do echo "welcome $x times"; x=$((×+1)); done
