#!/bin/bash

# Periksa apakah skrip dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan skrip ini sebagai root."
  exit 1
fi

# Hapus file /etc/apt/sources.list jika ada
if [ -f /etc/apt/sources.list ]; then
  rm /etc/apt/sources.list
  echo "File /etc/apt/sources.list telah dihapus."
else
  echo "File /etc/apt/sources.list tidak ditemukan, lanjut membuat baru."
fi

# Membuat file /etc/apt/sources.list baru
cat <<EOL > /etc/apt/sources.list
deb http://kartolo.sby.datautama.net.id/ubuntu/ jammy main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ jammy-updates main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ jammy-security main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ jammy-backports main restricted universe multiverse
deb http://kartolo.sby.datautama.net.id/ubuntu/ jammy-proposed main restricted universe
EOL

echo "File /etc/apt/sources.list baru telah dibuat dengan sukses."
