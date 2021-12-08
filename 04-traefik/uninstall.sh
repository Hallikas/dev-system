### CLEAR
###
microk8s kubectl delete secret/tls-gamehost -n default
microk8s kubectl delete secret/tls-gamehost -n kube-system
microk8s kubectl delete secret/tls-gamehost -n traefik
microk8s kubectl delete secret/traefik-htaccess -n traefik
microk8s kubectl delete middleware/auth-dashboard -n traefik
microk8s kubectl delete serviceaccount/traefik -n traefik
microk8s kubectl delete middleware/force-secure -n default
microk8s kubectl delete ingressroute/catch-all -n default
microk8s kubectl delete deployment/traefik -n traefik
microk8s kubectl delete daemonset/traefik -n traefik
microk8s kubectl delete service/traefik -n ingress
microk8s kubectl delete ingressroute/dashboard -n traefik
microk8s kubectl delete service/traefik-ingress-service -n ingress
