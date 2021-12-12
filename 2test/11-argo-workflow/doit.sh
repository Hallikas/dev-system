kubectl create ns argo
kubectl apply -f application-argo-workflows.yaml
argocd app sync argo-workflows
sleep 10
kubectl apply -f ingressroute-argo.yaml
