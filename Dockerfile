FROM ubuntu:trusty
MAINTAINER Thishan D Pathmanathan <thishandp7@gmail.com>

#prevent dpkg errors
ENV TERM=xterm-256color

#Set mirros to the closest location

#Install Ansible
RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible


COPY ansible /ansible

#Add volumes for ansible playbooks
VOLUME /ansible
WORKDIR /ansible

ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
