#!/data/data/com.termux/files/usr/bin/bash

# NetHunter Fix
echo -e "${cyan}[+] NetHunter GUI (KeX) fix uygulanıyor...${reset}"

apt update -y
apt install -y tigervnc-standalone-server

# VNC sunucusunu sıfırla
vncserver -kill :1 >/dev/null 2>&1
rm -rf ~/.vnc
vncserver

echo -e "${green}[✓] VNC sunucusu yeniden başlatıldı.${reset}"

# chmod +x
chmod +x kali.sh
chmod +x nethunter-fix.sh
chmod +x ~/.proot-distro/distro/zexkali.sh