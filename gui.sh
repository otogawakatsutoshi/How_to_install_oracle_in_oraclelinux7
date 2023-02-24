yum update -y

yum -y groupinstall "Server with GUI"

# macの日本語キーボードの場合は下のレイアウトを反映させる。
localectl set-x11-keymap jp apple_laptop

systemctl set-default graphical.target
