FROM alpine:3.12


RUN apk add --no-cache \
      bash \
      bc \
      coreutils \
      curl \
      gawk \
      gettext \
      git \
      grep \
      jq \
      mysql-client \
      openssh-client \
      openssl \
      postgresql \
      sed \
      wget;

# yq 4.0.0 is NOT backward compatible with yq 3.x.x. Therefore we target yq version 3.4.1 (LTS) to maintain backward compatibility.
ARG YQ_VERSION=3.4.1

# yq apk package as been added to 'alpine:edge' and will be available in 'alpine:3.13'
# manual installation pending release of alpine:3.13
RUN curl -k -L -o /usr/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" && \
    chmod +x /usr/bin/yq && \
    # Add 'yaml' symlink for backward compatibility
    ln -s /usr/bin/yq usr/bin/yaml;
