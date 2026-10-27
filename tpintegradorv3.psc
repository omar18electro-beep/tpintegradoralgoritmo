Algoritmo tpintegrador
	
	// Programa con encabezado de la institucion, login (usuario y contrasena
	// cifrados con metodo Cesar, 3 intentos) y menu de 10 ejercicios.
	
	definir opc, i Como Entero
	definir ingreso Como Logico
	definir encabezado, menu Como Caracter
	dimension encabezado[9], menu[10]
	
	//encabezado de la institucion
	encabezado[1] = "INSTITUTO SUPERIOR DE FORMACIÓN DOCENTE Y TECNICA Nº59"
	encabezado[2] = "CARRERA: TECNICATURA SUPERIOR EN ANÁLISIS DE SISTEMAS"
	encabezado[3] = "MATERIA: ALGORITMOS Y PROGRAMACION"
	encabezado[4] = "PROFESOR: DELL ARCIPRETE DARIO"
	encabezado[5] = "CURSO: 1.º AÑO"
	encabezado[6] = "ALUMNO: Omar Elvio Mamani Condori"
	encabezado[7] = "FECHA DE ENTREGA: 27/10/2026"
	encabezado[8] = "Trabajo Practico Integrador"
	encabezado[9] = "version1"
	
	//opciones del menu
	menu[1] = "Busqueda lineal de un numero"
	menu[2] = "Busqueda lineal nombres"
	menu[3] = "Busqueda lineal y contar"
	menu[4] = "Notas de alumnos"
	menu[5] = "Verificador de Tarjetas"
	menu[6] = "Metodo cesar"
	menu[7] = "Factura de productos"
	menu[8] = "Buscar un nro en la matriz con 3 intentos"
	menu[9] = "Sumar dos matrices"
	menu[10] = "Contar elementos pares en una matriz"
	
	//portada
	para i = 1 Hasta 9 Hacer
		Escribir encabezado[i]
	FinPara
	Escribir ""
	
	//login: 3 intentos como maximo
	ingreso = login(3)
	
	si ingreso Entonces
		Repetir
			Limpiar Pantalla
			para i = 1 Hasta 9 Hacer
				Escribir encabezado[i]
			FinPara
			Escribir ""
			Escribir "MENU PRINCIPAL"
			para i = 1 Hasta 10 Hacer
				Escribir i, " - ", menu[i]
			FinPara
			Escribir "0 - Salir"
			Escribir Sin Saltar "Ingrese la opcion del menu: "
			Leer opc
			Limpiar Pantalla
			
			Segun opc Hacer
				1:
					ejercicio1
				2:
					ejercicio2
				3:
					ejercicio3
				4:
					ejercicio4
				5:
					ejercicio5
				6:
					ejercicio6
				7:
					ejercicio7
				8:
					ejercicio8
				9:
					ejercicio9
				10:
					ejercicio10
				0:
					Escribir "Saliendo del sistema. Hasta luego!"
				De Otro Modo:
					Escribir "Opcion invalida"
			FinSegun
			
			si opc <> 0 Entonces
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			FinSi
		Hasta Que opc = 0
	SiNo
		Escribir "Usted fue sacado del sistema."
	FinSi
FinAlgoritmo


