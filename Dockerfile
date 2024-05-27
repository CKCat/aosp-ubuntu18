FROM ubuntu:18.04

# 配置编译环境
RUN apt-get -qq update \
	&& apt-get -qq install sudo git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip openjdk-8-jdk\
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& useradd --create-home --no-log-init --shell /bin/bash local \
	&& echo 'local:toor' | chpasswd \
	&& adduser local sudo

# 切换到新用户并设置环境变量和工作目录
USER local
ENV HOME=/home/local
WORKDIR /home/local

# 设置默认的 shell
CMD ["/bin/bash"]
