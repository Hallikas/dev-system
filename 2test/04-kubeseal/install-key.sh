if [ ! -e data/pub-cert.pem ]; then
  [ -e data/kubeconfig.txt ] || kubectl config view --raw > data/kubeconfig.txt
  kubeseal --kubeconfig data/kubeconfig.txt --fetch-cert --controller-name sealed-secrets --controller-namespace=kube-system > data/pub-cert.pem
  rm -f data/kubeconfig.txt
fi
