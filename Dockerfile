FROM alpine:3

RUN apk update && apk add curl bash git openssl jq

RUN export VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/') && \
  curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
RUN chmod +x /usr/local/bin/argocd

RUN export VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && \
  curl -L -o /usr/local/bin/kubectl-${VERSION} "https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-${VERSION}

RUN curl -L -o /usr/local/bin/kubectl-v1.25 "https://dl.k8s.io/release/v1.25.6/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-v1.25 && \
  ln -s /usr/local/bin/kubectl-v1.25 /usr/local/bin/kubectl

RUN curl -L -o /usr/local/bin/kubectl-v1.24 "https://dl.k8s.io/release/v1.24.10/bin/linux/amd64/kubectl" && \
  chmod +x /usr/local/bin/kubectl-v1.24

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh \
  ./get_helm.sh

RUN rm -vrf /var/cache/apk/*

CMD ["/bin/bash"]
