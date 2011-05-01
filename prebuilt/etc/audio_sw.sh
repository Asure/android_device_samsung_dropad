#!/system/busybox/bin/sh
#bdwgprefix := /system/busybox/bin/

kserver(){
  pkill mediaserver
}

fname="/system/etc/asound.conf"

#echo "$1"
case "$1" in
  "hdmi")
    echo "using hdmi"
#    sed -i -e 's/\(card\).*$/\1 1/g' -e 's/\(device\).*$/\1 1/g' "$fname"
    cat /system/etc/asound1.conf > /system/etc/asound.conf
    sync
#    sleep 1
    setprop au.switch 1
    $(kserver)
  ;;
  "i2s")
    echo "using i2s"
#    sed -i -e 's/\(card\).*$/\1 0/g' -e 's/\(device\).*$/\1 0/g' "$fname"
    cat /system/etc/asound0.conf > /system/etc/asound.conf
    setprop au.switch 0
    sync
#    sleep 1
    $(kserver)
  ;;
  *)
    echo "Unknown parameters $1"
  ;;
esac
