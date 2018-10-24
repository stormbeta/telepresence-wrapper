FROM ubuntu:18.04

# NOTE: telepresence will crash if sudo is removed, even if already running as root!
RUN apt update && \
      apt upgrade && \
      apt install -y curl python3 bash iptables docker.io sudo && \
      apt clean

# kubectl is a pain to install on linux
# TODO: Find a better way to install this reliably, or find a kubectl base image
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/bin/

# TODO: It's 2018, surely there's a better way than sketchy curl-bash...
RUN curl -s https://packagecloud.io/install/repositories/datawireio/telepresence/script.deb.sh > script.deb.sh && \
      bash script.deb.sh && \
      apt install -y --no-install-recommends telepresence && \
      rm script.deb.sh

COPY scripts/99-kubeconfig-merge.sh /etc/profile.d/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
