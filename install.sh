#!/bin/bash

if [ ! -d "/usr/local/bin" ]; then
    mkdir -p /usr/local/bin
fi
./
read -p "[INFO] Test before installing? 安装前是否测试脚本？(y/n)(Default:y): " flag
case $flag in
    "n")
        ;;
    *)
        sudo ./hoststool -u;
        if [ $? -ne 0 ] 
        then
            echo "[ERROR] Failed, exit. 脚本运行失败，退出安装"
            exit 1;
        fi
esac

echo "[INFO] Installing(1/3) Copy hoststool to /usr/local/bin"
sudo cp ./hoststool /usr/local/bin/
echo "[INFO] Installing(2/3) Add hoststool.plist to /Library/LaunchDaemons"
sudo cp ./hoststool.plist /Library/LaunchDaemons/
sudo chown root:admin /Library/LaunchDaemons/hoststool.plist
echo "[INFO] Installing(3/3) Load launch daemon"
sudo launchctl load -w /Library/LaunchDaemons/hoststool.plist

read -p "[INFO] This launch daemon has run once. Show log file? 定时任务已运行一次，是否查看运行日志？(y/n)(Default:y): " flag
case $flag in
    "n")
        ;;
    *)
        if [ ! -f "/Library/Logs/hoststool.log" ] 
        then
            echo "[ERROR] Log file is not generated, some error occured during installation. Log 文件未生成，安装过程中出现问题。"
        else
            open /Library/Logs/hoststool.log
        fi
esac

echo "[INFO] DONE" 
exit 0;