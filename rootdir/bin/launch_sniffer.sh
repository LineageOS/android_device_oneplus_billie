#!/vendor/bin/sh
# launch_sniffer.sh

iface=$1
channel=$2
bandwidth=$3

if [[ $(lsmod | grep "^wlan") == "" ]]
then
    insmod /vendor/lib/modules/qca_cld3_qca6390.ko
    if [[ $? != 0 ]]
    then
        insmod /vendor/lib/modules/qca_cld3_wlan.ko
    fi
    sleep 1
fi

ifconfig $iface down && echo 4 > /sys/module/wlan/parameters/con_mode && ifconfig $iface up

case $bandwidth in
"160")
    bandwidth=3
    ;;
"80")
    bandwidth=2
    ;;
"40")
    bandwidth=1
    ;;
"20")
    bandwidth=0
    ;;
*)
    bandwidth=0
    ;;
esac

for i in `seq 1 10`
do
    if [[ $(ifconfig | grep "^wlan0") == "" ]]
    then
        sleep 1
    else
        iwpriv $iface setMonChan $channel $bandwidth
        break
    fi
done
