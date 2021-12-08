GITLAB_PASS=$(openssl rand -base64 20)

cat <<"EOF" > 07-gitlab/_storage.yaml
s3:
  v4auth: true
  regionendpoint: "https://minio.apps.gamehost.fi:9000"
  pathstyle: true
  region: us-east-1
  bucket: registry
  accesskey: gitlab
  secretkey: ${GITLAB_PASS}
EOF
cat <<"EOF" > 07-gitlab/_connection.yaml
provider: AWS
region: us-east-1
aws_access_key_id: gitlab
aws_secret_access_key: ${GITLAB_PASS}
aws_signature_version: 4
host: minio.apps.gamehost.fi
endpoint: "https://minio.apps.gamehost.fi:9000"
path_style: true
EOF

perl -pi -e "s|^  secretkey:.*$|  secretkey: ${GITLAB_PASS}|" 07-gitlab/_storage.yaml
perl -pi -e "s|^aws_secret_access_key:.*$|aws_secret_access_key: ${GITLAB_PASS}|" 07-gitlab/_connection.yaml

kubectl create secret generic s3-object-storage --from-file=connection=07-gitlab/_connection.yaml --dry-run=client -o yaml > 07-gitlab/s3-object-storage-connection.yaml
kubectl create secret generic registry-storage --from-file=config=07-gitlab/_storage.yaml --dry-run=client -o yaml > 07-gitlab/registry-storage.yaml

kubectl apply -n gitlab -f 07-gitlab/s3-object-storage-connection.yaml
kubectl apply -n gitlab -f 07-gitlab/registry-storage.yaml

install -o 1000 -g 1000 -m 700 -d /data/kube/gitlab/gitaly
install -o 1001 -g 0 -m 700 -d /data/kube/gitlab/postgresql
install -o 1001 -g 0 -m 700 -d /data/kube/gitlab/redis

mc --insecure admin user remove minio gitlab
mc alias rm gitlab

mc --insecure admin user add minio gitlab ${GITLAB_PASS}
mc --insecure admin policy set minio readwrite user=gitlab

mc alias set gitlab https://minio.apps.gamehost.fi:9000 gitlab ${GITLAB_PASS} --api S3v4

mc --insecure mb gitlab/gitlab-registry-storage
mc --insecure mb gitlab/gitlab-lfs-storage
mc --insecure mb gitlab/gitlab-artifacts-storage
mc --insecure mb gitlab/gitlab-uploads-storage
mc --insecure mb gitlab/gitlab-packages-storage
mc --insecure mb gitlab/gitlab-backup-storage

kubectl create ns gitlab
kubectl apply -k 07-gitlab
sleep 10

argocd app sync gitlab
