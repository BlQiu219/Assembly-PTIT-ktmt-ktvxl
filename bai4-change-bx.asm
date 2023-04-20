; 1234h -> 3241h

.Model Small
.Stack 100
.code
main proc 
    mov bx, 1234h ; gan bx = 1234
    mov cl, 4
    rol bx, cl  ; quay bx di 4bit 
    mov cl, 5
    ror bh, cl  ; trao doi 4 bit thap va cao cua bh 
                ; bx = 3241
    ; tro ve dos
    mov ah, 4ch 
    int 21h
main endp 
end