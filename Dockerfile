FROM ubuntu:18.04
#ARG REPO_BIN=/usr/local/bin

RUN apt-get -qq update
RUN apt-get -qq install sudo rsync python git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
# RUN apt-get -qq install python3 rsync # Required dependencies that are not listed on android.com
# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10 # Set python3 as default
# RUN touch /etc/mtab # Fix resize2fs mtab failure which expects /etc/mtab to be present

#RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ${REPO_BIN}/repo && chmod +x ${REPO_BIN}/repo
# 清理
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 添加用户
RUN useradd --create-home --no-log-init --shell /bin/bash developer \
&& adduser developer sudo \
&& echo 'developer:123456' | chpasswd


USER developer
ENV HOME /home/developer
WORKDIR /home/developer
ENV PATH="${JDK_PATH}/bin:${PATH}"

CMD ["/bin/bash"]
