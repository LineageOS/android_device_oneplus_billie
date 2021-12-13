#!/vendor/bin/sh
# startcontention.sh


iwpriv wlan0 setUnitTestCmd 4 2 11 $1
iwpriv wlan0 setUnitTestCmd 4 2 12 $1

