# Задание (б): Программа принимает целое число x и выводит все значения
# в диапазоне min(x, y)...max(x, y) с шагом h.
#   y = номер группы    = 121
#   h = номер студента в группе = 21


.data
Y_GROUP: .word 121         
H_STEP:  .word 21          

prompt_x:    .asciz "Введите число x: "
msg_range:   .asciz "Диапазон значений: "
space:       .asciz " "
newline:     .asciz "\n"
msg_bad_h:   .asciz "Ошибка: шаг h должен быть положительным числом.\n"

.text
.globl main

main:
    
    li   a7, 4
    la   a0, prompt_x
    ecall

    li   a7, 5                
    ecall
    mv   t0, a0               

    
    la   t1, Y_GROUP
    lw   t1, 0(t1)             
    la   t2, H_STEP
    lw   t2, 0(t2)             

    blez t2, bad_step          

    
    blt  t0, t1, x_is_min
    
    mv   t3, t1                
    mv   t4, t0                
    j    print_range

x_is_min:
    
    mv   t3, t0                
    mv   t4, t1                

print_range:
    li   a7, 4
    la   a0, msg_range
    ecall

    mv   t5, t3                 

loop:
    bgt  t5, t4, end_loop        

    mv   a0, t5
    li   a7, 1                  
    ecall

    li   a7, 4
    la   a0, space
    ecall

    add  t5, t5, t2              
    j    loop

end_loop:
    li   a7, 4
    la   a0, newline
    ecall
    j    exit_program

bad_step:
    li   a7, 4
    la   a0, msg_bad_h
    ecall

exit_program:
    li   a7, 10                  
    ecall
