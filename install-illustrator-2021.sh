#!/bin/bash

instdir="$1"
if [ $1 = $2 ]
then
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "Without any arguments, it will install in ~/.WineApps/"
echo "If you want to install it in another dir use the script that way :"
echo " "
echo "'Scriptfile /path/to/dir/'"
echo " "
echo "If you want to change the directory, you have 5 seconds to cancel with CTRL + C"
sleep 5
mkdir ~/.WineApps
instdir=$HOME/.WineApps 
fi


mkdir $instdir/Adobe-Illustrator-2021/


wget https://lulucloud.mywire.org/FileHosting/GithubProjects/Illustrator/wine-illustrator-custom.tar.xz -O /tmp/wine-illustrator-custom.tar.xz
tar -xf /tmp/wine-illustrator-custom.tar.xz -C /tmp/
rm -rf /tmp/wine-illustrator-custom.tar.xz

cp -r /tmp/wine-illustrator-custom $instdir/Adobe-Illustrator-2021/
rm -rf /tmp/wine-illustrator-custom

WINEPREFIX=$instdir/Adobe-Illustrator-2021 $instdir/Adobe-Illustrator-2021/wine-illustrator-custom/bin/wineboot

echo "Downloading Illustrator..."

wget https://lulucloud.mywire.org/FileHosting/GithubProjects/Illustrator/AdobeIllustrator2021.tar.xz -O /tmp/AdobeIllustrator2021.tar.xz
tar -xf /tmp/AdobeIllustrator2021.tar.xz -C /tmp/
rm -rf /tmp/AdobeIllustrator2021.tar.xz 

wget https://lulucloud.mywire.org/FileHosting/GithubProjects/Illustrator/vcredist.tar.xz -O /tmp/vcredist.tar.xz
tar -xf /tmp/vcredist.tar.xz -C /tmp/
rm -rf /tmp/vcredist.tar.xz

WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2010/vcredist_x86.exe /q /norestart

WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2012/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2013/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=$instdir/Adobe-Illustrator-2021 wine /tmp/vcredist/2019/VC_redist.x86.exe /install /quiet /norestart
rm -rf /tmp/vcredist

cp -r /tmp/Adobe\ Illustrator\ 2021 $instdir/Adobe-Illustrator-2021/drive_c/Program\ Files/
rm -rf /tmp/Adobe\ Illustrator\ 2021 

touch $instdir/Adobe-Illustrator-2021/drive_c/launcher.sh
echo 'export WINEPREFIX="'$instdir'/Adobe-Illustrator-2021"' >> $instdir/Adobe-Illustrator-2021/drive_c/launcher.sh
echo 'WINEPREFIX='$instdir'/Adobe-Illustrator-2021 DXVK_LOG_PATH='$instdir'/Adobe-Illustrator-2021 DXVK_STATE_CACHE_PATH='$instdir'/Adobe-Illustrator-2021 '$instdir'/Adobe-Illustrator-2021/wine-illustrator-custom/bin/wine64 ' $instdir'/Adobe-Illustrator-2021/drive_c/Program\ Files/Adobe\ Illustrator\ 2021/Support\ Files/Contents/Windows/Illustrator.exe $FILE_PATH' >> $instdir/Adobe-Illustrator-2021/drive_c/launcher.sh

chmod +x $instdir/Adobe-Illustrator-2021/drive_c/launcher.sh

rm ~/.local/share/icons/illustrator2021.png

wget https://lulucloud.mywire.org/FileHosting/GithubProjects/Illustrator/illustrator2021.png -O ~/.local/share/icons/illustrator2021.png

touch ~/.local/share/applications/illustrator.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/illustrator.desktop
echo 'Name=Illustrator CC 2021' >> ~/.local/share/applications/illustrator.desktop
echo 'Exec=bash -c "'$instdir'/Adobe-Illustrator-2021/drive_c/launcher.sh %F"' >> ~/.local/share/applications/illustrator.desktop
echo 'Type=Application' >> ~/.local/share/applications/illustrator.desktop
echo 'Comment=Illustrator CC 2021 (Wine)' >> ~/.local/share/applications/illustrator.desktop
echo 'Categories=Graphics;' >> ~/.local/share/applications/illustrator.desktop
echo 'Icon=illustrator2021' >> ~/.local/share/applications/illustrator.desktop
echo 'StartupWMClass=illustrator.exe' >> ~/.local/share/applications/illustrator.desktop

echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "."
echo "Illustrator installed, you can close this window"
