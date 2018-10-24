# Telepresence Wrapper

Telepresence is useful when working with Kubernetes, but it needs an extreme degree of control over local networking to work its magic that's quite inconvenient.

This project is intended to allow running the telepresence CLI from a priveliged container, keeping it more separated from a developer's outer host environment.

## Usage (preliminary)

**NOTE**: this will use your real kubeconfig credentials!

To just run as a proxy to the cluster network:

```
docker-compose build
./telepresence
```

**TODO**: wrapper script to allow passing docker image to use

**TODO**: injection/integration with docker-compose?
