## Create the namespace

```sh 
kubectl create ns argocd 
```

## Install ArgoCD in the cluster 

```sh 
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml