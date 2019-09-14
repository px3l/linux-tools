#!/bin/bash
echo -e
echo -e
GRAY="\033[1;30m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
echo -e $GRAY"  ====================================================  "$ENDCOLOR
echo -e $GRAY" ===                                                === "$ENDCOLOR
echo -e $GRAY"==               "$RED"Linux-updater by px3l"$GRAY"               =="$ENDCOLOR
echo -e $GRAY" ===                                                === "$ENDCOLOR
echo -e $GRAY"  ====================================================  "$ENDCOLOR
echo -e
echo -e
                                                                                                                                                                                                                                         
YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
 
if [ $USER != root ]; then
echo -e $RED"[Linux-updater]:Error: must be root"
echo -e $YELLOW"[Linux-updater]:Exiting..."$ENDCOLOR
echo -e
exit 0
fi

echo -e $YELLOW"[Linux-updater]:Updating sources..."$ENDCOLOR
sudo apt-get -y update

read -p "$(echo -e $YELLOW"[Linux-updater]:Distribution and package upgrades. This is not recommended for Linux Mint, please use the package manager. Continue? (y / n)    "$ENDCOLOR)" -n 1 -r
echo -e
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e $YELLOW"[Linux-updater]:Upgrading..."$ENDCOLOR
	sudo apt-get -y upgrade

  echo -e $YELLOW"[Linux-updater]:Distribution upgrading..."$ENDCOLOR
	sudo apt-get -y dist-upgrade
fi

echo -e $YELLOW"[Linux-updater]:Script Finished!"$ENDCOLOR
echo -e
echo -e $RED"Upgrading complete."$ENDCOLOR
echo -e
