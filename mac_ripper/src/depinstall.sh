#! /bin/bash

#now=$(date "+%Y%m%d-%H%M%S");
#log_path="/tmp/mac_ripper_depinstaller_${now}.log";

if [ ! -e /usr/local/Cellar/tcl-tk ]
then
  cp -r ./brew-packages/tcl-tk /usr/local/Cellar/ ;
  ln -s /usr/local/Cellar/tcl-tk /usr/local/opt/tcl-tk ;
fi


#which brew >/dev/null 2>&1;
#if [ $? -ne 0 ]
#then
#  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#fi
#
#
#brew_deps=(
#python3
#tck-tk
#)
#for dep in ${brew_deps[@]}
#do 
#  brew info ${dep} >/dev/null 2>&1;
#  if [ $? -ne 0 ]
#  then
#    echo "Installing brew formula : ${dep} " >>${log_path} 2>&1;    
#    brew install ${dep} ;
#    echo "${dep} is installed." >> ${log_path} 2>&1;
#  fi
#done
#
#
#pip_deps=(
#python3-tk
#tkinter
#pytz
#lz4
#inquirer
#)
#for dep in ${pip_deps[@]}
#do 
#  python3 -c "import ${dep}" >/dev/null 2>&1;
#  if [ $? -ne 0 ]
#  then
#    echo "Installing pip3 module : ${dep} " >>${log_path} 2>&1;    
#    pip3 install --user ${dep} >>${log_path} 2>&1;
#    echo "${dep} is installed." >> ${log_path} 2>&1;
#  fi 
#done


