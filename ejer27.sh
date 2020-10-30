#!/bin/bash

#inicializar: Crea un arreglo llamado array vacío

#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido

#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la

#posición recibida como parámetro. Debe validar que se reciba una posición válida

#longitud: Imprime la longitud del arreglo en pantalla

#imprimir: Imprime todos los elementos del arreglo en pantalla

#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud

#<parametro1>y en todas las posiciones asigna el valor <parametro2>


#variables globales

arreglo=()

#funciones

function iniciar(){
	arreglo=()
	echo "Arreglo  iniciado";
}

function agregar_elem(){
	if [ $# -ne 1 ]; then
		echo "Ingrese un parametro"
		return 1
	fi
	
	arreglo=(${arreglo[*]} $1)
	echo "Elemento $1 agregado al arreglo"
	
}

function eliminar_elem(){
	if [ $# -ne 1 ]; then
		echo "Ingrese un parametro";
		return 1;
	fi
	
	if [ $1 -ge ${#arreglo[*]} ]; then
		echo "Posivion invalida"
		return 2
	fi
	
	unset arreglo[$1];
	# Unset elimina el valor pero la posicion sigue estando
	# Entonces no reduce la cantidad del arreglo
	
	arreglo=(${arreglo[*]});
	
	echo "Elemento $1 fue eliminado"
}

function longitud(){
	echo ${#arreglo[*]};
	
}

function imprimir(){
	echo ${arreglo[*]};
	
}

function iniciar_Con_Valores(){
	
	if [ $# -ne 2 ]; then
		echo "Cantidad de parametros incorrectos"
		return 1;
	fi
	
	iniciar
	for (( i=0; i < $1; i++)); do
		agregar_elem $2
	done
	
	echo "Arreglo inicializado $1 veces el valor $2"
}



#P.P

select opt in iniciar agregar_elem eliminar_elem longitud imprimir iniciar_Con_Valores finalizar; do

	case $opt in
		"iniciar")
			iniciar
			;;
	
		"agregar_elem")
			echo "Ingresar un elemento"
			read elemento
			agregar_elem $elemento
			;;
	
		"eliminar_elem")
			echo "Indique posicion a eliminar"
			read posicion
			eliminar_elem $posicion
			;;
	
		"longitud")
			echo "El arreglo tiene $(longitud) elementos"
			;;
	
		"imprimir")
			echo "Arreglo: $(imprimir)"
			;;
		"iniciar_Con_Valores")
			echo "Ingrese cantidad: "
			read cantidad
			echo "Ingrese valor: "
			read valor
			iniciar_Con_Valores $cantidad $valor
			;;
		"finalizar")
			break
	esac
done



