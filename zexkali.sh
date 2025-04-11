#!/data/data/com.termux/files/usr/bin/bash

# chmod +x komutu ile dosya çalıştırılabilir hale getiriliyor
chmod +x zexkali.sh

# ZexKali Setup Başlangıcı
clear
echo "ZexKali kurulumu başlatılıyor..."

# Özel distroyu indirme ve kurma
proot-distro install zexkali

# ZexKali kurulumu tamamlandığında mesaj
echo "ZexKali kurulumu tamamlandı!"

# Çıkış
exit 0