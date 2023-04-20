;hien thi ra loi chao bang tieng anh va tieng viet tren emu8086
;nhap vao mot so 
;2 chuoi cach nhau dung bang so do 

.model small
.stack 100
.data   
    crlf db 13, 10 ,'$'
    msg1 db 'hello$'
    msg2 db 'chao ban$'
    msg3 db 'go vao so dong cach: $'
    msg4 db ?
    
.code 
main proc 
    ; khoi tao thanh ghi DS
    mov ax, @data  
    mov ds, ax 
    
    ; hien thi yeu cau nhap so dong cach ra man hinh(msg3) 
    mov ah, 9 
    lea dx, msg3
    int 21h 
    
    ; nhap vao so dong cach 
    mov ah, 1
    int 21h 
    sub al, 30h ; dua vao so dong cach 
               ; nhung ben trong bo ma ascii 
               ; so nhap vao se duoc cong them 30h 
               ; muon lay gia tri chinh xac thi phai tru(sub) di 30
    mov msg4, al ; gan gia tri vua nhap vao bien ki tu 
    
    ; hien thi loi chao tieng anh
    mov ah, 9 
    lea dx, crlf
    int 21h
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ; cach dong 
    lea dx, crlf    
    xor cx, cx  ; cac cap bit giong nhau thi deu bang 0
    mov cl, msg4  ; cx chua so dong cach (cu the la ben trong cl>
    lap: int 21h  
    loop lap 
    
    ; hien thi loi chao bang tieng viet 
    lea dx, msg2
    int 21h  
    
    ; tra ve dos 
    mov ah, 4ch
    int 21h 
    
main endp 
end main 