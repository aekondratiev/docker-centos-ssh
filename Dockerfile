FROM centos:centos7
MAINTAINER Andry Kondratiev andry.kondratiev@gmail.com

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y iproute python-setuptools hostname inotify-tools yum-utils which jq less openssh-server openssh-clients passwd pwgen vim && \
  yum clean all && \

  easy_install supervisor

# Add supervisord conf, bootstrap.sh files
ADD files /

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

VOLUME ["/data"]

EXPOSE 22

ENTRYPOINT ["/config/bootstrap.sh"]