//===================================================================
// LOGIN (usuario y contrasena guardados cifrados con Cesar)
//===================================================================
Funcion acceso <- login(maxIntentos)
	definir acceso Como Logico
	definir usuario, password, userCifrado, passCifrado Como Caracter
	definir userGuardado, passGuardado, nombre Como Caracter
	definir clave, intentos Como Entero
	
	clave = 3
	
	//credenciales guardadas YA CIFRADAS con Cesar clave 3
	//usuario: omar -> rodu     contrasena: eureka -> hxuhnd
	userGuardado = "rodu"
	passGuardado = "hxuhnd"
	
	intentos = 0
	acceso = Falso
	
	Escribir "ACCESO AL SISTEMA (maximo ", maxIntentos, " intentos)"
	Repetir
		Escribir Sin Saltar "Usuario: "
		Leer usuario
		Escribir Sin Saltar "Contrasena: "
		Leer password
		
		//cifro lo ingresado y lo comparo con lo guardado
		userCifrado = cifrar(usuario, clave)
		passCifrado = cifrar(password, clave)
		Escribir "Usuario cifrado: ", userCifrado
		Escribir "Contrasena cifrada: ", passCifrado
		
		si userCifrado = userGuardado Y passCifrado = passGuardado Entonces
			acceso = Verdadero
		SiNo
			intentos = intentos + 1
			Escribir "Usuario o contrasena incorrectos."
			si intentos < maxIntentos Entonces
				Escribir "Le quedan ", maxIntentos - intentos, " intentos."
				Escribir ""
			FinSi
		FinSi
	Hasta Que acceso O intentos = maxIntentos
	
	si acceso Entonces
		//descifro el usuario guardado para dar la bienvenida
		nombre = descifrar(userGuardado, clave)
		Escribir ""
		Escribir "Acceso concedido. Bienvenido, ", nombre
		Escribir "Presione una tecla para continuar..."
		Esperar Tecla
	SiNo
		Escribir ""
		Escribir "Acceso denegado: se agotaron los intentos."
	FinSi
FinFuncion


//===================================================================
// CIFRADO / DESCIFRADO CESAR
//===================================================================
Funcion resultado <- cifrar(texto, clave)
	definir resultado, abecedario, letra, textomin Como Caracter
	definir i, j, longp, posnueva Como Entero
	definir encontrada Como Logico
	
	abecedario = "abcdefghijklmnñopqrstuvwxyz"
	textomin = Minusculas(texto)
	longp = Longitud(textomin)
	resultado = ""
	
	Para i = 1 Hasta longp Hacer
		letra = SubCadena(textomin, i, i)
		encontrada = Falso
		j = 1
		Mientras j <= 27 Y no encontrada Hacer
			si SubCadena(abecedario, j, j) = letra Entonces
				encontrada = Verdadero
				posnueva = (j - 1 + clave) Mod 27
				si posnueva < 0 Entonces
					posnueva = posnueva + 27
				FinSi
				letra = SubCadena(abecedario, posnueva + 1, posnueva + 1)
			FinSi
			j = j + 1
		FinMientras
		resultado = resultado + letra // si no era letra, queda igual
	FinPara
FinFuncion

Funcion resultado <- descifrar(texto, clave)
	definir resultado Como Caracter
	resultado = cifrar(texto, -clave)
FinFuncion


//===================================================================
// EJERCICIO 1: busqueda lineal de un numero
//===================================================================
SubProceso ejercicio1
	definir vector, i, buscado, pos Como Entero
	dimension vector[5]
	
	escribir "ingrese cinco numeros para cargar el vector"
	para i = 1 Hasta 5 Hacer
		escribir "ingrese el elemento ", i, ":"
		leer vector[i]
	FinPara
	
	Limpiar Pantalla
	escribir "Busca un numero en el vector y muestra si se encontro, junto con su posicion"
	escribir "ingrese el numero a buscar: "
	leer buscado
	
	pos = 0 // no se encontro
	
	para i = 1 Hasta 5 Hacer
		si vector[i] = buscado y pos = 0 Entonces
			pos = i
		FinSi
	FinPara
	
	si pos <> 0 Entonces
		Escribir "El numero ", buscado, " se encuentra en la posicion ", pos
	SiNo
		Escribir "El numero ", buscado, " no se encuentra"
	FinSi
	
	escribir Sin Saltar "el vector es: "
	para i = 1 Hasta 5 Hacer
		escribir Sin Saltar vector[i]
		si i < 5 Entonces
			escribir Sin Saltar ", "
		FinSi
	FinPara
	Escribir ""
FinSubProceso


