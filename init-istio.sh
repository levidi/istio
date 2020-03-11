kubectl apply -f ./istio/1-name-space.yaml \
&& kubectl apply -f ./istio/2-secret-kiali.yaml \
&& istioctl manifest apply -f ./istio/3-config-istio.yaml