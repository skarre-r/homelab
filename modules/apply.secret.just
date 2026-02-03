[private]
default:
    @just --list --justfile apply.secret.just

alias help := default
alias list := default

[no-cd]
nextcloud:
    #!/usr/bin/env bash
    set -euxo pipefail

    just check kubectl

    namespace_exists=$(kubectl get namespace "nextcloud" >/dev/null 2>&1 && echo 1 || echo 0)
    if [[ $namespace_exists == 0 ]]; then
        kubectl create namespace "nextcloud"
    fi

    cat << EOF | kubectl apply --namespace "nextcloud" -f -
    apiVersion: "v1"
    kind: "Secret"
    metadata:
      name: "nextcloud"
      namespace: "nextcloud"
    type: "Opaque"
    stringData:
      username: ${NEXTCLOUD_USERNAME}
      password: ${NEXTCLOUD_PASSWORD}
      token: ${NEXTCLOUD_TOKEN}
      smtp-username: ${NEXTCLOUD_SMTP_USERNAME}
      smtp-password: ${NEXTCLOUD_SMTP_PASSWORD}
      smtp-host: ${NEXTCLOUD_SMTP_HOST}
    EOF
