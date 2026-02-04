Reusable postgres manifests.

Use `just apply secret postgres` to update the secret; database, username, and password. The container won't start
without it.

Usage:

```yaml
---
apiVersion: "kustomize.config.k8s.io/v1beta1"
kind: "Kustomization"
resources:
  - "../../../base/postgres"
namespace: "<NAMESPACE>"
patches:
  - target:
      kind: "PersistentVolume"
      labelSelector: "type=postgres"
    patch: |-
      - op: "replace"
        path: "/metadata/name"
        value: "<NAMESPACE>-postgres"
      - op: "replace"
        path: "/spec/hostPath/path"
        value: "/pool/services/<NAMESPACE>-postgres"
  - target:
      kind: "PersistentVolumeClaim"
      name: "postgres"
    patch: |-
      - op: "replace"
        path: "/spec/volumeName"
        value: "<NAMESPACE>-postgres"
```
