install -m 777 -d /data/kube/minio
kubectl create ns minio
kubectl apply -k 06-minio -n minio
