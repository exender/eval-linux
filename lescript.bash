#!bin/bash
echo "Hello-word"

for fich in  /tmp/in/*
do
 
if[ -f $fich]
then 
gzip $fich
mv $fich /tmp/out/

done
