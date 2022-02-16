#! /usr/bin/bash

PREFIX='\e[48;5;'
SUFIX='m'

for ((i = 0; i < 256 ; i++)); do
	#printf "$i $PREFIX$i$SUFIX TEXT \033[0m\n";
	printf "\e[48;5;${i}m TEXT \033[0m \ e[48;5;${i}m\n";
done
