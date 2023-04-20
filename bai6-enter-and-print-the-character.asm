; nhap mot ki tu va xuat ki tu do ra tren man hinh 

.model small
.stack 100
.data 
    msg1 db ' moi nhap mot ki tu : $' 
    msg2 db 13, 10, 'ky tu da nhap la : $'
    msg3 db ? ; khoi tao bien ki tu khong co gia tri ban dau 
    
.code 
main proc 
    mov ax, @data ; khoi dau thanh ghi ds
    mov ds, ax ; tro thanh ghi ds ve dau doan data
    
    ; hien thi ra man hinh thong bao nhap kitu
    mov ah, 9 ; lenh goi ham 09h cua ngat int 21h
    lea dx, msg1 ; dua con tro toi dia chi cua msg1
    int 21h 
    
    ; nhap vao 1 ki tu cua ban phim 
    mov ah, 1 ; ham ngat 01h cua ngat int 21h 
              ; ham ngat 01h dung de doc mot ki tu tu ban phim
    int 21h   ; gia tri vua nhap luc nay dang duoc luu o AL
    mov msg3, al; gan gia tri vua nhap vao bien ki tu   
    
    ; hien thi ra man hinh thong bao ky tu da nhap
    mov ah, 9 
    lea dx, msg2
    int 21h
    
    ; hien thi ki tu da nhap 
    mov ah, 2 ; ham ngat 02h cua ngat int 21h 
              ; ham ngat 02h dung de hien mot ki tu len man hinh 
    mov dl, msg3 ; hien thi ra man hinh ki tu da luu o DL
    int 21h
    
    ; tro ve dos dung ham 4ch cua ngat int 21h 
    mov ah, 4ch 
    int 21h 
    
main endp
end