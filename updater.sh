#!/bin/bash 

#script variable defining 
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)


if [[ $APT_GET_CMD ]]; then
     apt-get install -y curl
     apt-get install -y toilet 
     apt-get install -y figlet
     clear 

     echo "THIS SCRIPT WOULD UPDATE YOUR PACKAGES " | toilet -f term -F border --gay

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
if [[ $APT_GET_CMD ]]; then
     apt remove -y toilet 
     apt remove -y figlet 
     clear
     
     sleep 3

     echo "THANK YOU FOR USING MY SCRIPT"

     exit 1;

fi