//===================================================================
// EJERCICIO 2: busqueda lineal de nombres
//===================================================================
SubProceso ejercicio2
	definir vector, buscado Como Caracter
	definir i, pos Como Entero
	dimension vector[5]
	
	escribir "ingrese cinco nombres para cargar el vector"
	para i = 1 Hasta 5 Hacer
		escribir "ingrese el nombre ", i, ":"
		leer vector[i]
	FinPara
	
	Limpiar Pantalla
	escribir "ingrese el nombre a buscar: "
	leer buscado
	
	pos = 0 // no se encontro
	
	//comparo en minusculas para que "Ana" y "ana" sean iguales
	para i = 1 Hasta 5 Hacer
		si Minusculas(vector[i]) = Minusculas(buscado) y pos = 0 Entonces
			pos = i
		FinSi
	FinPara
	
	si pos <> 0 Entonces
		Escribir "El nombre ", buscado, " se encuentra en la posicion ", pos
	SiNo
		Escribir "El nombre ", buscado, " no se encuentra"
	FinSi
	
	escribir Sin Saltar "el vector es: "
	para i = 1 Hasta 5 Hacer
		escribir Sin Saltar vector[i]
		si i < 5 Entonces
			escribir Sin Saltar ", "
		FinSi
	FinPara
	Escribir ""
FinSubProceso


//===================================================================
// EJERCICIO 3: busqueda lineal y contar repeticiones
//===================================================================
SubProceso ejercicio3
	definir vector, i, buscado, cantidad Como Entero
	dimension vector[5]
	
	escribir "ingrese cinco numeros para cargar el vector"
	para i = 1 Hasta 5 Hacer
		escribir "ingrese el elemento ", i, ":"
		leer vector[i]
	FinPara
	
	Limpiar Pantalla
	escribir "ingrese el numero a buscar: "
	leer buscado
	
	cantidad = 0 // contador de repeticiones
	
	para i = 1 Hasta 5 Hacer
		si vector[i] = buscado Entonces
			cantidad = cantidad + 1
		FinSi
	FinPara
	
	si cantidad > 0 Entonces
		Escribir "El numero ", buscado, " se repite ", cantidad, " veces"
	SiNo
		Escribir "El numero ", buscado, " no se encuentra"
	FinSi
	
	escribir Sin Saltar "el vector es: "
	para i = 1 Hasta 5 Hacer
		escribir Sin Saltar vector[i]
		si i < 5 Entonces
			escribir Sin Saltar ", "
		FinSi
	FinPara
	Escribir ""
FinSubProceso


//===================================================================
// EJERCICIO 4: notas de alumnos (tabla ordenada y notas repetidas)
//===================================================================
SubProceso ejercicio4
	definir nombres, aux_nombre Como Caracter
	definir notas, aux_nota Como Real
	definir n, i, j, cant, espacios, k Como Entero
	definir hayRepetidas, seguir Como Logico
	
	escribir "cantidad de alumnos: "
	leer n
	dimension nombres[n], notas[n]
	
	//carga de datos
	para i = 1 Hasta n Hacer
		escribir "nombre del alumno ", i, ":"
		leer nombres[i]
		escribir "nota de ", nombres[i], ":"
		leer notas[i]
	FinPara
	
	//ordenar de menor a mayor (burbuja), moviendo nota y nombre juntos
	para i = 1 Hasta n-1 Hacer
		para j = 1 Hasta n-i Hacer
			si notas[j] > notas[j+1] Entonces
				aux_nota = notas[j]
				notas[j] = notas[j+1]
				notas[j+1] = aux_nota
				
				aux_nombre = nombres[j]
				nombres[j] = nombres[j+1]
				nombres[j+1] = aux_nombre
			FinSi
		FinPara
	FinPara
	
	//mostrar tabla
	Limpiar Pantalla
	escribir "TABLA DE NOTAS ORDENADAS"
	escribir "-------------------------------"
	escribir "N° | Alumno          | Nota"
	escribir "-------------------------------"
	para i = 1 Hasta n Hacer
		escribir Sin Saltar i
		si i < 10 Entonces
			escribir Sin Saltar " "
		FinSi
		escribir Sin Saltar " | ", nombres[i]
		//rellena con espacios para alinear la columna de notas
		espacios = 15 - Longitud(nombres[i])
		para k = 1 Hasta espacios Hacer
			escribir Sin Saltar " "
		FinPara
		escribir " | ", notas[i]
	FinPara
	escribir "-------------------------------"
	
	//notas repetidas (al estar ordenadas, las iguales quedan juntas)
	escribir ""
	escribir "NOTAS REPETIDAS:"
	hayRepetidas = Falso
	i = 1
	Mientras i <= n Hacer
		cant = 1
		j = i + 1
		seguir = Verdadero
		Mientras seguir Hacer
			si j > n Entonces
				seguir = Falso
			SiNo
				si notas[j] = notas[i] Entonces
					cant = cant + 1
					j = j + 1
				SiNo
					seguir = Falso
				FinSi
			FinSi
		FinMientras
		si cant > 1 Entonces
			escribir "La nota ", notas[i], " se repite ", cant, " veces"
			hayRepetidas = Verdadero
		FinSi
		i = j // salta al siguiente grupo de notas distintas
	FinMientras
	
	si no hayRepetidas Entonces
		escribir "No hay notas repetidas"
	FinSi
