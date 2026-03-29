#!/bin/bash
echo 'install logs:' > install.log
sudo apt install  -qq -y figlet >> install.log
figlet "Ancient Vision"
echo "The future of archeological databases and scanning software"
echo "By Ethan Li"
echo "MIT License"
cd
echo 'Installation Logs:'
echo 'Checking for and removing old install files'
rm -f -- vision.py >> install.log
rm -f -- DRV8825.py >> install.log
rm -f -- service.py >> install.log
rm -f -- stop.py >> install.log
rm -f -- service.sh >> install.log
rm -f -- requierments.txt >> install.log
rm -f -- index.html >> install.log
echo 'All old install files removed, pulling new ones'
wget https://artifactalliance.org/install/vision.py -4 >> install.log
wget https://artifactalliance.org/install/DRV8825.py -4 >> install.log
wget https://artifactalliance.org/install/service.py -4 >> install.log
wget https://artifactalliance.org/install/stop.py -4 >> install.log
wget https://artifactalliance.org/install/service.sh -4 >> install.log
wget https://artifactalliance.org/install/requierments.txt -4 >> install.log
wget https://artifactalliance.org/install/index.html -4 >> install.log
echo 'Main Files pulled; setting service.sh as executable'
chmod +x service.sh
rm images -r >> install.log
mkdir images && cd images
rm -f -- click.mp3 >> install.log
rm -f -- button.png >> install.log
rm -f -- GUI.png >> install.log
rm -f -- title.png >> install.log
echo 'Downloading HTML5 Assets'
wget https://artifactalliance.org/install/click.mp3 -4 >> install.log
wget https://artifactalliance.org/install/button.png -4 >> install.log
wget https://artifactalliance.org/install/GUI.png -4 >> install.log
wget https://artifactalliance.org/install/title.png -4 >> install.log
cd
echo 'Installing requiered python packages'
pip install -r requierments.txt --break-system-packages --disable-pip-version-check >> install.log
echo 'Installing linux-wifi-hotspot' 
rm linux-wifi-hotspot -r >> install.log
echo 'Cloning Repository'
git clone https://github.com/lakinduakash/linux-wifi-hotspot.git >> install.log
cd linux-wifi-hotspot
echo 'Building App'
make >> install.log
sudo make install >> install.log
systemctl enable create_ap >> install.log
cd
echo "Installation complete! The dashboard is hosted at http://localhost:1234"
echo "Set service.sh to run on startup!"
echo "Flask App Logs:"
python service.py || python3 service.py
