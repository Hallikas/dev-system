### GET TRAEFIK CRD DEFINITIONS
#cat <<'EOF'|for a in `cat -`
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_ingressroutes.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_ingressroutetcps.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_ingressrouteudps.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_middlewares.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_middlewaretcps.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_serverstransports.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_tlsoptions.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_tlsstores.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/traefik.containo.us_traefikservices.yaml
#https://raw.githubusercontent.com/traefik/traefik/master/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml
#EOF
#do
#  microk8s kubectl create -f $a || break
#done

# htaccess users
kubectl delete -n traefik secret/traefik-htaccess > /dev/null 2>&1
htpasswd -Bn admin > users && microk8s kubectl create secret generic traefik-htaccess -n traefik --from-file=users && rm -f users
