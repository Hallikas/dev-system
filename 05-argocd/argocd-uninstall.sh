kubectl delete customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io -n argocd
kubectl delete customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io -n argocd
kubectl delete serviceaccount/argocd-application-controller -n argocd
kubectl delete serviceaccount/argocd-dex-server -n argocd
kubectl delete serviceaccount/argocd-redis -n argocd
kubectl delete serviceaccount/argocd-server -n argocd
kubectl delete role.rbac.authorization.k8s.io/argocd-application-controller -n argocd
kubectl delete role.rbac.authorization.k8s.io/argocd-dex-server -n argocd
kubectl delete role.rbac.authorization.k8s.io/argocd-server -n argocd
kubectl delete clusterrole.rbac.authorization.k8s.io/argocd-application-controller -n argocd
kubectl delete clusterrole.rbac.authorization.k8s.io/argocd-server -n argocd
kubectl delete rolebinding.rbac.authorization.k8s.io/argocd-application-controller -n argocd
kubectl delete rolebinding.rbac.authorization.k8s.io/argocd-dex-server -n argocd
kubectl delete rolebinding.rbac.authorization.k8s.io/argocd-redis -n argocd
kubectl delete rolebinding.rbac.authorization.k8s.io/argocd-server -n argocd
kubectl delete clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller -n argocd
kubectl delete clusterrolebinding.rbac.authorization.k8s.io/argocd-server -n argocd
kubectl delete configmap/argocd-cm -n argocd
kubectl delete configmap/argocd-cmd-params-cm -n argocd
kubectl delete configmap/argocd-gpg-keys-cm -n argocd
kubectl delete configmap/argocd-rbac-cm -n argocd
kubectl delete configmap/argocd-ssh-known-hosts-cm -n argocd
kubectl delete configmap/argocd-tls-certs-cm -n argocd
kubectl delete secret/argocd-secret -n argocd
kubectl delete service/argocd-dex-server -n argocd
kubectl delete service/argocd-metrics -n argocd
kubectl delete service/argocd-redis -n argocd
kubectl delete service/argocd-repo-server -n argocd
kubectl delete service/argocd-server -n argocd
kubectl delete service/argocd-server-metrics -n argocd
kubectl delete deployment.apps/argocd-dex-server -n argocd
kubectl delete deployment.apps/argocd-redis -n argocd
kubectl delete deployment.apps/argocd-repo-server -n argocd
kubectl delete deployment.apps/argocd-server -n argocd
kubectl delete statefulset.apps/argocd-application-controller -n argocd
kubectl delete networkpolicy.networking.k8s.io/argocd-application-controller-network-policy -n argocd
kubectl delete networkpolicy.networking.k8s.io/argocd-dex-server-network-policy -n argocd
kubectl delete networkpolicy.networking.k8s.io/argocd-redis-network-policy -n argocd
kubectl delete networkpolicy.networking.k8s.io/argocd-repo-server-network-policy -n argocd
kubectl delete networkpolicy.networking.k8s.io/argocd-server-network-policy -n argocd
kubectl delete namespace/argocd



namespace/argocd created
customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
serviceaccount/argocd-application-controller created
serviceaccount/argocd-dex-server created
serviceaccount/argocd-notifications-controller created
serviceaccount/argocd-redis created
serviceaccount/argocd-server created
role.rbac.authorization.k8s.io/argocd-application-controller created
role.rbac.authorization.k8s.io/argocd-dex-server created
role.rbac.authorization.k8s.io/argocd-notifications-controller created
role.rbac.authorization.k8s.io/argocd-server created
clusterrole.rbac.authorization.k8s.io/argocd-application-controller created
clusterrole.rbac.authorization.k8s.io/argocd-server created
rolebinding.rbac.authorization.k8s.io/argocd-application-controller created
rolebinding.rbac.authorization.k8s.io/argocd-dex-server created
rolebinding.rbac.authorization.k8s.io/argocd-notifications-controller created
rolebinding.rbac.authorization.k8s.io/argocd-redis created
rolebinding.rbac.authorization.k8s.io/argocd-server created
clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-server created
configmap/argocd-cm created
configmap/argocd-cmd-params-cm created
configmap/argocd-gpg-keys-cm created
configmap/argocd-notifications-cm created
configmap/argocd-rbac-cm created
configmap/argocd-ssh-known-hosts-cm created
configmap/argocd-tls-certs-cm created
secret/argocd-notifications-secret created
secret/argocd-secret created
service/argocd-dex-server created
service/argocd-metrics created
service/argocd-notifications-controller-metrics created
service/argocd-redis created
service/argocd-repo-server created
service/argocd-server created
service/argocd-server-metrics created
deployment.apps/argocd-dex-server created
deployment.apps/argocd-notifications-controller created
deployment.apps/argocd-redis created
deployment.apps/argocd-repo-server created
deployment.apps/argocd-server created
statefulset.apps/argocd-application-controller created
networkpolicy.networking.k8s.io/argocd-application-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-dex-server-network-policy created
networkpolicy.networking.k8s.io/argocd-redis-network-policy created
networkpolicy.networking.k8s.io/argocd-repo-server-network-policy created
networkpolicy.networking.k8s.io/argocd-server-network-policy created
customresourcedefinition.apiextensions.k8s.io/applicationsets.argoproj.io created
serviceaccount/argocd-applicationset-controller created
role.rbac.authorization.k8s.io/argocd-applicationset-controller created
rolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
service/argocd-applicationset-controller created
deployment.apps/argocd-applicationset-controller created
