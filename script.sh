#!/bin/bash

# Primer parametro  (columna) > 0
# Segundo parametro (fila)    > 1

cantFilas=$(cat ejemplo.csv | wc -l)

#Validamos por la negativa
if [ $# -ne 2 ] || [ $1 -le 0 ] || [ $2 -le 1 ] || [ $2 -gt $cantFilas ]; then
	echo "INVALID PARAMETERS"
	exit 1
fi

#Titulo de la columna
echo "Encabezado: "
echo $(cat ejemplo.csv | head -n 1 | cut -d ";" -f$1 )
 
#Valor
echo "Valor: "
valor=$(cat ejemplo.csv | head -n $2 | tail -n 1 | cut -d ";" -f$1)
echo $valor

#Cantidad de ocurrencias de valor en su columa
echo "Cantidad de $valor"
echo $(cat ejemplo.csv | cut -d ";" -f$1 | grep -w $valor | wc -l) 


