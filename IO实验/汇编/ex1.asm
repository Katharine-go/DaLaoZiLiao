.8086
.MODEL SMALL  
.DATA   
ORG 100H
STR BYTE 20,0,20 DUP(20H)
.CODE  
START:  MOV  AX,@DATA
        MOV  DS,AX
        
        LEA  DX,STR
        MOV  AH,0AH
        INT  21H;�����ַ���
        
        MOV AH,02H   
        MOV DL,0AH
        INT  21H;�������  
        
        MOV DL,0DH   
        MOV AH,02H
        INT 21H;����س�  
        
        MOV BL,STR[1] 
        MOV BH,0   
        MOV BYTE PTR STR[BX+2],'$'  
        LEA DX,STR+2     
        MOV AH,09H   
        INT 21H;����ַ���
        
        MOV AH,4CH     
        INT 21H 
END  START