exec >/tmp/recovery_zram.log 2>&1

echo "comp_algorithm=$(cat /sys/block/zram0/comp_algorithm)"
echo "disksize=$(cat /sys/block/zram0/disksize)"

if [ "$(cat /sys/block/zram0/disksize)" = "0" ]; then
    # FloppyKernel hardcodes the value per-RAM size,
    # but something still needs to be set beforehand.
    echo 4294967296 > /sys/block/zram0/disksize
    echo "disksize=$(cat /sys/block/zram0/disksize)"
fi

/system/bin/mkswap /dev/block/zram0
/system/bin/swapon /dev/block/zram0
