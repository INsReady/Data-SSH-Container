# A custom data container with SSHd service
#

FROM ubuntu:latest
MAINTAINER Jingsheng Wang <jingsheng.wang@insready.com>

RUN apt-get update && apt-get install -y openssh-server git nano
RUN mkdir /var/run/sshd
# RUN echo 'root:password' | chpasswd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
ENV TERM xterm

RUN echo "export VISIBLE=now" >> /etc/profile

WORKDIR /var/www/html

# The custom entrypoint is used to link all host read-only files
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
