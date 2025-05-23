#!/usr/bin/env bash

# HACK: codename: mikulyze

set -e

#⠀⠀⠀⠀⠀⠀   ⠀⠀⠀⢀⠤⠒⠒⠒⠒⠒⠠⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀  ⠀ ⢀⡞⡽⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢯⢳⡀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀  ⠀⢀⣔⣻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⠢⡀⠀⠀⠀⠀
#⠀⠀  ⢀⣾⣿⣶⡆⠀⠀⢐⡄⠀⠀⠀⠀⠐⠳⡀⠀⢸⣇⣧⡐⠀⠀⠀⠀⠀⠀
#⠀  ⢠⠏⠀⢹⣿⡇⠀⠀⠇⢀⢂⠀⠀⠀⡃⢀⠀⠘⣦⢸⡿⡟⠋⠁⡀⠀⠀⠀
#  ⠀⡋⠀⠀⠀⢹⣷⡀⡸⠀⠻⠀⠈⠒⠤⠃⠿⠀⢀⠻⣼⡇⠀⠀⠀⠀⢂⠀⠀
#  ⢀⠀⠀⠀⠀⠈⣿⠱⣿⣅⠀⠀⠸⣉⡹⠀⠀⢀⠞⡼⠀⣿⡀⠀⠀⠀⠀⠐⠀
#  ⠀⠀⠀⠀⠀⠀⣿⠀⢣⠀⠍⢶⣦⠤⢤⣖⠾⠠⣀⠇⠀⢹⡇⠀⠀⠀⠀⠀⠡
#  ⡁⠀⠀⠀⢀⡴⣏⣴⡑⣀⣴⠂⢸⠤⠼⡀⠱⡤⡨⢳⣦⣸⣷⠀⠀⠀⠀⠀⢡
#  ⠅⠀⠀⣴⡟⢷⣾⣿⡷⠳⠃⢠⠃⠀⠀⢣⣀⠡⡙⣿⣿⣿⠛⣦⡀⠀⠀⠀⢰
#  ⠂⠀⣼⡯⠃⠢⠽⠋⡴⠧⣀⡣⡀⠀⠀⢈⢄⣭⣇⠘⠿⠕⠥⠜⠻⠦⣀⠀⡇
#  ⠀⠉⠁⠀⠀⠀⡊⠉⢙⣿⡾⡶⠾⠶⣾⢕⢿⠟⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠉
#  ⠀⠀⠀⠀⠀⠀⠐⢀⠼⠃⠀⠉⠉⠀⠂⠀⠈⠣⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀
#    blue hair blue tie 
#      hiding in your wifi!
#      ⠀
# host meta.
USB_IFACE=${1:-enp0s20u1}
USB_IFACE_IP=10.0.0.1
USB_IFACE_NET=10.0.0.0/24
# host int. for upstr. conn.
UPSTREAM_IFACE=${2:-mikulyze}

ip addr add "$USB_IFACE_IP/24" dev "$USB_IFACE"
ip link set "$USB_IFACE" up

iptables -A FORWARD -o "$UPSTREAM_IFACE" -i "$USB_IFACE" -s "$USB_IFACE_NET" -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o "$UPSTREAM_IFACE" -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward

# HACK: PROCEED WITH NYX CAUTION.
