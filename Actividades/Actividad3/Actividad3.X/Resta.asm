;Mascara PB=PA-8
    ;CORRIMIENTO DE BITS POR PIN DE ENTRADA
    LIST P=18F4550
    #INCLUDE<P18F4550.INC>
    
    ;PALABRA DE CONFIGURACION
    
   CTE	    EQU	    .8
   DATOA    EQU	    .10

	   ORG	.0
CONFIGU	    ;LIMPIAR ENTRADAS
	    CLRF	TRISB
	    CLRF	PORTB
	    CLRF	LATB
	    MOVLW	.15
	    MOVWF	ADCON1
	    MOVLW	.7
	    MOVWF       CMCON
	    ;LIMPIAR ENTRADAS
	    SETF        TRISA
	    CLRF	PORTA
	    CLRF	LATA
	   
MASK	
	;EJECUTAR OPERACIONES
	MOVFF	PORTA,DATOA
	RRNCF	DATOA,F
	RRNCF	DATOA,F
	RRNCF	DATOA,F
	RRNCF	DATOA,F
	MOVLW	B'000000011'
	ANDWF	DATOA,F
	MOVLW	CTE
	SUBWF	DATOA,F
	MOVFF	DATOA,PORTB
	GOTO	MASK
	END 