#!/bin/bash

#Se necesita un reporte en formato CSV de los usuarios del sistema que cuenten con un directorio
#personal. Para cada usuario, se debe informar su nombre de usuario, UID, la ruta a su directorio
#personal, espacio en disco que este ocupa y la cantidad de archivos regulares que posee.
#Por ejemplo, una linea del reporte esperado podria ser: iso,1000,/home/iso,10G,90

#Ayuda:
# a) Un ejemplo seria arch.csv
# b) En /etc/passwd figura su directorio personal (columna 6).
# No desde el home ya que puede tener otro nombre
# c) En la columna 3 de /etc/passwd se encuentra el UID de cada usuario
# d) Archivos regulares no directorios

for i in $(cat /etc/passwd | cut -d: -f 1,3,6); do
	aux=""
	user=$(echo $i | cut -d: -f1)
	if [ -d "/home/$user" ]; then
		home=$(echo $i | cut -d: -f3)
		uid=$( echo $i | cut -d: -f2)
		peso=$(du -s -h $home 2> /dev/null | cut -f1)
		archivos=$(find $home -type f 2> /dev/null | wc -l)
		aux="$user,$uid,$home,$peso,$archivos"
		echo $aux >> reporte.csv
	fi
done
echo "Se finalizo el programa de manera exitosa"
echo "Se genero el archivo reporte con exito"
exit 0
