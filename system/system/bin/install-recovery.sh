#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29118480:4e43c6dbd018ece8463ec080979ac5e7167d98a7; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:20002832:5a9322be3321c67aed254e7c4d7987348fbe76f1 \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29118480:4e43c6dbd018ece8463ec080979ac5e7167d98a7 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
