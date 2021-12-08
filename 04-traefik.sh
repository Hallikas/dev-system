#install -o 0 -g 0 -m 755 /data/kube/traefik
kubectl apply -k 04-traefik -n traefik
sleep 20
kubectl apply -k 04-traefik -n traefik && \
(
echo "Enter password for admin (used in traefik dashboard login)" && \
04-traefik/install.sh
)
