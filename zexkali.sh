# Bu dosya zaten kali.sh içinde tanımlı

# ZexKali Distro dosyasının içeriği
DISTRO_NAME="ZexKali"
DISTRO_COMMENT="ZexKali Rootless Custom Kali Linux"

TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-full.tar.xz"
TARBALL_SHA256['aarch64']="SKIP"

TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-full.tar.xz"
TARBALL_SHA256['arm']="SKIP"

DISTRO_ARCH="aarch64"

DISTRO_ENTER="env -i HOME=/root TERM=$TERM LANG=$LANG PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /bin/bash --login"

# chmod +x
chmod +x kali.sh
chmod +x nethunter-fix.sh
chmod +x ~/.proot-distro/distro/zexkali.sh