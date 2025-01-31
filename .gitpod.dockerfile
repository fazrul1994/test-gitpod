FROM ubuntu:20.04
USER root
# Install few essential stuffs for gitpod
RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install --no-install-recommends -y clangd-9 tmate rclone nano sudo
# Cleanup a bit the env
RUN apt-get clean \
    && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /usr/share/dotnet /etc/mysql /etc/php /etc/apt/sources.list.d /tmp/*
# Sudo hax "read README.md for info"
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers \
    && chmod 0440 /etc/sudoers
USER root
