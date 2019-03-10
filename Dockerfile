FROM ubuntu

ENV PATH=${PATH}:/root/depot_tools
RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
        ca-certificates \
        gnupg2 \
        python \
        sudo \
        lsb-core \
        vim \
        curl \
        git

RUN cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

RUN cd ~ && fetch v8 && cd ~/v8 && gclient sync
