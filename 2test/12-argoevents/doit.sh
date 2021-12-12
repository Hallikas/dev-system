kubectl create ns argo-events
kubectl apply -f application-argo-events.yaml
argocd app sync argo-events
sleep 10
kubectl apply -f ingressroute-argo.yaml
