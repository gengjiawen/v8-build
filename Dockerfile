FROM ubuntu

ENV PATH=${PATH}:/root/depot_tools
RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
        ca-certificates \
        python \
        curl \
        git

RUN cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

# install nodejs and yarn packages from nodesource and yarn apt sources
RUN echo "deb https://deb.nodesource.com/node_10.x stretch main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && apt-get update -qq \
    && apt-get install -qq -y --no-install-recommends nodejs yarn \
    && rm -rf /var/lib/apt/lists/*
