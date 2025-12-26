sudo apt update && sudo apt upgrade -y
cd ..
ls
cd ~
pwd
find ~ -maxdepth 3 -type d -mtime -7
cd ~/mikrotik-web
ls -la
php cek_koneksi.php
sudo service apache2 start
sudo ln -s /home/antumania/mikrotik-web /var/www/html/mikrotik
chmod 755 /home/antumania
chmod -R 755 /home/antumania/mikrotik-web
nano ~/mikrotik-web/index.php
<?php
require('routeros_api.class.php');
// --- KONFIGURASI MIKROTIK ---
$ip    = '192.168.1.1'; // Ganti dengan IP MikroTik Anda
$user  = 'admin';       // Ganti dengan User MikroTik
$pass  = 'password';    // Ganti dengan Password MikroTik
$API = new RouterosAPI();
$API->debug = false;
// Proses Tambah User jika Form disubmit
if (isset($_POST['add_user'])) {
}
?>
<html lang="id">
<head>
</head>
<body>
<div class="header-bg">
</div>
<div class="container">
nano ~/mikrotik-web/index.php
cd ~/mikrotik-web
nano ~/mikrotik-web/index.php
sudo ufw allow 22/tcp  # Untuk SSH
sudo systemctl status apache2
sudo ufw status
hostname -I
sudo tail -n 20 /var/log/apache2/error.log
sudo nano /var/www/html/test.php
sudo chown www-data:www-data /var/www/html/test.php
cd /var/www/html/
ls
sudo wget https://raw.githubusercontent.com/BenMenking/routeros-api/master/routeros_api.class.php
sudo chown www-data:www-data /var/www/html/routeros_api.class.php
sudo nano /var/www/html/index.php
find ~ -name "index.php"
cd mikrotik-web
nano index.php
sudo nano /var/www/html/index.php
mkdir -p routeros-api && wget https://raw.githubusercontent.com/BenMenking/routeros-api/master/routeros_api.class.php -O routeros-api/routeros_api.class.php
sudo nano /var/www/html/index.php
ls
sudo nano /var/www/html/index.php
cat /var/www/html/index.php
sudo nano /var/www/html/index.php
rm /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
<?php
session_start();
ini_set('display_errors', 0);
require_once('routeros_api.class.php');
/* ====================================================
if (isset($_POST['login'])) {
}
if (isset($_GET['action']) && $_GET['action'] == 'logout') {
}
/* ====================================================
<?php exit; } 
/* ====================================================
}
/* ====================================================
$instant_data = null;
if (isset($_SESSION['mikrotik'])) {
}
// SAVE QUICK SETTINGS
if (isset($_POST['save_quick_settings'])) {
}
// TRAFFIC MONITOR AJAX
if (isset($_GET['get_traffic']) && isset($_SESSION['mikrotik'])) {
}
$tab = $_GET['tab'] ?? 'dashboard';
?>
<html lang="id">
<head>
</head>

udo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
udo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo ss -tulpn | grep :80
# Reset portproxy agar bersih
netsh interface portproxy reset
# Masukkan ulang jalur ke IP laptop (192.168.88.30)
netsh interface portproxy add v4tov4 listenport=80 listenaddress=192.168.88.30 connectport=80 connectaddress=172.24.86.152
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
sudo tail -n 50 /var/log/apache2/error.log
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo nano /var/www/html/traffic.php
sudo chown www-data:www-data /var/www/html/traffic.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo cat /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
sudo rm /var/www/html/index.php
sudo nano /var/www/html/index.php
cd mikrotik-web
nano index.php
rm index.php
nano index.php
sudo nano var/www/html/
ls -l
rm -f \[, \], *, 1\ *, 3\ *, 10000, 2000, 5000, all, bypassed, debug, default, [!r]*
ls -l
ls index.php
find ~ -name "index.php"
sudo find / -name "index.php"
locate index.php
sudo apt install plocate
