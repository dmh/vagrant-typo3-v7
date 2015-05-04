#!/usr/bin/env bash

echo "=============================="
echo "Starting Provision..."
echo "=============================="

# Create MySQL DB for TYPO3
echo -e "Creating TYPO3 DB & VirtualHost... \r50% "
echo "CREATE DATABASE typo3" | mysql -uroot -p1234
mysql -uroot -p1234 typo3 < /var/www/typo3db/typo3db.sql

# Restart MySQL
echo -e "Restarting MySQL & Apache... \r80% "
service mysql restart > /dev/null 2>&1
# Restart Apache
service apache2 restart > /dev/null 2>&1
echo "Provision complete!"
sleep 2
echo "=============================="
echo "========== INFO =============="
echo "=============================="
echo "VM IP"
ifconfig | perl -nle'/dr:(\S+)/ && print $1'
echo "=============================="
echo "=============================="
echo "TYPO3 login: admin"
echo "TYPO3 password: admin1234"
echo "TYPO3 install tools password: admin1234"
echo "------------------------------"
echo "DB name: typo3"
echo "DB login: root"
echo "DB password: 1234"
echo "=============================="
echo "=============================="
echo "Open site in browser using IP address"

