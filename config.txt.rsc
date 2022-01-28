

Mikrotik Hotspot Router Configuration 


# jan/28/2022 16:38:38 by RouterOS 6.49.1
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=uwe.uk hotspot-address=10.5.50.1 login-by=http-chap,http-pap \
    name=hsprof1 use-radius=yes
/ip pool
add name=hs-pool-2 ranges=10.5.50.2-10.5.50.254
/ip dhcp-server
add address-pool=hs-pool-2 disabled=no interface=ether2 lease-time=1h name=\
    dhcp1
/ip hotspot
add address-pool=hs-pool-2 addresses-per-mac=200 disabled=no interface=ether2 \
    name=hotspot1 profile=hsprof1
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/ip address
add address=10.5.50.1/24 comment="hotspot network" interface=ether2 network=\
    10.5.50.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=10.5.50.0/24 comment="hotspot network" gateway=10.5.50.1
/ip dns
set servers=8.8.8.8
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.5.50.0/24
/ip hotspot user
add name=admin password=admin server=hotspot1
/radius
add address=192.168.0.53 secret=1234 service=hotspot
/tool user-manager database
set db-path=user-manager



AAA Server Configuration


# jan/28/2022 16:42:51 by RouterOS 6.49.1
# software id = 
#
#
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/tool user-manager profile
add name=5GB name-for-users=admin override-shared-users=1 owner=admin price=\
    10 starts-at=logon validity=30s
add name=512MB name-for-users="" override-shared-users=1 owner=admin price=5 \
    starts-at=logon validity=2w
add name=1G name-for-users="" override-shared-users=1 owner=admin price=10 \
    starts-at=logon validity=4w2d
/tool user-manager profile limitation
add address-list="" download-limit=0B group-name="" ip-pool="" ip-pool6="" \
    name=512MB-PCKG owner=admin rate-limit-min-rx=262144B rate-limit-min-tx=\
    262144B rate-limit-rx=524288B rate-limit-tx=524288B transfer-limit=\
    536870912B upload-limit=0B uptime-limit=0s
add address-list="" download-limit=0B group-name="" ip-pool=hs-pool-2 \
    ip-pool6="" name=1G-PCKG owner=admin rate-limit-min-rx=1048576B \
    rate-limit-min-tx=524288B rate-limit-rx=1048576B rate-limit-tx=524288B \
    transfer-limit=1073741824B upload-limit=0B uptime-limit=0s
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip dhcp-client
add !dhcp-options disabled=no interface=ether1
/ip firewall nat
add action=accept chain=srcnat
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/tool user-manager database
set db-path=user-manager
/tool user-manager profile profile-limitation
add from-time=0s limitation=512MB-PCKG profile=512MB till-time=23h59m59s \
    weekdays=sunday,monday,tuesday,wednesday,thursday,friday,saturday
add from-time=0s limitation=1G-PCKG profile=1G till-time=23h59m59s weekdays=\
    sunday,monday,tuesday,wednesday,thursday,friday,saturday
/tool user-manager router
add coa-port=1700 customer=admin disabled=no ip-address=192.168.0.52 log=\
    auth-ok,auth-fail,acct-ok,acct-fail name=NAS shared-secret=1234 use-coa=\
    yes
/tool user-manager user
add customer=admin disabled=no ipv6-dns=:: password=shah shared-users=1 \
    username=khan wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=cakns shared-users=1 \
    username=ea3vs wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=mq8sn shared-users=1 \
    username=8m2aw wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=74xgb shared-users=1 \
    username=6jsdc wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=qi5ma shared-users=1 \
    username=gyp6h wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=mu8j8 shared-users=1 \
    username=6bpsi wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=cg5wt shared-users=1 \
    username=b8uj8 wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=ke4v9 shared-users=1 \
    username=kbc27 wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=xjihc shared-users=1 \
    username=dduu5 wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=7rxq6 shared-users=1 \
    username=jh7ep wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=wt2qx shared-users=1 \
    username=w6jt5 wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=uvqvd shared-users=1 \
    username=pgafi wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=txbju shared-users=1 \
    username=gnjem wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=upt62 shared-users=1 \
    username=j29u3 wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=77fjw shared-users=1 \
    username=jhefp wireless-enc-algo=none wireless-enc-key="" wireless-psk=""
add customer=admin disabled=no ipv6-dns=:: password=sr8qf shared-users=1 \
    username=6i44z wireless-enc-algo=none wireless-enc-key="" wireless-psk=""






Current configuration : 749 bytes
!
! Last configuration change at 18:44:57 EET Fri Jan 28 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Switch
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
clock timezone EET 2 0
no ipv6 cef
ipv6 multicast rpf use-bgp
!
ip cef
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
vlan internal allocation policy ascending
!
!
!
!
!
!
!
!
!
!
interface Ethernet0/0
 duplex auto
!
interface Ethernet0/1
 duplex auto
!
interface Ethernet0/2
 duplex auto
!
interface Ethernet0/3
 duplex auto
!
!
no ip http server
!
!
!
!
!
control-plane
!
!
line con 0
 logging synchronous
line aux 0
line vty 0 4
!
end



Current configuration : 897 bytes
!
! Last configuration change at 18:46:36 EET Fri Jan 28 2022
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Switch
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
clock timezone EET 2 0
no ipv6 cef
ipv6 multicast rpf use-bgp
!
ip cef
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
vlan internal allocation policy ascending
!
!
!
!
!
!
!
!
!
!
interface Ethernet0/0
 duplex auto
!
interface Ethernet0/1
 duplex auto
!
interface Ethernet0/2
 duplex auto
!
interface Ethernet0/3
 duplex auto
!
interface Ethernet1/0
 duplex auto
!
interface Ethernet1/1
 duplex auto
!
interface Ethernet1/2
 duplex auto
!
interface Ethernet1/3
 duplex auto
!
!
no ip http server
!
!
!
!
!
control-plane
!
!
line con 0
 logging synchronous
line aux 0
line vty 0 4
!
end

