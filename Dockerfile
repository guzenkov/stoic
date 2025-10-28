FROM ubi10
ENV packages="nginx tcpdump nc wireshark-cli rsync"
RUN microdnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
RUN yum install -y $packages; rpm -ql $packages > /files-installed; yum clean all
