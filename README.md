# dhcp_docker
Mit dem Dockerfile soll ein DHCP Server erstellt werden mit allen konfigurationen
# eliabruno1
<h1>ISC DHCP Server Container konfigurieren</h1>

<h2>1 Projektbeschreib</h2>

Während dem Projekt ensteht ein Dockerfile, welches welches einen Container erstellt. Dieser soll einen DHCP-Server simulieren. Das File bezieht die Konfigurationen von einem separaten Konfig-File. Da ich noch keine Erfahrung mit Docker habe, wird es sicher ein spannendes und lehrreiches Projekt.

<h2>2 Planung</h2>

<h3>2.1 DHCP Server</h3>

Der DHCP Server hat die statische IP 192.168.1.2. Er erhält ebenfalls den Namen dhcp01. Die Konfigurationen des DHCP sind für ein bereits existentes Netzwerk mit DNS und Routern gedacht. Ebenfalls wurden zwei Bereiche für zwei Subnetze konfiguriert.

<h3>2.2 Adress-Lease</h3>

Die Clients dürfen eine IP maximal 7 Tag haben.

<h3>2.3 IP Adressen-Range</h3>

Auf dem DHCP Server werden wie erwähnt zwei Bereiche eingerichtet. Einer für das Subnetz 192.168.1.0/24 und einer für das Sbuntez 192.168.3.0/21

<h3>2.4 Reservationen</h3>

Es werden zwei IP reserviert:

Primary DNS-Server: 192.168.1.3
GW Subnetz 1: 192.168.1.1
GW Subnetz 2: 192.168.1.2

<h2>3 Realisation</h2>

<h3>3.1 DHCP</h3>

<h4>3.1.1 Konfiguration</h4>

Mit dem Konfigurationsfile "dhcpd.conf" konnten alle gewünschten Features eingefügt werden. Ich werde hier die einzelnen Punkte erklären:

Mit diesem Teil wird definiert, wie lange der Lease andauert. Hier sind es 7 Tage.  

update-static-leases on;    
default-lease-time 604800;   
max-lease-time 604800;  


Hier werden die einzelnen Bereiche konfiguriert. Es werden Parameter für die Subnetze 192.168.1.0/24 und 192.168.2.0/21 gesetzt.

subnet 192.168.1.0 netmask 255.255.255.0 {  
    range 192.168.1.10 192.168.1.100;
    option subnet-mask 255.255.255.0;
    option domain-name-servers 192.168.1.1;
	option routers 192.168.1.1;
{
subnet 192.168.2.0 netmask 255.255.248.0 {
        range 192.168.4.10 192.168.4.40;
        option subnet-mask 255.255.248.0;
        option domain-name-servers 192.168.1.2;
        option routers 192.168.2.1;
 {

Hier werden die IPs für den DNS und die zwei Routerschnittstellen der Subnetze gesetzt.        


host Accountant{

Reservation Routerschnittstelle für Subnetz 192.168.1.0/24
hardware ethernet xx:xx:xx:xx:xx:xx;
fixed-address 192.168.1.1;

Reservation Routerschnittstelle für Subnetz 192.168.2.0/21
hardware ethernet xx:xx:xx:xx:xx:xx;
fixed-address 192.168.4.1;

Reservation für den DNS
hardware ethernet xx:xx:xx:xx:xx:xx;
fixed-address 192.168.1.3;
}



<h2>4 Fazit</h2>

Da ich wenig Zeit für das Projekt hatte, wurde das Dockerfile dementsprechend nicht sehr Umfangreich. Trotzdem konnte ich viel lernen, da ich direkt mit Docker arbeitete und das Programm installierte. Zu Beginn hatte ich mühe, da ich nicht wusste wie alle funktionierte. Mit der Hilf von Foren und der Herstellerseite, gelang es mir, das Dockerfile zu vollenden.