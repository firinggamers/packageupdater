#!/bin/bash 

#######################################################################

# THIS SCRIPT UPDATES YOUR PACKAGES AND ALSO CLEANS YOUR LOG FOR YOU  #
# BUT MAY TEMPORARILY BREAK YOUR SERVICES. USE AT YOUR OWN DISCRETION #

#######################################################################

if [[ $EUID -ne 0 ]]; then 
     echo "PLEASE RUN THIS SCRIPT AS A ROOT USER"
     exit 1
fi     

#script variable defining 
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)


if [[ $APT_GET_CMD ]]; then
     apt-get install -y curl
     apt-get install -y toilet 
     apt-get install -y figlet
     clear 

     echo "THIS SCRIPT WOULD UPDATE YOUR PACKAGES AND CLEAN UP LOGS " | toilet -f term -F border --gay

     sleep 1 

     echo "CHECKING COMPATIBILITY WITH SCRIPT"

     sleep 1
fi
     sleep 1

if [[ $YUM_CMD ]]; then 
     yum update 

 elif [[ $APT_GET_CMD ]]; then 
     apt update && apt -y upgrade
fi

     echo "[ OK ] update done" | toilet -f term -F border --gay
     
     sleep 1

     echo "CLEANING AFTER UPDATE [PLEASE DO NOT EXIT]" | toilet -f term -F border --gay
     
     echo "CLEANING LOGS IN /VAR/LOG" | toilet -f term -F border --gay
     cd /var/log
     cat /dev/null > messages
     cat /dev/null > wtmp
     echo "[ OK ] LOGS CLEANED" | toilet -f term -F border --gay
     sleep 1

if [[ $APT_GET_CMD ]]; then
     apt remove -y toilet 
     apt remove -y figlet 
     clear
     
     sleep 1

     echo "THANK YOU FOR USING MY SCRIPT"

     exit 1;

fi
