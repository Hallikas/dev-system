argocd login argocd.apps.gamehost.fi --grpc-web --name admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d;echo) --name admin
argocd app sync minio
sleep 30

install -o 1001 -g 0 -m 700 -d /data/kube/minio

mc config host rm s3
mc config host rm local
mc config host rm gcs
mc config host rm play

mc alias set minio https://minio.apps.gamehost.fi:9000 $(kubectl -n minio get secret minio -o jsonpath="{.data.root-user}"|base64 -d) $(kubectl -n minio get secret minio -o jsonpath="{.data.root-password}"|base64 -d)  --api S3v4
mc admin user add minio gitlab 75CkVM5fSnhzujwCUrtcvRetRbejzR
mc alias set gitlab https://minio.apps.gamehost.fi:9000 gitlab 75CkVM5fSnhzujwCUrtcvRetRbejzR --api S3v4
mc admin policy set minio readwrite user=gitlab

mc mb gitlab/gitlab-registry-storage
mc mb gitlab/gitlab-lfs-storage
mc mb gitlab/gitlab-artifacts-storage
mc mb gitlab/gitlab-uploads-storage
mc mb gitlab/gitlab-packages-storage
mc mb gitlab/gitlab-backup-storage
