FROM centos:stream10 as base
ENV packages="install nginx tcpdump nc wireshark-cli rsync"
RUN yum -y $packages; rpm -ql $packages > /files-installed; yum clean all
