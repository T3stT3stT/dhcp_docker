FROM ubuntu:14.04

MAINTAINER elia bruno

WORKDIR /etc/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get upgrade -y \
	&& apt-get install -y bind9 isc-dhcp-server

	
RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

ADD	conf/dhcp /etc/dhcp/

VOLUME ["/etc/dhcp"]

ENTRYPOINT ["/bin/bash"]

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]]
