# Kubernetes

## Iniciando o minikube [Link](https://istio.io/docs/setup/platform-setup/minikube/)

```bash
minikube start --memory=16384 --cpus=4
```

## Execute o comando abaixo para cada arquivo da aplicação 

```bash
kubectl apply -f {caminho-do-arquivo}
```

### Criando o NameSpace

```bash
kubectl apply -f 1-name-space.yaml
```

### Implantando o banco de dados

```bash
kubectl apply -f 2-mongodb.yaml
```

### Implantando as API`s REST

```bash
kubectl apply -f 3-api.yaml
```

### Implantando a API GraphQL

```bash
kubectl apply -f 4-api-graphql.yaml
```

### Implantando o front-end

#### Lembre de alterar o IP do arquivo 5-front-end.yaml para o IP do seu Cluster

```bash
kubectl apply -f 5-front-end.yaml
```

# Istio

```bash
kubectl apply -f ./istio/secret-kiali.yaml
```

```bash
istioctl manifest apply -f ./istio/config-istio.yaml
```

### Criando o NameSpace

```bash
kubectl apply -f 1-name-space.yaml
```

```bash
kubectl label namespace on-premise istio-injection=enabled
```

```bash
kubectl label namespace on-premise istio-injection=enabled --overwrite
```

```bash
curl -X POST \
  http://192.168.64.82:30090/expense \
  -H 'Content-Type: application/json' \
  -d '{
    "idUser": "5000",
    "companyName": "Arcos Dourados",
    "value": 50.01,
    "details": {
        "cardNumber": "4716650221230609",
        "cnpj": "55.474.589/0001-51",
        "timeStamp": 1578243141,
        "mapLocation": "<seu-cdn>/av-paulista.png"
    }
}'
```

```bash
kubectl port-forward svc/istio-ingressgateway 8080:80 -n istio-system
```

```bash
export INGRESS_PORT=$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.spec.ports[1].nodePort}')
```

```bash
sed -e "s|END_POINT_API_GRAPHQL|http://$(minikube ip):$INGRESS_PORT/graphql|g" 5-front-end.yaml | kubectl apply -f -
```

```bash
open -a "Google Chrome" http://$(minikube ip):$INGRESS_PORT
```

```bash
istioctl dashboard kiali
```

```bash
istioctl dashboard grafana
```

```bash
istioctl dashboard grafana
```

```bash
istioctl dashboard prometheus
```

```bash
kubectl get svc istio-ingressgateway -n istio-system
```

## RequestRouting

```bash
cd ./istio/RequestRouting && sed -e "s|END_POINT_API_GRAPHQL|http://$(minikube ip):$INGRESS_PORT/graphql|g" 1-front-end-dark.yaml | kubectl apply -f -
```

istioctl manifest apply --set values.global.mtls.auto=true --set values.global.mtls.enabled=false



istioctl manifest apply -f ./istio/3-config-istio.yaml --set values.global.disablePolicyChecks=false