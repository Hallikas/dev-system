argocd login argocd.apps.gamehost.fi --grpc-web --name admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d;echo) --username admin
argocd app sync minio
sleep 30

install -o 1001 -g 0 -m 700 -d /data/kube/minio

mc config host rm s3
mc config host rm local
mc config host rm gcs
mc config host rm play

mc alias set minio https://minio.apps.gamehost.fi:9000 $(kubectl -n minio get secret minio -o jsonpath="{.data.root-user}"|base64 -d) $(kubectl -n minio get secret minio -o jsonpath="{.data.root-password}"|base64 -d)  --api S3v4
