#!/bin/bash

###########################################################
# Making UbuntuBang
# Start in Ubuntu 18.04 Server
# UserID = osboxes
# 2018.04.12
# by Dymaxionkim in Github
###########################################################

###########################################################
# How to use
#
# wget https://raw.githubusercontent.com/dymaxionkim/UbuntuBang/master/UbuntuBang18.04.sh
# chmod +x ./UbuntuBang18.04.sh
# sudo sh ./UbuntuBang18.04.sh
# sudo reboot now
# startx

###########################################################
# Virtualbox Additions
apt -y update
apt -y upgrade
apt -y install build-essential linux-headers-`uname -r`
apt -y install virtualbox-guest-additions-iso
mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
usermod -G vboxsf -a osboxes

###########################################################
# Repository
apt-add-repository -y ppa:numix/ppa
add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
add-apt-repository -y ppa:inkscape.dev/stable
add-apt-repository -y ppa:otto-kesselgulasch/gimp
add-apt-repository -y ppa:libreoffice/ppa
add-apt-repository -y ppa:jonathonf/ffmpeg-3
add-apt-repository -y ppa:openshot.developers/ppa
add-apt-repository -y ppa:webupd8team/atom
add-apt-repository -y ppa:freecad-maintainers/freecad-stable
# Elmer FEM is not yet provided for Ubuntu 18.04
# apt-add-repository -y ppa:elmer-csc-ubuntu/elmer-csc-ppa
add-apt-repository -y ppa:octave/stable
apt -y update

###########################################################
# Installs
apt -y install xorg openbox obmenu lxappearance xcompmgr nitrogen tint2
apt -y install numlockx terminator pcmanfm pluma language-pack-ko fonts-noto-cjk fonts-nanum* fonts-naver-d2coding 
apt -y install ibus ibus-hangul im-config alsa alsa-tools volumeicon-alsa
apt -y install numix-icon-theme-circle shimmer-themes libreoffice okular mirage inkscape gimp smplayer
apt -y install cups-pdf convertall qalculate file-roller gksu firefox-trunk vlc expect
apt -y install ffmpeg libav-tools x264 x265
apt -y install openshot-qt
apt -y install atom freecad
mv /usr/share/netgen/drawing.tcl /usr/share/netgen/drawing.tcl.bak
cp ./drawing.tcl /usr/share/netgen/drawing.tcl
apt -y install texlive-full pandoc


###########################################################
# Engineering

# Octave
apt -y install octave liboctave-dev


# Elmer
#apt -y install elmerfem-csc
#mkdir /usr/share/ElmerGUI/icons
#wget -O /usr/share/ElmerGUI/icons/Mesh3D.png "https://raw.githubusercontent.com/tehnick/elmerfem/master/ElmerGUI/Application/icons/Mesh3D.png"
#echo '' >> /home/osboxes/.bashrc
#echo '# ElmerGUI' >> /home/osboxes/.bashrc
#echo 'ELMERGUI_HOME=/usr/share/ElmerGUI' >> /home/osboxes/.bashrc
#echo 'ELMERSOLVER_HOME=/usr/share/elmersolver' >> /home/osboxes/.bashrc
#echo 'ELMERLIB=/usr/lib/elmersolver' >> /home/osboxes/.bashrc
#echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ELMERLIB:$ELMERSOLVER_HOME/lib' >> /home/osboxes/.bashrc

#echo '#!/bin/bash' > /usr/bin/Start_Elmer.sh
#echo 'export ELMERGUI_HOME=/usr/share/ElmerGUI' >> /usr/bin/Start_Elmer.sh
#echo 'export ELMERSOLVER_HOME=/usr/share/elmersolver' >> /usr/bin/Start_Elmer.sh
#echo 'export ELMERLIB=/usr/lib/elmersolver' >> /usr/bin/Start_Elmer.sh
#echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ELMERLIB:$ELMERSOLVER_HOME/lib' >> /usr/bin/Start_Elmer.sh
#echo '/usr/bin/ElmerGUI' >> /usr/bin/Start_Elmer.sh

#chmod +x /usr/bin/Start_Elmer.sh

#echo '[Desktop Entry]' > /usr/share/applications/ElmerGUI.desktop
#echo 'Encoding=UTF-8' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Name=Elmer' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Comment=Elmer FEA software' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Exec=Start_Elmer.sh' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Icon=/usr/share/ElmerGUI/icons/Mesh3D.png' >> /usr/share/applications/ElmerGUI.desktop
#echo 'StartupNotify=true' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Terminal=false' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Type=Application' >> /usr/share/applications/ElmerGUI.desktop
#echo 'Categories=Education;' >> /usr/share/applications/ElmerGUI.desktop


# Gmsh
wget -O Gmsh.tgz "http://gmsh.info/bin/Linux/gmsh-3.0.6-Linux64.tgz"
tar -xvzf Gmsh.tgz
mv ./gmsh* /home/osboxes/Gmsh
rm Gmsh.tgz

echo '' >> ~/.bashrc
echo '# Gmsh' >> ~/.bashrc
echo 'export PATH="/home/osboxes/Gmsh/bin:$PATH"' >> ~/.bashrc

