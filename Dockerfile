FROM debian:stretch

MAINTAINER WilliamGuo <shaowei3608@gmail.com>

# Install pygments (for syntax highlighting)
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends libstdc++6 python-pygments git ca-certificates asciidoc curl \
	&& rm -rf /var/lib/apt/lists/*

# Configuration variables
ARG HUGO_VERSION
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/src'

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir ${SITE_DIR}

WORKDIR ${SITE_DIR}

# Expose default hugo port
EXPOSE 1313
