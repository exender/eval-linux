#!bin/bash

touch /tmp/out/lock #creation du fichier lock

touch /tmp/out/log #creation du fichier log

for fich in /tmp/in/*; #pout tous les fichier dans /tmp/in on l'est coupe
do
	if test -f $fich && test -r $fich;
	then #puis on active gzip pour tous les fichiers 
		gzip $fich
		mv $fich.gz /tmp/out #cela donne l'extension .gz a tous les fichiers et les move dans le fichier /tmp/out
		echo "Fichier " $fich" est compréssé" >> /tmp/out/log #donne tous les noms de fichiers dans le logs ceux qui on été compressé 
	else
		if test $fich != "/tmp/in/*";
		then
			echo "Fichier " $fich " non compressé " >> /tmp/out/log #donne tous les noms de fichier non compréssé
		fi
	fi
    if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then #protege le fichier quand il est lancer et crée un code d'erreur si on veut le relancer quand il est actif 
    echo "Code : 22"
    exit
    fi

done
rm -rf /tmp/out/log #detruit le fichier de log apres operation 
rm -rf /tmp/out/lock #detruit le fichier lock apres operation 

