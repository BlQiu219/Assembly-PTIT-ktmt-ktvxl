; nhap mot ki tu thuong 
; chuyen thanh ki tu hoa 

.model small 
.stack 100
.data
    mgs1 db ' -> $'
    mgs2 db ?,'$'

.code 
main proc 
    ; khoi dau thanh ghi ds
    mov ax, @data 
    mov ds, ax
    
    ; nhap vao mot ki tu thuong 
    
    mov ah, 1 ; luu ki tu o al
    int 21h 
    ; doi thanh ki tu hoa bang cach tru di 20h
    ; < xem giai thich o bang ma ascii>
    sub al, 20h   
    mov mgs2, al ; luu gia tri vua chuyen doi o AL vao msg2
    
    ; in ra thong bao chuyen doi 
    mov ah, 9
    lea dx, mgs1
    int 21h
    
    ; in ra ki tu 
    mov ah, 9
    lea dx, mgs2
    int 21h
    
    ; tro ve dos
    mov ah, 4ch 
    int 21h 
    
main endp
end