FinSubProceso


//===================================================================
// EJERCICIO 5: verificador de tarjetas (algoritmo de Luhn)
//===================================================================
SubProceso ejercicio5
	definir nrotarjeta, tarjetaaux, digitoverificador, i, resto, cont, decena, unidad, suma Como Entero
	definir num Como Real
	dimension tarjetaaux[15], nrotarjeta[16]
	
	//carga de los 16 digitos, solo enteros del 0 al 9
	cont = 1
	Mientras cont <= 16 Hacer
		Repetir
			Escribir "ingrese los 16 nros de su tarjeta para validarla"
			Escribir "ingrese el numero ", cont, ":"
			Leer num
			
			Si num < 0 O num > 9 O num <> Trunc(num) Entonces
				Escribir "Error. Solo se permiten numeros enteros del 0 al 9."
			FinSi
		Hasta Que num >= 0 Y num <= 9 Y num = Trunc(num)
		
		nrotarjeta[cont] = num
		cont = cont + 1
		Limpiar Pantalla
	FinMientras
	
	//muestro el nro ingresado
	Escribir "el nro de tarjeta ingresado es:"
	para i = 1 Hasta 16 Hacer
		Escribir Sin Saltar nrotarjeta[i]
		si i < 16 Entonces
			Escribir Sin Saltar ","
		FinSi
	FinPara
	Escribir ""
	
	//guardo el digito verificador
	digitoverificador = nrotarjeta[16]
	
	//primeros 15 digitos: los de posicion impar se duplican
	para i = 1 Hasta 15 Hacer
		tarjetaaux[i] = nrotarjeta[i]
		
		Si i Mod 2 <> 0 Entonces
			tarjetaaux[i] = nrotarjeta[i] * 2
			
			//si quedo de dos cifras, se suman sus digitos
			si tarjetaaux[i] > 9 Entonces
				decena = Trunc(tarjetaaux[i] / 10)
				unidad = tarjetaaux[i] Mod 10
				tarjetaaux[i] = decena + unidad
			FinSi
		FinSi
	FinPara
	
	Escribir "el nuevo vector es:"
	para i = 1 Hasta 15 Hacer
		Escribir Sin Saltar tarjetaaux[i]
		si i < 15 Entonces
			Escribir Sin Saltar ","
		FinSi
	FinPara
	Escribir ""
	
	//suma de los 15 valores
	suma = 0
	para i = 1 Hasta 15 Hacer
		suma = suma + tarjetaaux[i]
	FinPara
	Escribir "la suma es: ", suma
	
	//validacion
	resto = suma Mod 10
	si (10 - resto) Mod 10 <> digitoverificador Entonces
		Escribir "El nro de tarjeta ingresado es incorrecto"
	SiNo
		Escribir "El nro de tarjeta ingresado es valido"
	FinSi
FinSubProceso


