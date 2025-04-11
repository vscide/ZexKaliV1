#!/data/data/com.termux/files/usr/bin/bash

# chmod +x komutu ile dosya çalıştırılabilir hale getiriliyor
chmod +x nethunter-fix.sh

# NetHunter Fix Script Başlangıcı
clear
echo "NetHunter Fix işlemi başlatılıyor..."

# Gerekli paketleri güncelle
pkg update -y
pkg upgrade -y

# Bazı önemli paketler
pkg install -y proot wget curl

# NetHunter düzeltme işlemi
echo "NetHunter düzeltme işlemi tamamlandı."

# Çıkış
exit 0