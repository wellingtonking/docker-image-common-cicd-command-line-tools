FROM alpine:3

RUN apk update && apk add curl bash git openssl jq

## Install ArgoCD (latest stable) ##
RUN export VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/') && \
  curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
RUN chmod +x /usr/local/bin/argocd

## Install kubectl latest stable ##
RUN export VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && \
  curl -L -o /usr/local/bin/kubectl-${VERSION} "https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-${VERSION}

## Install kubectl 1.25 (1.25.6) ##
RUN curl -L -o /usr/local/bin/kubectl-v1.25 "https://dl.k8s.io/release/v1.25.6/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-v1.25 && \
  ln -s /usr/local/bin/kubectl-v1.25 /usr/local/bin/kubectl

## Install kubectl 1.24 (1.24.10) ##
RUN curl -L -o /usr/local/bin/kubectl-v1.24 "https://dl.k8s.io/release/v1.24.10/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-v1.24

## Install helm 3 CLI (latest stable) ##
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh

## Install semver 2 (2.0.2) ##
RUN cd /tmp && curl -LO https://github.com/ffurrer2/semver/releases/download/v2.0.2/semver_linux_amd64.tar.gz && \
  tar -xzvf semver_linux_amd64.tar.gz && \
  mv semver /usr/local/bin/

RUN rm -vrf /var/cache/apk/*

CMD ["/bin/bash"]
