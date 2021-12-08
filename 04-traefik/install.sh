### CREATE
###
#microk8s kubectl create namespace traefik

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

# HTTPS Keys
#for a in default kube-system traefik
#do
#  kubectl apply -n $a -f tls-keys.yaml
#done

###
# htaccess users
kubectl delete -n traefik secret/traefik-htaccess > /dev/null 2>&1
htpasswd -Bn admin > users && microk8s kubectl create secret generic traefik-htaccess -n traefik --from-file=users && rm -f users

#cat <<'EOF'|microk8s kubectl apply -f -
#---
#apiVersion: traefik.containo.us/v1alpha1
#kind: Middleware
#metadata:
#  name: auth-dashboard
#  namespace: traefik
#
#spec:
#  basicAuth:
#    secret: traefik-htaccess
#EOF
#
#kubectl delete -n traefik ingressroute/dashboard > /dev/null 2>&1
#cat <<'EOF'|microk8s kubectl apply -f -
#---
#apiVersion: traefik.containo.us/v1alpha1
#kind: IngressRoute
#metadata:
#  name: dashboard
#  namespace: traefik
#  annotations:
#    kubernetes.io/ingress.class: "traefik"
#
#spec:
#  entryPoints:
#    - websecure
#  tls:
#    secretName: tls-gamehost
#  routes:
#    - match: Host(`traefik.apps.gamehost.fi`)  && (PathPrefix(`/api`) || PathPrefix(`/dashboard`))
#      kind: Rule
#      services:
#        - name: api@internal
#          kind: TraefikService
#      middlewares:
#        - name: auth-dashboard
#EOF
