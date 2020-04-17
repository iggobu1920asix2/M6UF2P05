#!/bin/bash
#
function most_serv {
	clear
	echo "Que paquet vols instalar:"
	echo "a) cups"
	echo "b) ssh"
	echo "c) apache2"
	echo -n "Selecciona una opció: "
	read opc	
	return 0
}

function ctl_serv {
	case $opc in
		a) aptitude install cups > /dev/null 
		   if [[ $? -ne 0 ]] 
		   then				 
				aptitude install cups  
		   fi
		   ;;
		b) aptitude install ssh > /dev/null
		   if [[ $? -ne 0 ]]
		   then
				aptitude install ssh 
		   fi
		   ;;
		c) aptitude install apache2 > /dev/null
		   if [[ $? -ne 0 ]]
		   then
				aptitude install apache2 
		   fi
		   ;; 
		*) echo "Opció incorrecta";;
	esac
}

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
most_serv
ctl_serv
exit 10
