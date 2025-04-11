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
echo -e "${yellow}              ZexKali Rootless Installer"
echo -e "${reset}"

# Menü
echo -e "${green}[1]${reset} Full ZexKali ${blue}- Tüm araçlarla deluxe kurulum"
echo -e "${green}[2]${reset} Mini ZexKali ${blue}- Hafif, hızlı, işlevsel"
echo -e "${green}[3]${reset} Nano ZexKali ${blue}- Sadece temel sistem"
echo ""

read -p "$(echo -e ${yellow}Seçiminizi yapınız [1-3]:${reset} ) " choice

# Temel paket kurulumu
echo -e "${blue}[~] Termux bağımlılıkları kuruluyor...${reset}"
pkg update -y && pkg upgrade -y
pkg install -y wget curl proot tar git

# NetHunter Rootless script indiriliyor
echo -e "${blue}[~] NetHunter kurulum scripti indiriliyor...${reset}"
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux

case $choice in
  1)
    echo -e "${cyan}[+] Full ZexKali kuruluyor...${reset}"
    ./install-nethunter-termux -r
    echo -e "${green}[✓] Full kurulum tamamlandı.${reset}"
    ;;
  2)
    echo -e "${cyan}[+] Mini ZexKali kuruluyor...${reset}"
    ./install-nethunter-termux -r
    echo -e "${yellow}[~] Mini sistem için bazı araçlar kaldırılabilir...${reset}"
    echo -e "${green}[✓] Mini kurulum tamamlandı.${reset}"
    ;;
  3)
    echo -e "${cyan}[+] Nano ZexKali kuruluyor...${reset}"
    ./install-nethunter-termux -r
    echo -e "${yellow}[~] Bu versiyon yalnızca temel NetHunter ortamıdır.${reset}"
    echo -e "${green}[✓] Nano kurulum tamamlandı.${reset}"
    ;;
  *)
    echo -e "${red}[-] Geçersiz seçim. Kurulum iptal edildi.${reset}"
    exit 1
    ;;
esac

echo ""
echo -e "${blue}[!] NetHunter'a giriş yapmak için şu komutu kullanın:${reset}"
echo -e "${green}nethunter${reset}"