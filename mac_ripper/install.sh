#!/bin/bash

now=$(date "+%Y%m%d-%H%M%S");
log_path="/tmp/mac_ripper_depinstaller_${now}.log";


## install brew command
which brew >/dev/null 2>&1;
if [ $? -ne 0 ]
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
fi


## install brew formula
brew_deps=(
tcl-tk
python3
)
for dep in ${brew_deps[@]}
do 
  brew list | grep ${dep} >/dev/null 2>&1;
  if [ $? -ne 0 ]
  then
    echo "Installing brew formula : ${dep} ";    
    brew install ${dep} ;
    echo "${dep} is installed." >> ${log_path} 2>&1;
  fi
done


git clone https://github.com/stqp/test_mft.git MFT;

mv ./MFT/mac_ripper/automator/MacRipper.app /Applications;
rm -rf MFT;

