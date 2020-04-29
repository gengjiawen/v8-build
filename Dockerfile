FROM ubuntu:19.10

ENV PATH=${PATH}:/root/depot_tools:/root/v8/tools/dev

# for tz config, see https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p ~/.config/fish && echo 'alias gm=~/v8/tools/dev/gm.py' >> ~/.config/fish/config.fish

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
        ca-certificates \
        gnupg2 \
        python \
        gcc-9-arm-linux-gnueabihf \
        sudo \
        lsb-core \
        vim \
        fish \
        curl \
        git

RUN apt-get install -y npm && \
      npm i -g n && \
      npm i -g yarn && \
      n latest

RUN cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1

RUN cd ~ && fetch v8 && cd ~/v8 && gclient sync && build/install-build-deps.sh

CMD [ "fish" ]
