# docker-image-full-cli-kit
Docker files for the Docker image full-cli-kit.

# What's Included?

This image includes the following command line tools:

* The `argocd` cli for the latest version of ArgoCD
* The `kubectl` cli for the three latest minor versions of Kubernetes
* The `helm` cli for the latest version of Helm

# TODO

1. Authentication for these four tools is not documented and would be very helpful.

# References

* The kubectl cli releases: https://github.com/kubernetes/kubernetes/releases
* The kubectl cli installation info: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
* The argocd cli info: https://argo-cd.readthedocs.io/en/stable/getting_started/
* The argocd cli installation info: https://argo-cd.readthedocs.io/en/stable/cli_installation/

# Alternatives

* https://hub.docker.com/r/argoproj/argocd-cli/tags (docker pull argoproj/argocd-cli:v0.10.6)
