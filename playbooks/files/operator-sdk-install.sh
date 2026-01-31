#!/usr/bin/env bash
# https://sdk.operatorframework.io/docs/installation/

ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
OS=$(uname | awk '{print tolower($0)}')
OPERATOR_SDK_DL_URL="https://github.com/operator-framework/operator-sdk/releases/download/v1.42.0"
curl -LO "${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}"
gpg --keyserver keyserver.ubuntu.com --recv-keys 052996E2A20B5C7E
curl -LO "${OPERATOR_SDK_DL_URL}/checksums.txt"
curl -LO "${OPERATOR_SDK_DL_URL}/checksums.txt.asc"
gpg -u "Operator SDK (release) <cncf-operator-sdk@cncf.io>" --verify checksums.txt.asc
grep "operator-sdk_${OS}_${ARCH}" checksums.txt | sha256sum -c -
chmod +x "operator-sdk_${OS}_${ARCH}" && mv "operator-sdk_${OS}_${ARCH}" /usr/local/bin/operator-sdk
