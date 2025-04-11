#!/data/data/com.termux/files/usr/bin/bash

# Renk kodları
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
reset='\033[0m'

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

# Temel kurulum
pkg update -y && pkg upgrade -y
pkg install -y wget curl proot-distro tar

# PRoot distro konfig klasörü
mkdir -p ~/.proot-distro/distro

# Kali.sh oluştur
cat > ~/.proot-distro/distro/kali.sh << 'EOF'
DISTRO_NAME="ZexKali"

TARBALL_URL['aarch64']="__REPLACE_ME__"
TARBALL_SHA256['aarch64']="SKIP"

DISTRO_ARCH="aarch64"
EOF

# Linkleri belirle
if [ "$choice" = "1" ]; then
    echo -e "${cyan}[+] Full ZexKali kuruluyor...${reset}"
    sed -i 's|__REPLACE_ME__|https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-full.tar.xz|' ~/.proot-distro/distro/kali.sh
elif [ "$choice" = "2" ]; then
    echo -e "${cyan}[+] Mini ZexKali kuruluyor...${reset}"
    sed -i 's|__REPLACE_ME__|https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-minimal.tar.xz|' ~/.proot-distro/distro/kali.sh
elif [ "$choice" = "3" ]; then
    echo -e "${cyan}[+] Nano ZexKali kuruluyor...${reset}"
    sed -i 's|__REPLACE_ME__|https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-nano.tar.xz|' ~/.proot-distro/distro/kali.sh
else
    echo -e "${red}[-] Geçersiz seçim. Kurulum iptal edildi.${reset}"
    exit 1
fi

# Kali'yi kur
proot-distro install kali
echo -e "${green}[✓] ZexKali kurulumu tamamlandı.${reset}"
echo -e "${yellow}Giriş yapmak için:${reset} ${cyan}proot-distro login kali${reset}"