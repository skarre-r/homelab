set dotenv-load := true

# list available secret recipes
[group("help")]
default:
    @just --list --justfile secret.just

alias help := default

# create/ update nextcloud secret
nextcloud:
    #!/usr/bin/env bash
    set -euxo pipefail
    just check kubectl
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
