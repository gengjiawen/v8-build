FROM ubuntu:20.04

ENV PATH=${PATH}:/root/depot_tools:/root/v8/tools/dev

# for tz config, see https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p ~/.config/fish && echo 'alias gm=~/v8/tools/dev/gm.py' >> ~/.config/fish/config.fish

RUN apt update && apt upgrade -y && apt-get install -qq -y --no-install-recommends \
        ca-certificates \
        gnupg2 \
        python \
        sudo \
        lsb-core \
        vim \
        software-properties-common \
        curl \
        git

RUN apt-add-repository ppa:fish-shell/release-3 && apt update && apt install fish -y

RUN apt-get install -y npm && \
      npm i -g n && \
      n latest

RUN npm i -g yarn

RUN cd ~ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git --depth=1

# snapcraft in docke and https://circleci.com/docs/2.0/high-uid-error/
# you can find it use `find / \! -uid 0 -print`
RUN cd ~ && fetch v8 && cd ~/v8 && gclient sync \
        && sed -i 's/${dev_list} snapcraft/${dev_list}/g' build/install-build-deps.sh && build/install-build-deps.sh && chown -R root:root /root/v8

CMD [ "fish" ]
