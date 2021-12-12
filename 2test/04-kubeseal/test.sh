# Create a json/yaml-encoded Secret somehow:
# (note use of `--dry-run` - this is just a local file!)
echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o yaml >tmp/mysecret.yaml

# This is the important bit:
# (note default format is json!)
###kubeseal --kubeconfig data/kubeconfig.txt --controller-name sealed-secrets --controller-namespace=kube-system <tmp/mysecret.json >tmp/mysealedsecret.json
##kubeseal <mysecret.json >mysealedsecret.json
kubeseal --cert data/pub-cert.pem -n default -o yaml <tmp/mysecret.yaml >tmp/mysealedsecret.yaml


# mysealedsecret.json is safe to upload to github, post to twitter,
# etc.  Eventually:
##kubectl create -f tmp/mysealedsecret.json

# Profit!
##kubectl get secret mysecret
