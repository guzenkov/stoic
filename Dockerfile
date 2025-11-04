FROM fedora
ENV packages="nginx nc rsync tcpdump tree wireshark-cli"
#RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
RUN yum install -y $packages; rpm -ql $packages > /files-installed;  yum clean all; chown nginx:0 -Rv /tmp /run /var/log 
USER nginx:0
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off; error_log /dev/stderr notice; pid /tmp/nginx.pid;"]
EXPOSE 8080
