#!/bin/bash
# 30 10 * * * /home/pi/Scripts/linux/backups/backups.sh > /home/pi/Scripts/linux/backups/backups.log 2>&1

echo 'Comienza Backup'
tar -cvf backup_$(date +%y.%m.%d).tar /home/pi/ --exclude="/home/pi/Google_drive"
echo 'tar creado'
gzip backup_$(date +%y.%m.%d).tar
echo 'gzip creado'
mv backup_$(date +%y.%m.%d).tar.gz /home/pi/Google_drive/Backup_Pi/
echo 'Se movio Backup al directorio Backup_PI'
cd /home/pi/Google_drive/
echo 'se ejecutara grive'
/usr/local/bin/grive
echo 'se ejecuto grive'
rm /home/pi/Google_drive/Backup_Pi/backup_$(date --date="1 days ago" +%y.%m.%d).tar.gz
echo 'Se borro respaldo de hace 2 dias'
cd ..