//===================================================================
// EJERCICIO 6: metodo Cesar (encriptar / desencriptar)
//===================================================================
SubProceso ejercicio6
	definir texto, salida Como Caracter
	definir clave, opcion Como Entero
	
	Escribir "1 - Encriptar"
	Escribir "2 - Desencriptar"
	Escribir "Elija una opcion:"
	Leer opcion
	
	Escribir "Ingrese el texto:"
	Leer texto
	Escribir "Ingrese la clave (numero entero):"
	Leer clave
	Limpiar Pantalla
	
	Segun opcion Hacer
		1:
			salida = cifrar(texto, clave)
			Escribir "Texto cifrado: ", salida
		2:
			salida = descifrar(texto, clave)
			Escribir "Texto descifrado: ", salida
		De Otro Modo:
			Escribir "Opcion invalida"
	FinSegun
FinSubProceso


//===================================================================
// EJERCICIO 7: factura de productos
//===================================================================
SubProceso ejercicio7
	definir producto Como Caracter
	definir pu, subtotal, total, iva, totalconiva, promedio, menor, mayor Como Real
	definir cant, i, posmenor, posmayor Como Entero
	dimension producto[5], pu[5], cant[5], subtotal[5]
	
	//carga de los 5 productos
	para i = 1 Hasta 5 Hacer
		escribir "producto numero ", i, ":"
		leer producto[i]
		escribir "precio unitario:"
		leer pu[i]
		escribir "cantidad:"
		leer cant[i]
		subtotal[i] = pu[i] * cant[i]
		Limpiar Pantalla
	FinPara
	
	//tabla de la factura
	Escribir "================= FACTURA ================="
	Escribir "Producto | PU | Cantidad | Subtotal"
	Escribir "-------------------------------------------"
	para i = 1 Hasta 5 Hacer
		Escribir producto[i], " | $", pu[i], " | ", cant[i], " | $", subtotal[i]
	FinPara
	Escribir "==========================================="
	
	//total, menor y mayor subtotal
	total = 0
	menor = subtotal[1]
	mayor = subtotal[1]
	posmenor = 1
	posmayor = 1
	para i = 1 Hasta 5 Hacer
		total = total + subtotal[i]
		si subtotal[i] < menor Entonces
			menor = subtotal[i]
			posmenor = i
		FinSi
		si subtotal[i] > mayor Entonces
			mayor = subtotal[i]
			posmayor = i
		FinSi
	FinPara
	
	promedio = total / 5
	iva = total * 0.21
	totalconiva = total + iva
	
	Escribir "Total sin IVA: $", total
	Escribir "IVA (21%): $", iva
	Escribir "Total con IVA: $", totalconiva
	Escribir "Promedio por producto: $", promedio
	Escribir "Menor valor: ", producto[posmenor], " con $", menor
	Escribir "Mayor valor: ", producto[posmayor], " con $", mayor
	
	si totalconiva > 100000 Entonces
		Escribir "ATENCION: saldo insuficiente, la compra supera $100000"
	FinSi
FinSubProceso


//===================================================================
// EJERCICIO 8: buscar un numero en la matriz (3 intentos)
//===================================================================
SubProceso ejercicio8
	definir matriz, i, j, num, cantidad, intento Como Entero
	definir acerto Como Logico
	dimension matriz[3,3]
	
	//carga con valores aleatorios del 1 al 10 (oculta)
	para i = 1 Hasta 3 Hacer
		para j = 1 Hasta 3 Hacer
			matriz[i,j] = azar(10) + 1
		FinPara
	FinPara
	
	Escribir "Se genero una matriz de 3x3 con numeros del 1 al 10."
	Escribir "Tenes 3 intentos para encontrar un numero que este en la matriz."
	
	intento = 0
	acerto = Falso
	
	Repetir
		intento = intento + 1
		Escribir ""
		Escribir "Intento ", intento, " de 3 - ingrese el numero a buscar:"
		leer num
		
		cantidad = 0
		para i = 1 Hasta 3 Hacer
			para j = 1 Hasta 3 Hacer
				si matriz[i,j] = num Entonces
					cantidad = cantidad + 1
					Escribir "Se encontro el numero en la posicion (fila ", i, ", columna ", j, ")"
				FinSi
			FinPara
		FinPara
		
		si cantidad > 0 Entonces
			acerto = Verdadero
			Escribir "Muy bien! El numero ", num, " aparece ", cantidad, " vez/veces"
		SiNo
			Escribir "El numero ", num, " no se encuentra en la matriz"
		FinSi
	Hasta Que acerto O intento = 3
	
	si acerto Entonces
		Escribir "Ganaste en el intento ", intento
	SiNo
		Escribir "Te quedaste sin intentos"
	FinSi
	
	//revelo la matriz al final
	Escribir ""
	Escribir "La matriz era:"
	para i = 1 Hasta 3 Hacer
		para j = 1 Hasta 3 Hacer
			Escribir Sin Saltar matriz[i,j], " "
		FinPara
		Escribir ""
	FinPara
