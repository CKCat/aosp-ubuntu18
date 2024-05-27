FROM ubuntu:18.04

# 配置编译环境
RUN apt-get -qq update \
	&& apt-get -qq install sudo rsync python git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 添加用户
RUN useradd --create-home --no-log-init --shell /bin/bash local \
	&& adduser local sudo \
	&& echo 'local:toor' | chpasswd


# 切换用户
USER local

# 设置环境变量和工作目录
ENV PATH="${JDK_PATH}/bin:${PATH}" HOME=/home/local
WORKDIR /home/local

# 设置默认的 shell
CMD ["/bin/bash"]
