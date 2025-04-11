#!/data/data/com.termux/files/usr/bin/bash

# Renkler
red='\033[1;31m'; green='\033[1;32m'; yellow='\033[1;33m'; blue='\033[1;34m'; cyan='\033[1;36m'; reset='\033[0m'

# ZexKali distro dosyasını oluştur
mkdir -p ~/.proot-distro/distro
cat > ~/.proot-distro/distro/zexkali.sh << 'EOF'
DISTRO_NAME="ZexKali"
DISTRO_COMMENT="ZexKali Rootless Custom Kali Linux"

TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-full.tar.xz"
TARBALL_SHA256['aarch64']="SKIP"

TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-full.tar.xz"
TARBALL_SHA256['arm']="SKIP"

DISTRO_ARCH="aarch64"

DISTRO_ENTER="env -i HOME=/root TERM=$TERM LANG=$LANG PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /bin/bash --login"
EOF

# Banner
clear
echo -e "${cyan}"
echo "███████╗███████╗██╗  ██╗██╗  ██╗██╗     ██╗"
echo "██╔════╝██╔════╝╚██╗██╔╝██║ ██╔╝██║     ██║"
echo "█████╗  █████╗   ╚███╔╝ █████╔╝ ██║     ██║"
echo "██╔══╝  ██╔══╝   ██╔██╗ ██╔═██╗ ██║     ██║"
echo "███████╗███████╗██╔╝ ██╗██║  ██╗███████╗███████╗"
echo "╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝"
echo -e "${yellow}              ZexKali Terminal Installer"
echo -e "${reset}"

# Menü
echo -e "${green}[1]${reset} Full ZexKali ${blue}- Tüm araçlarla deluxe kurulum"
echo -e "${green}[2]${reset} Mini ZexKali ${blue}- Hafif, hızlı, işlevsel"
echo -e "${green}[3]${reset} Nano ZexKali ${blue}- Sadece temel sistem"
echo ""

read -p "$(echo -e ${yellow}Seçiminizi yapınız [1-3]:${reset} ) " choice

# Ortak Kurulum Fonksiyonu
common_setup() {
    echo -e "${cyan}[+] Bağımlılıklar yükleniyor...${reset}"
    pkg update -y && pkg upgrade -y
    pkg install -y wget curl proot-distro tar
}

# Seçime göre kurulum
case $choice in
  1)
    echo -e "${cyan}[+] Full ZexKali kuruluyor...${reset}"
    common_setup
    pkg install -y git python python2 ruby nmap hydra metasploit
    proot-distro install zexkali
    echo -e "${green}[✓] Full ZexKali kuruldu!${reset}"
    ;;
  2)
    echo -e "${cyan}[+] Mini ZexKali kuruluyor...${reset}"
    common_setup
    pkg install -y git python nmap hydra
    proot-distro install zexkali
    echo -e "${green}[✓] Mini ZexKali kuruldu!${reset}"
    ;;
  3)
    echo -e "${cyan}[+] Nano ZexKali kuruluyor...${reset}"
    common_setup
    proot-distro install zexkali
    echo -e "${green}[✓] Nano ZexKali kuruldu!${reset}"
    ;;
  *)
    echo -e "${red}[-] Geçersiz seçim. Kurulum iptal edildi.${reset}"
    ;;
esac

echo -e "${yellow}Giriş için: ${green}proot-distro login zexkali${reset}"

# chmod +x
chmod +x kali.sh
chmod +x nethunter-fix.sh
chmod +x ~/.proot-distro/distro/zexkali.sh