FinSubProceso


//===================================================================
// EJERCICIO 9: sumar dos matrices
//===================================================================
SubProceso ejercicio9
	definir matrizA, matrizB, matrizC Como Real
	definir i, j Como Entero
	dimension matrizA[2,2], matrizB[2,2], matrizC[2,2]
	
	//carga de la matriz A
	Escribir "Carga de la matriz A"
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			Escribir "Ingrese un numero para la posicion [", i, ",", j, "]:"
			leer matrizA[i,j]
		FinPara
	FinPara
	
	//carga de la matriz B
	Escribir "Carga de la matriz B"
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			Escribir "Ingrese un numero para la posicion [", i, ",", j, "]:"
			leer matrizB[i,j]
		FinPara
	FinPara
	
	//suma A + B
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			matrizC[i,j] = matrizA[i,j] + matrizB[i,j]
		FinPara
	FinPara
	
	//muestro las tres matrices
	Limpiar Pantalla
	Escribir "Matriz A:"
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			Escribir Sin Saltar matrizA[i,j], "   "
		FinPara
		Escribir ""
	FinPara
	
	Escribir "Matriz B:"
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			Escribir Sin Saltar matrizB[i,j], "   "
		FinPara
		Escribir ""
	FinPara
	
	Escribir "Matriz C = A + B:"
	para i = 1 Hasta 2 Hacer
		para j = 1 Hasta 2 Hacer
			Escribir Sin Saltar matrizC[i,j], "   "
		FinPara
		Escribir ""
	FinPara
FinSubProceso


//===================================================================
// EJERCICIO 10: contar elementos pares en una matriz 3x3
//===================================================================
SubProceso ejercicio10
	definir matriz, i, j, cont Como Entero
	dimension matriz[3,3]
	
	//carga de la matriz, una pregunta por fila
	escribir "Carga de la matriz 3x3"
	para i = 1 Hasta 3 Hacer
		escribir "Fila ", i, ":"
		para j = 1 Hasta 3 Hacer
			escribir Sin Saltar "  columna ", j, ": "
			leer matriz[i,j]
		FinPara
	FinPara
	
	//muestro la matriz
	Limpiar Pantalla
	escribir "Matriz original:"
	para i = 1 Hasta 3 Hacer
		para j = 1 Hasta 3 Hacer
			escribir sin saltar matriz[i,j], " "
		FinPara
		escribir ""
	FinPara
	
	//cuento los pares y muestro en que posicion estan
	cont = 0
	escribir ""
	escribir "Numeros pares encontrados:"
	para i = 1 Hasta 3 Hacer
		para j = 1 Hasta 3 Hacer
			si matriz[i,j] mod 2 = 0 Entonces
				cont = cont + 1
				escribir "El ", matriz[i,j], " esta en la posicion [", i, ",", j, "]"
			FinSi
		FinPara
	FinPara
	
	escribir ""
	si cont > 0 Entonces
		escribir "Existen en la matriz ", cont, " numeros pares"
	SiNo
		escribir "No hay numeros pares en la matriz"
	FinSi
FinSubProceso
