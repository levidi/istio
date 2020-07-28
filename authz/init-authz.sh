kubectl apply -f 1-namespace.yaml \
&& kubectl apply -f 2-policy-manager.yaml \
&& kubectl apply -f 3-admission-controller.yaml \
&& kubectl apply -f 4-mutating-webhook-configuration.yaml \
&& kubectl apply -f 5-envoy-filter.yaml \

