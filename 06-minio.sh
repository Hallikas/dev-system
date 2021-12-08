install -m 777 -d /data/kube/minio
kubectl create ns minio
kubectl apply -k 06-minio

install -o 1001 -g 0 -m 700 -d /data/kube/minio
06-minio/install.sh
