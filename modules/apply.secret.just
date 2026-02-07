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

[no-cd]
postgres:
    #!/usr/bin/env bash
    set -euo pipefail

    read -p "database: " database
    if [[ -z "${database}" ]]; then
        echo "error: database is undefined"
        exit 1
    fi

    read -p "username: " username
    if [[ -z "${username}" ]]; then
        echo "error: username is undefined"
        exit 1
    fi

    read -p "password: " password
    if [[ -z "${password}" ]]; then
        echo "error: password is undefined"
        exit 1
    fi

    namespace_exists=$(kubectl get namespace "postgres-system" >/dev/null 2>&1 && echo 1 || echo 0)
    if [[ $namespace_exists == 0 ]]; then
        kubectl create namespace "postgres-system"
    fi

    cat << EOF | kubectl apply --namespace "postgres-system" -f -
    apiVersion: "v1"
    kind: "Secret"
    metadata:
      name: "postgres"
      namespace: "postgres-system"
    type: "Opaque"
    stringData:
      host: "postgres.postgres-system.svc.cluster.local:5432"
      database: "${database}"
      username: "${username}"
      password: "${password}"
    EOF
