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