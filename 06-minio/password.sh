kubectl -n minio get secret minio -o jsonpath="{.data.root-user}"|base64 -d;echo
kubectl -n minio get secret minio -o jsonpath="{.data.root-password}"|base64 -d;echo
