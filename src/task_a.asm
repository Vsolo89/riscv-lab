# Задание (а): Программа принимает целое число x и выводит:
#   1 - если x совпадает с номером студента в списке группы (N = 21)
#   0 - если не совпадает


.data
STUDENT_NUMBER: .word 21          

prompt_x:   .asciz "Введите число x: "
msg_result: .asciz "Результат: "
newline:    .asciz "\n"

.text
.globl main

main:
    li   a7, 4                
    la   a0, prompt_x
    ecall

    li   a7, 5                
    ecall
    mv   t0, a0               

    
    la   t1, STUDENT_NUMBER
    lw   t1, 0(t1)            

    li   t2, 0                
    bne  t0, t1, print_result 
    li   t2, 1                

print_result:
    li   a7, 4                
    la   a0, msg_result
    ecall

    li   a7, 1                
    mv   a0, t2
    ecall

    li   a7, 4
    la   a0, newline
    ecall

    
    li   a7, 10               
    ecall
