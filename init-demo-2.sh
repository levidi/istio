kubectl apply -f 4-api.yaml \
&& kubectl apply -f 5-api-graphql.yaml \
&& kubectl apply -f 6-front-end.yaml \
&& kubectl apply -f ./istio/Gateway/1-gateway.yaml \
&& kubectl apply -f ./istio/Gateway/2-virtual-service-graphql.yaml \
&& kubectl apply -f ./istio/Gateway/3-virtual-service-web-app.yaml \

