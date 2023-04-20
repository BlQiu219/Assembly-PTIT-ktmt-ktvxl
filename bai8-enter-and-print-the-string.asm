; nhap mot chuoi ki tu 
; in ra man hinh chuoi do 

.model small
.stack 100
.data
    msg1 DB ' -> $' 
    msg2 DB 100 dup('$') ;
.code
main proc
        ;khoi tao thanh ghi ds
        mov ax, @data
        mov ds,ax  
          
        ;nhap chuoi ky tu
        mov ah,10 ;  
        lea dx,msg2 ; tro den dia chi dau str
        int 21h 
        
        mov  ah, 9   
        lea dx, msg1 
        int 21h  
            
        
        lea dx, msg2 +2      
        int 21h  
        
        mov ah,4CH
        int 21h    
    main endp
 end