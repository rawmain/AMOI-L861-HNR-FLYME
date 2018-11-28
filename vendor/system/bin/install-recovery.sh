#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12902400 3eff8f33cf1b118ca7cbd89d50073c986efa5167 8003584 365768e7efa18c4eb9ac710dba562c40743c5af7
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:12902400:3eff8f33cf1b118ca7cbd89d50073c986efa5167; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:8003584:365768e7efa18c4eb9ac710dba562c40743c5af7 EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery 3eff8f33cf1b118ca7cbd89d50073c986efa5167 12902400 365768e7efa18c4eb9ac710dba562c40743c5af7:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
