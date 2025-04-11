#!/data/data/com.termux/files/usr/bin/bash

# NetHunter fix script
clear
echo -e "\033[1;36m[+] NetHunter fix başlatılıyor...\033[0m"

# Gerekli paketleri yükleyin
pkg update -y
pkg install -y nethunter

# NetHunter kurulumu yapın
echo -e "\033[1;32m[+] NetHunter başarıyla kuruldu.\033[0m"

# NetHunter GUI'yi başlatmaya çalışın
echo -e "\033[1;36m[+] NetHunter GUI başlatılıyor...\033[0m"
nethunter kex &

# NetHunter CLI başlatma
echo -e "\033[1;32m[+] NetHunter CLI'yi başlatın:\033[0m"
echo -e "\033[1;33m$ nethunter\033[0m"