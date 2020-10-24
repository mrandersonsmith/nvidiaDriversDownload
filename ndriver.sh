#! /bin/bash
new=$(wget https://download.nvidia.com/XFree86/Linux-x86_64/latest.txt -q -O -)
version=( $new )
echo "Newest driver available is ${version[0]}"
driver=$(grep "X Driver" /var/log/Xorg.0.log)
echo "Currently installed driver: $driver" 



echo "use '--update' to download new driver"

if [[ $1 == "--update" ]]; then
url="https://download.nvidia.com/XFree86/Linux-x86_64/${version[1]}"
wget $url
chmod +x "NVIDIA-Linux-x86_64-${version[0]}.run"
fi
