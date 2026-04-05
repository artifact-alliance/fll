#!/bin/bash
sudo apt install  -qq -y figlet > /dev/null
figlet "Ancient Vision"
echo "The future of archeological databases and scanning software"
echo "By Ethan Li"
echo "MIT License"
cd
echo 'Installation Logs:'
echo 'Checking for and removing old install files'
figlet "Ancient Vision" > /dev/null
echo "The future of archeological databases and scanning software" > /dev/null
echo "By Ethan Li" > /dev/null
echo "MIT License" > /dev/null
echo 'Installation Logs:' > /dev/null
echo 'Checking for and removing old install files' > /dev/null
rm -f -- vision.py > /dev/null
rm -f -- powermonitor.py > /dev/null
rm -f -- gpiolibrary.py > /dev/null
rm -f -- service.py > /dev/null
rm -f -- stop.py > /dev/null
rm -f -- service.sh > /dev/null
rm -f -- requierments.txt > /dev/null
rm -f -- index.html > /dev/null
echo 'All old install files removed, pulling new ones'
echo 'All old install files removed, pulling new ones' > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/vision.py -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/powermonitor.py -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/gpiolibrary.py -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/service.py -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/stop.py -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/service.sh -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/requierments.txt -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/index.html -4 > /dev/null
echo 'Main Files pulled; setting service.sh as executable' > /dev/null
echo 'Main Files pulled; setting service.sh as executable'
chmod +x service.sh
rm images -r > /dev/null
mkdir images && cd images
rm -f -- click.mp3 > /dev/null
rm -f -- button.png > /dev/null
rm -f -- GUI.png > /dev/null
rm -f -- title.png > /dev/null
rm -f -- tailwind.js > /dev/null
rm -f -- stop.png > /dev/null
echo 'Downloading HTML5 Assets'
echo 'Downloading HTML5 Assets' > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/click.mp3 -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/button.png -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/GUI.png -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/title.png -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/tailwind.js -4 > /dev/null
wget https://raw.githubusercontent.com/artifact-alliance/fll/master/install/stop.png -4 > /dev/null
cd
echo 'Installing requiered python packages'
echo 'Installing requiered python packages' > /dev/null
pip install -r requierments.txt --break-system-packages --disable-pip-version-check > /dev/null
echo 'Installing linux-wifi-hotspot' 
rm linux-wifi-hotspot -r > /dev/null
echo 'Cloning Repository'
git clone https://github.com/lakinduakash/linux-wifi-hotspot.git > /dev/null
cd linux-wifi-hotspot
echo 'Building App'
make > /dev/null
sudo make install > /dev/null
systemctl enable create_ap > /dev/null
cd
echo "Installation complete! You can find the logs at install.log"
echo "The dashboard is hosted at http://localhost:1234"
echo "Set service.sh to run on startup!"
echo "Flask App Logs:"
python service.py || python3 service.py > flask.log
