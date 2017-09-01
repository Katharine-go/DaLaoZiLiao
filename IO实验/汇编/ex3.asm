.8086
.MODEL SMALL  
.DATA   
ORG 100H
STR BYTE 50,0,50 DUP(30H),'$'
STR1 BYTE 'It is NOT a palindrom','$'
STR2 BYTE 'It is a palindrome','$'
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
          
        MOV BL,STR[1];�����ַ�����ʵ�ʳ���
        LEA SI,STR+1
        LEA DI,STR+2
        AND BH,0
        ADD SI,BX      
        
JUDGE:  MOV AL,[SI]
        CMP AL,[DI]
        JNZ P1
        INC DI
        DEC SI
        CMP DI,SI
        JAE P2
        LOOP JUDGE
        
P1:     LEA DX,STR1
        MOV AH,09H
        INT 21H
        JMP DONE 
        
P2:     LEA DX,STR2
        MOV AH,09H
        INT 21H      
      
DONE:   MOV AH,4CH
        INT 21H 
        
END  START