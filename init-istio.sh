kubectl apply -f ./istio/1-name-space.yaml \
&& kubectl apply -f ./istio/2-secret-kiali.yaml \
&& istioctl manifest apply \
--set profile=default \
--set values.pilot.traceSampling=100 \
--set values.grafana.enabled=true \
--set values.kiali.enabled=true \
--set values.tracing.enabled=true \