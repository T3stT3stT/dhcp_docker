FROM ubuntu:14.04

MAINTAINER elia bruno

WORKDIR /etc/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get upgrade -y \
	&& apt-get install -y bind9 isc-dhcp-server

	
EXPOSE 67

ENTRYPOINT [ \
  "dhcpd", \
 "-cf", "/conf/dhcp/dhcpd.conf", \
 "--no-pid", "-4", "-f", "eth0" \]
