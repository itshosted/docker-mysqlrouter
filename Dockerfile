FROM centos:7

ENV BIND_ADDRESS     "0.0.0.0"
ENV BIND_PORT        "3306"
ENV ROUTING_STRATEGY "first-available"
ENV DESTINATIONS     ""

RUN yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
RUN yum install mysql-router-community -y

EXPOSE 3306

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD []
