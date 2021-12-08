#!/bin/bash

## We use 1.22 Kubernetes, this has some big changes compared to older one,
## so you may occur some problems when using old yaml files
snap install microk8s --classic --channel=1.22/stable
microk8s status --wait-ready

# Add some plugins that we use.
microk8s enable dns dashboard storage host-access \
	metrics-server helm3

# Create aliases
snap alias microk8s.kubectl kubectl 
snap alias microk8s.helm3 helm

microk8s status --wait-ready

# These are here to be remembered
#microk8s config
#kubectl top node
