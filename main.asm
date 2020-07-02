;*******************************************************************************
;    Nombre del archivo - main.asm                                             *
;    Autor: Santiago Sempé                                                                   *
;    Descripción:                                                              *
;        Este es un programa ejemplo que define los bits de configuración y    *
;        utiliza variables.                                                    *
;    Consignas:                                                                *
;        Escribir nombre y apellido en este encabezado.                        *
;        Compilar y simular el programa para completar la tabla de la pág. 29. *
;        Reemplazar las direcciones escritas 0x20, 0x21 y 0x22 por variables.  *
;*******************************************************************************
#include <p16f887.inc>

; Bits de configuración ********************************************************
; Están en formato hexadecimal para ocupar menos espacio en el archivo.
        __config _CONFIG1, 0x20F1       ; FOSC = XT, WDTE = OFF, MCLRE = ON
        __config _CONFIG2, 0x3FFF

; Definición de variables ******************************************************
; Típicamente se elije 0x20 ya que es la primera dirección disponible de GPRs.
        cblock  0x20			; Dirección de almacenamiento de datos
	variable1
	variable2
	variable3
        endc
	
;*******************************************************************************
;    Inicio del programa                                                       *
;*******************************************************************************
        org     0x00                    ; Vector de reset
        nop
        goto    main

; Rutina principal - main ******************************************************
; Todos los programas contienen una rutina principal. Dentro de la misma siempre
; existe una sección de código que se ejecuta sólo al inicio, llamada
; inicialización y otra sección que debe repetirse una y otra vez durante el 
; funcionamiento normal, conocida como super loop o main loop.
main    bcf     STATUS,RP0
        bcf     STATUS,RP1              ; Paso al banco 0
        movlw   d'5'
        movwf   variable1
        addlw   d'3'
        movwf   variable2
        bsf     STATUS,RP0              ; Paso al banco 1
        movlw   d'2'
        movwf   variable1
        addlw   d'4'
        movwf   variable2
        bsf     STATUS,RP1              ; Paso al banco 3
        movlw   d'1'
        movwf   variable3

main_loop
        goto    main_loop               ; Super loop
	
;*******************************************************************************
;    Fin del programa                                                          *
;*******************************************************************************
        end


