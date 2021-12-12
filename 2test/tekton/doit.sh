### CLEAR
###
kubectl create ns tekton-pipelines

kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml

microk8s kubectl delete ingressroute/console -n tekton-pipelines

### CREATE
###
microk8s kubectl apply -n tekton-pipelines -f - <<'EOF'
---
apiVersion: v1
kind: Secret
metadata:
  name: tekton-htaccess
  namespace: tekton-pipelines

data:
  users: |2
    c2VtaTokMnkkMDUkOFZGVFVXQlNrQmVuVzNxU2htdTJXZXVEbkRKdGRGblhKRHp2SmQ5Um1LQkpVaVFzRjRXNC4KCg==
---
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: auth-dashboard
  namespace: tekton-pipelines

spec:
  basicAuth:
    secret: tekton-htaccess
---
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: console

  annotations:
    kubernetes.io/ingress.class: "traefik"

spec:
  entryPoints:
    - websecure
  routes:
    - match: Host(`tekton.apps.gamehost.fi`)
      kind: Rule
      services:
        - name: tekton-dashboard
          port: 9097
#     middlewares:
#       - name: auth-dashboard
    - match: Host(`tekton.apps.gamehost.fi`) && (PathPrefix(`/api`) || PathPrefix(`/apis`))
      kind: Rule
      services:
        - name: tekton-dashboard
          port: 9097
  tls:
    secretName: tls-gamehost
EOF
