#!/bin/bash
## ArgoCD CLI
[ -e /usr/local/bin/argocd ] || (curl -L https://github.com/argoproj/argo-cd/releases/download/v2.1.6/argocd-linux-amd64 -o /usr/local/bin/argocd && chmod 755 /usr/local/bin/argocd)

## Argo (workflows)
[ -e /usr/local/bin/argo ] || (curl -sL https://github.com/argoproj/argo-workflows/releases/download/v3.2.4/argo-linux-amd64.gz|gzip -d > /usr/local/bin/argo && chmod 755 /usr/local/bin/argo)

## Minio
if [ ! -e /usr/local/bin/mc ]; then
	curl -o /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-amd64/mc
	chmod 755 /usr/local/bin/mc
fi

## Kubeseal
VER=v0.16.0
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/${VER}/kubeseal-linux-amd64 -O kubeseal
install -o root -g root -m 755 kubeseal /usr/local/bin/kubeseal && rm -f kubeseal

## Buildah & Skopeo
. /etc/os-release
curl -sL https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key|sudo apt-key add -
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
sudo apt-get update -qq
sudo apt-get -qq -y install buildah skopeo
