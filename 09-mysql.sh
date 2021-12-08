install -o 999 -g 999 -m 750 -d /data/kube/mysql
kubectl apply -f 09-app-mysql.yaml
sleep 2
argocd app sync 09-mysql
