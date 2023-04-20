; doc tu ban phim mot he so hai 
; ket qua doc duoc de tai thanh ghi bx 
; in bx ra man hinh

.model small
.stack 100
.data
    msg1 db 10, 13, ' go vao 1 so he 2: $'
    crlf db 10, 13, '$'
    
.code 
main proc 
    ;khoi tao thanh ghi DS
    mov ax, @data
    mov ds, ax
    
    ; hien thi thong bao nhap ra man hinh 
    mov ah, 9
    lea dx, msg1
    int 21h 
    xor bx, bx ; dung BX de chua ket qua 
               ; ban dau la 0
    mov ah, 1 ; doc mot so tu ban phim 
doc: int 21h
     cmp al, 13 ; so sanh al 
                ; neu gap phai enter thi se ket thuc 
     je thoidoc ; neu dung thi thoidoc 
     and al, 0fh ; neu sai thi doi ma ascii ra so 
     shl bx, 1 ; dich trai bx 1 bit de lay so 
     or bl, al ; chen bit vua doc vao ket qua 
     jmp doc ; doc tiep mot ki tu tiep theo
     thoidoc: mov cx, 16 ; cx chua so bit cua bx
     mov ah, 9
     lea dx, crlf 
     int 21h
     mov ah, 2 ; hien ki tu
     
hien: xor dl, dl ; xoa dl de cbi doi 
      rol bx, 1 ; dua bit MSB cua BX sang CF
      adc dl, 30h ; doi gia tri cua bit do qua ascii 
      int 21h ; hien thi mot bit cua bx
      loop hien ; lap lai cho het 16bit
      
      ; ve dos
      mov ah, 4ch
      int 21h
      
main endp
end