echo '[Desktop Entry]' > /usr/share/applications/Gmsh.desktop
echo 'Encoding=UTF-8' >> /usr/share/applications/Gmsh.desktop
echo 'Name=Gmsh' >> /usr/share/applications/Gmsh.desktop
echo 'Comment=Mesh Generator' >> /usr/share/applications/Gmsh.desktop
echo 'Exec=/home/osboxes/Gmsh/bin/gmsh' >> /usr/share/applications/Gmsh.desktop
echo 'Icon=/home/osboxes/Gmsh/share/doc/gmsh/tutorial/image.png' >> /usr/share/applications/Gmsh.desktop
echo 'StartupNotify=true' >> /usr/share/applications/Gmsh.desktop
echo 'Terminal=false' >> /usr/share/applications/Gmsh.desktop
echo 'Type=Application' >> /usr/share/applications/Gmsh.desktop
echo 'Categories=Education;' >> /usr/share/applications/Gmsh.desktop


# Paraview
wget -O Paraview.tar.gz "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.5&type=binary&os=Linux&downloadFile=ParaView-5.5.0-Qt5-MPI-Linux-64bit.tar.gz"
tar -xvzf Paraview.tar.gz
mv ./ParaView-* /home/osboxes/Paraview
rm Paraview.tar.gz

echo '' >> ~/.bashrc
echo '# Paraview' >> ~/.bashrc
echo 'export PATH="/home/osboxes/Paraview/bin:$PATH"' >> ~/.bashrc

echo '[Desktop Entry]' > /usr/share/applications/Paraview.desktop
echo 'Encoding=UTF-8' >> /usr/share/applications/Paraview.desktop
echo 'Name=Paraview' >> /usr/share/applications/Paraview.desktop
echo 'Comment=Data Analysis and Visualization' >> /usr/share/applications/Paraview.desktop
echo 'Exec=/home/osboxes/Paraview/bin/paraview' >> /usr/share/applications/Paraview.desktop
echo 'Icon=/home/osboxes/Paraview/share/icons/hicolor/32x32/apps/paraview.png' >> /usr/share/applications/Paraview.desktop
echo 'StartupNotify=true' >> /usr/share/applications/Paraview.desktop
echo 'Terminal=false' >> /usr/share/applications/Paraview.desktop
echo 'Type=Application' >> /usr/share/applications/Paraview.desktop
echo 'Categories=Education;' >> /usr/share/applications/Paraview.desktop


# Salome
wget -O Salome.tgz "http://www.salome-platform.org/downloads/current-version/DownloadDistr?platform=OS1.UB16.04&version=8.4.0"
tar -xvzf Salome.tgz
mv ./SALOME-* /home/osboxes/Salome
rm Salome.tgz

echo '' >> ~/.bashrc
echo '# Salome' >> ~/.bashrc
echo 'export PATH="/home/osboxes/Salome:$PATH"' >> ~/.bashrc

echo '[Desktop Entry]' > /usr/share/applications/Salome.desktop
echo 'Encoding=UTF-8' >> /usr/share/applications/Salome.desktop
echo 'Name=Salome' >> /usr/share/applications/Salome.desktop
echo 'Comment=Pre/Post Processing' >> /usr/share/applications/Salome.desktop
echo 'Exec=/home/osboxes/Salome/salome' >> /usr/share/applications/Salome.desktop
echo 'Icon=/home/osboxes/Salome/BINARIES-UB16.04/SALOME/share/salome/resources/salome_profile/splash.png' >> /usr/share/applications/Salome.desktop
#echo 'Icon=/home/osboxes/Salome/BINARIES-UB16.04/SMESH/share/doc/salome/gui/SMESH/blocFissure/_images/01_CubeAngle.png' >> /usr/share/applications/Salome.desktop
echo 'StartupNotify=true' >> /usr/share/applications/Salome.desktop
echo 'Terminal=false' >> /usr/share/applications/Salome.desktop
echo 'Type=Application' >> /usr/share/applications/Salome.desktop
echo 'Categories=Education;' >> /usr/share/applications/Salome.desktop


###########################################################
# Remove
apt remove --purge gnome-terminal

###########################################################
# Adduser
adduser osboxes audio

###########################################################
# Locale
echo "LANG=\"ko_KR.UTF-8\"" > /etc/default/locale
echo "LANGUAGE=\"ko_KR:ko\"" >> /etc/default/locale
echo "LC_NUMERIC=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_TIME=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_MONETARY=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_PAPER=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_IDENTIFICATION=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_NAME=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_ADDRESS=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_TELEPHONE=\"ko_KR.UTF-8\"" >> /etc/default/locale
echo "LC_MEASUREMENT=\"ko_KR.UTF-8\"" >> /etc/default/locale

###########################################################
# Openbox
mkdir /home/osboxes/.config
mkdir /home/osboxes/.config/openbox
echo "xcompmgr &" > /home/osboxes/.config/openbox/autostart
echo "nitrogen --restore &" >> /home/osboxes/.config/openbox/autostart
echo "tint2 -c /home/osboxes/.config/tint2/tint2rc &" >> /home/osboxes/.config/openbox/autostart
echo "volumeicon &" >> /home/osboxes/.config/openbox/autostart
chown -R osboxes /home/osboxes/.config

###########################################################
# Numix Taskbar
mv /home/osboxes/.config/tint2/tint2rc /home/osboxes/.config/tint2/tint2rc.old
wget https://raw.githubusercontent.com/danielcbaldwin/dotfiles/master/tint2/.config/tint2/themes/Numix/red_taskbar/tint2rc
mv ./tint2rc /home/osboxes/.config/tint2/tint2rc


# Fin
echo 'Finished!'
