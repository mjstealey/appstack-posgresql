FROM centos:centos6.6

MAINTAINER Michael Stealey <michael.j.stealey@gmail.com>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r postgres && useradd -r -g postgres postgres

ENV container docker
ENV TERM xterm

RUN rpm -ivh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm && \
	yum install -y postgresql93 postgresql93-server postgresql93-odbc unixODBC && \
	yum clean all

EXPOSE 5432

#ENTRYPOINT ["/usr/pgsql-9.3/bin/postgres"]
#CMD ["-D", "/var/lib/pgsql/9.3/data"]

# Keep container from shutting down until explicitly stopped
ENTRYPOINT ["/usr/bin/tail"]
CMD ["-f", "/dev/null"]