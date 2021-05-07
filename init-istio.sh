kubectl apply -f ./istio/1-name-space.yaml \
&& kubectl apply -f ./istio/2-secret-kiali.yaml \
&& istioctl install \
--set profile=default \
#--set values.pilot.traceSampling=100 \
#--set values.prometheus.enabled=true \
#--set values.grafana.enabled=true \
#--set values.tracing.enabled=true \
#--set values.kiali.enabled=true \
# --set "values.kiali.dashboard.jaegerURL=http://localhost:59193/jaeger/search" \
# --set "values.kiali.dashboard.grafanaURL=http://grafana:3000/"

# --set values.global.controlPlaneSecurityEnabled=true \
# --set values.global.mtls.enabled=true  \
# --set values.sidecarInjectorWebhook.enabled=true
