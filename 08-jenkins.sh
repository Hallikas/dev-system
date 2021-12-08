install -o 1000 -g 1000 -m 750 -d /data/kube/jenkins
kubectl apply -f 08-app-jenkins.yaml
sleep 2
argocd app sync 08-jenkins
