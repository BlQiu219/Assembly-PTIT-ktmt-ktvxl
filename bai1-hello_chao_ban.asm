
; Hien thi loi chao tieng anh va tieng viet tren emu86 
; in ra hai chuoi 

; cau truc cua mot bai code tren emu86 
.model small ; chuong trinh chon bo nho small
.stack 100   ; kich thuoc cua ngan xep bo nho la 100byte
.data        ; cac dong ben duoi data la khai bao 
    crlf db 13, 10, '$' ; ki tu xuong dong va lui vao dau dong 
    msg1 db 'chao tay$'
    msg2 db 'chao ta$'


.code 
main proc 
    ; khoi tao thanh ghi DS
    mov ax, @data  ; khoi dau thanh ghi ds
    mov ds, ax     ; tro thanh ghi ds ve dau doan data
    
    
    ; hien thi loi chao dung ham 09h cua ngat int 21h
    mov ah, 9 ; lenh goi ham 09h cua ngat int 21h la in ra mot xau ki tu
    lea dx, msg1 ; lenh in ra chuoi msg1
    int 21h ; chao tay
    
    lea dx, crlf ; lenh in ra dau enter va lui vao dau dong 
    int 21h 
    
    ; hien thi loi chao dung ham 09h cua ngat int 21h 
    lea dx, msg2 ; lenh in ra chuoi msg2
    int 21h      ; chao ta
    
    ; tro ve dos dung ham 4ch cua ngat int 21h
    mov ah, 4ch 
    int 21
    
main endp 
end 