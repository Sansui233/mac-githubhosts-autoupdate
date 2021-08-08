sudo rm /usr/local/bin/hoststool
sudo rm -rf /etc/hoststool
sudo launchctl unload -w /Library/LaunchDaemons/hoststool.plist
sudo rm /Library/LaunchDaemons/hoststool.plist
sudo rm /etc/hosts.backup
sudo rm /Library/Logs/hoststool.log
echo "[INFO] Totally uninstalled. Bye" 