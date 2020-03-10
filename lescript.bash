#!bin/bash


for fich in  /tmp/in/*
do
 
if [ -f "$fich" ];
then 
gzip $fich
mv $fich /tmp/out/

done
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "Code : 22"
    exit

echo "bonjour" >> /tmp/ou/toto.log 
