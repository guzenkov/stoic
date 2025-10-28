FROM nginx
ENV NGINX_PORT=8080
ENV packages="nginx nc rsync"
#RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
#RUN yum install -y $packages; rpm -ql $packages > /files-installed;  yum clean all
RUN apt-get update; apt-get install nc rsync lsof 
RUN sed -i 's/listen\s\+ 80;/listen       8080;/' /etc/nginx/nginx.conf
RUN sed -i 's/:80:/:8080:/' /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
