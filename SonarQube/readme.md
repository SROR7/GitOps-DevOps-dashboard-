## Add the chart repo

```sh 
kubectl create namespace sonarqube
helm upgrade --install sonarqube sonarqube/sonarqube \
  -n sonarqube \
  --create-namespace \
  -f values.yaml
```

## Install the chart

```sh 
helm install sonarqube sonarqube/sonarqube -n sonarqube -f values.yaml
kubectl -n sonarqube get pods -w
```

## LogIn 

```sh 
kubectl -n sonarqube port-forward svc/sonarqube-sonarqube 9000:9000
```