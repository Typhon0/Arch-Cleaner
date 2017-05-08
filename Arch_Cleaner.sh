#!/bin/bash
#Author: typhon0
#Website: https://typhon0.fr.nf/
#Github: https://github.com/Typhon0
#Last Update: 8 May 2017

echo '                  -`'
echo '                 .o+`'
echo '                `ooo/'
echo '               `+oooo:'
echo '              `+oooooo:'
echo '              -+oooooo+:'
echo '            `/:-:++oooo+:'
echo '           `/++++/+++++++:'
echo '          `/++++++++++++++:'
echo '        `/+++ooooooooooooo/`'
echo '        ./ooosssso++osssssso+`'
echo '       .oossssso-````/ossssss+`'
echo '      -osssssso.      :ssssssso.'
echo '     :osssssss/        osssso+++.'
echo '    /ossssssss/        +ssssooo/-'
echo '  `/ossssso+/:-        -:/+osssso+-'
echo ' `+sso+:-`   Arch Cleaner  `.-/+oso:'
echo '`++:.                           `-/+/'
echo '.`                                 ` '

echo ''
echo ''
echo '====== Sync Database ====='
echo ''
sudo pacman -Syy


echo ''
echo "====== Optimize Pacman's Mirror ====="
echo ''
echo "This command will defrag Pacman's database, this can be harmful on SSD."
echo ''
read -p "Arch is installed on SSD [y/n] ?" choice
case "$choice" in 
  y|Y ) ;;
  n|N ) 
	sudo pacman-optimize && sync;;
  * ) ;;
esac


echo ''
echo '====== Clean Pacman Cache ====='
echo ''
echo ' Careful this eliminates the possibility of using downgrade '
echo ''
sudo pacman -Scc


echo ''
echo '====== Removing unused packages ====='
echo ''
sudo pacman -Rns $(pacman -Qtdq)


echo ''
echo '====== Update mlocate database ====='
echo ''
sudo updatedb


echo ''
echo '====== rmshit ====='
echo ''

sudo python <(curl https://raw.githubusercontent.com/lahwaacz/Scripts/master/rmshit.py)
