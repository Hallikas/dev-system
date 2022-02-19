kubectl delete -n default secret/registry-htaccess > /dev/null 2>&1
htpasswd -Bn admin > users && microk8s kubectl create -n default secret generic registry-htaccess --from-file=users && rm -f users
