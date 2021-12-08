apt-get install -y ca-certificates curl gnupg lsb-release

# We use original docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Install Docker-CE. Note! This is NOT used by Kubernetes, but may want to use plain docker too.
apt-get install docker-ce docker-ce-cli containerd.io

# Override start parameters, so we can use them from daemon.json
mkdir /etc/systemd/system/docker.service.d
cat <<'EOF' > /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF
systemctl daemon-reload

cat <<'EOF' > /etc/docker/daemon.json
{
  "hosts": ["tcp://127.0.0.1:2375", "tcp://10.0.1.1:2375", "unix:///var/run/docker.sock"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "exec-opts": ["native.cgroupdriver=systemd"],
  "graph": "/var/lib/docker",
  "storage-driver": "overlay2",
  "insecure-registries" : ["localhost:5000","git.gamehost.fi:5000","dev.gamehost.fi:5000","registry.gamehost.fi:5000","registry.apps.gamehost.fi:5000","docker-registry.default.svc:5000","registry.default.svc:5000","registry.container-registry.svc:5000","10.0.1.0/24","172.30.0.0/16","172.18.0.0/24","172.17.0.0/24","10.1.90.0/24"]
}
EOF

# Create our own private network, for testing...
docker network create gamehost
sleep 1
service docker restart
