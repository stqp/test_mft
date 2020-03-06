#!/bin/bash

now=$(date "+%Y%m%d-%H%M%S");
log_path="/tmp/mac_ripper_depinstaller_${now}.log";


## clean up old .app
if [ -e /Applications/MacRipper.app ]
then 
  sudo rm -rf /Applications/MacRipper.app
fi


## enable brew to install packages.
sudo chown -R $(whoami) /usr/local/lib/pkgconfig


## install brew command
which brew >/dev/null 2>&1;
if [ $? -ne 0 ]
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
else
  brew update;
fi


## install brew formula
brew_deps=(
git
tcl-tk
python3
)
for dep in ${brew_deps[@]}
do 
  brew list | grep ${dep} >/dev/null 2>&1;
  if [ $? -ne 0 ]
  then
    echo "Installing brew formula : ${dep} ";    
    brew install ${dep};
    echo "${dep} is installed.";
  else
    echo "Upgrading brew formula : ${dep} ";
    brew upgrade ${dep};
    echo "${dep} is upgraded.";
  fi
done


pip_deps=(
pip3
pytz
lz4
inquirer
)
for dep in ${pip_deps[@]}
do 
  python3 -c "import ${dep}" >/dev/null 2>&1;
  if [ $? -ne 0 ]
  then
    echo "Installing pip3 module : ${dep} ";    
    pip3 install --user ${dep};
    echo "${dep} is installed.";
  else
    echo "Upgrading pip3 module : ${dep}";
    pip3 install -U ${dep};
    echo "${dep} is upgraded.";
  fi 
done


## install MacRipper.app
cd /tmp
git clone https://github.com/stqp/test_mft.git MFT;
mv MFT/mac_ripper/automator/MacRipper.app /Applications/MacRipper.app;
rm -rf MFT;

