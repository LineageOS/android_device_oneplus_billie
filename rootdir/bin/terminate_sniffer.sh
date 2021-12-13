#!/vendor/bin/sh
# terminate_sniffer.sh

iface=$(getprop vendor.wlan.sniffer.iface)

setprop vendor.wlan.sniffer.status 0
ifconfig $iface down
sleep 3
echo 0 > /sys/module/wlan/parameters/con_mode
ifconfig $iface up
