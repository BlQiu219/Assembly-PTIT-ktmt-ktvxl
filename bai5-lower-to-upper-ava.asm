; cho mot chuoi ki tu co san 
; chuyen chuoi ki tu sang chu hoa 
; in chuoi do ra man hinh 

.model small
.stack 100
.data   
    mgs1 db 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'
    mgs2 db 'chuoi da duoc doi : '
    mgs3 db 8 DUP(0)
    db '$'
    
.code 
main proc 
    ; khoi tao thanh ghi ds va es
    mov ax, @data 
    mov ds, ax
    mov es, ax
    ; si tro vao chuoi cu 
    lea si, mgs1+7
    ; di tro vao chuoi moi
    lea di, mgs3+7
    std  ; dinh huong lui
    mov cx, 8 ; cx chua so byte phai doi 
    
lap: lodsb ; ham lay mot ki tu cua chuoi cu 
     sub al, 20h ; doi thanh chu hoa 
     stosb ; dua ki tu vao chuoi moi 
     loop lap ; lap cho den het 
     
     ; hien thi ra man hinh 
     
     mov ah, 9
     lea dx, mgs2
     int 21h
     
     ; tro ve dos
     mov ah, 4ch 
     int 21h 
     
main endp
end