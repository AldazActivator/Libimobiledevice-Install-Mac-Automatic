#!/bin/bash
check()
{
echo "𝗶𝗔𝗟𝗗𝗔𝗭 𝗫𝗣𝗥𝗢.."
sleep 2

if [ -d /usr/local/Cellar/libimobiledevice ];
then
echo "CHECKING DEPENDENCIES"
echo ""
echo "THE DEPENDENCIES ALREADY EXISTS!"
echo ""
echo "STARTING DOWNLOAD OF PKG FILE"
echo ""
echo "𝗔𝗟𝗗𝗔𝗭 𝗫𝗣𝗥𝗢:"
curl "https://iservices-dev.us/Tools/iAldazXPRO.pkg" --output ~/Desktop/iAldazXPRO.pkg
echo "SUCCESSFULLY!"
open ~/Desktop/iAldazXPRO.pkg

else
echo "iAldazXPRO needs full access to install the dependencies"
echo "Please Enter your Mac login password:"
sudo -v

if [ -d /usr/local/Cellar ];
then
echo "EXISTING DIRECTORY, CONTINUED WITH PERMISSIONS."
sudo chown -R $(whoami) /usr/local/Cellar
chmod -R 00777 /usr/local/Cellar/*
else
echo "WARNING: DOES NOT EXIST, CONTINUE WITH THE INSTALLATION (THIS IS NOT AN ERROR)"
fi

if [ -d /usr/local/Caskroom ];
then
echo "EXISTING DIRECTORY, CONTINUED WITH PERMISSIONS..."
sudo chown -R $(whoami) /usr/local/Caskroom
sleep 2
chmod -R 00777 /usr/local/Caskroom/

sudo chown -R $(whoami) /usr/local/Caskroom
else
echo "WARNING: DOES NOT EXIST, CONTINUE WITH THE INSTALLATION (THIS IS NOT AN ERROR)"
fi

sleep 1
echo "𝗶𝗔𝗟𝗗𝗔𝗭 𝗫𝗣𝗥𝗢 :>"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install ideviceinstaller
brew install libimobiledevice
echo "STARTING DOWNLOAD OF PKG FILE"
curl "https://iservices-dev.us/Tools/iAldazXPRO.pkg" --output ~/Desktop/iAldazXPRO.pkg

echo "SUCCESS! ENJOY!"

fi

exit
}

check
read -p ''
