## Add Promethues Repo 

```sh 
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

## Install the stack 

```sh 
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  -f values.yaml
```