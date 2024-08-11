# sulfoxide-boron

![Version: 1.11.1](https://img.shields.io/badge/Version-1.11.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2024.8.2](https://img.shields.io/badge/AppVersion-2024.8.2-informational?style=flat-square)

Helm chart to deploy internal ingress controller with VPN access to internal services using cloudflared

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | affinity |
| auth | object | `{"external":{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"OPAL_RUBY_INGRESS_TOKEN","secretStore":{"kind":"SecretStore","name":"boron"}},"internal":{"enable":false,"token":""},"secretName":"cloudflare-tunnel-token"}` | Cloudflare Tunnel Token |
| auth.external | object | `{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"refreshInterval":"1h","remoteSecretName":"OPAL_RUBY_INGRESS_TOKEN","secretStore":{"kind":"SecretStore","name":"boron"}}` | Use external secret |
| auth.external.enable | bool | `true` | Enable the use of external secret |
| auth.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | Secret policy |
| auth.external.policy.creation | string | `"Owner"` | Creation policy |
| auth.external.policy.deletion | string | `"Retain"` | Deletion policy |
| auth.external.refreshInterval | string | `"1h"` | Refresh Rate |
| auth.external.remoteSecretName | string | `"OPAL_RUBY_INGRESS_TOKEN"` | Remote Secret Reference name |
| auth.external.secretStore.kind | string | `"SecretStore"` | Kind of the Secret Store: `ClusterSecretStore` or `SecretStore` |
| auth.external.secretStore.name | string | `"boron"` | Name of the Secret Store |
| auth.internal | object | `{"enable":false,"token":""}` | Secret directly inlined in value files |
| auth.internal.enable | bool | `false` | Use hard coded secret |
| auth.internal.token | string | `""` | Hard coded Cloudflare token |
| auth.secretName | string | `"cloudflare-tunnel-token"` | Secret Name that stores the Token with key TUNNEL_TOKEN |
| autoscaling | object | `{"enabled":true,"maxReplicas":3,"minReplicas":1,"targetCPUUtilizationPercentage":80,"targetMemoryUtilizationPercentage":80}` | Auto-scaling |
| autoscaling.enabled | bool | `true` | Enable or disable auto-scaling |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU Utilization |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Target Memory Utilization |
| config.clusterIpVersion | int | `4` | target kubernetes cluster IP family. 4 or 6 |
| config.metricPort | int | `2000` | Ports which cloudflared listen to metrics on |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"cloudflare/cloudflared"}` | Image configurations |
| imagePullSecrets | list | `[]` | Image pull secrets |
| nameOverride | string | `""` | Override name ( will change only the chart name) |
| nodeSelector | object | `{}` | node selectors |
| podAnnotations | object | `{}` | Additional Annotations to add to pods |
| podSecurityContext | object | `{}` | Security Context for Pods |
| replicaCount | int | `1` | Number of Replicas, only if HPA is not enabled |
| resources | object | `{"limits":{"cpu":"50m","memory":"256Mi"},"requests":{"cpu":"15m","memory":"128Mi"}}` | resource limits |
| secretAnnotation | object | `{"argocd.argoproj.io/sync-wave":"-2"}` | Secret Annotations (External Secrets) to control synchronization |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":10000}` | Generate security Context |
| serviceTree | object | `{"layer":"1","module":"tunnel","platform":"sulfoxide","service":"boron"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"annotations":{"argocd.argoproj.io/sync-wave":"-3"},"rootSecret":{"name":"boron","ref":{"clientId":"SULFOXIDE_BORON_CLIENT_ID","clientSecret":"SULFOXIDE_BORON_CLIENT_SECRET"}},"serviceTree":{"platform":"sulfoxide","service":"boron"},"storeName":"boron"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"name":"boron","ref":{"clientId":"SULFOXIDE_BORON_CLIENT_ID","clientSecret":"SULFOXIDE_BORON_CLIENT_SECRET"}}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | object | `{"clientId":"SULFOXIDE_BORON_CLIENT_ID","clientSecret":"SULFOXIDE_BORON_CLIENT_SECRET"}` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"boron"` | Store name to create |
| tolerations | list | `[]` | toleration |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
