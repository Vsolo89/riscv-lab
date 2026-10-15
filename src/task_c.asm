# Задание (в): Программа заполняет массив из (16+n) целых чисел значениями
# со стандартного ввода. Чтение прекращается, когда:
#   - считаны все (16+n) значений, ИЛИ
#   - считано значение 0


.data
N_STUDENT:   .word 21
ARRAY_SIZE:  .word 37             

array:       .space 148           

prompt:      .asciz "Введите число (0 - для остановки): "
msg_header:  .asciz "\nЗаполненный массив (количество элементов: "
msg_mid:     .asciz "):\n"
newline:     .asciz "\n"
space:       .asciz " "
msg_stop:    .asciz "\nЧтение остановлено: введён 0.\n"
msg_full:    .asciz "\nЧтение остановлено: массив заполнен полностью.\n"

.text
.globl main

main:
    la   s0, array           
    la   t3, ARRAY_SIZE
    lw   s1, 0(t3)           
    li   s2, 0               

read_loop:
    bge  s2, s1, loop_full   

    li   a7, 4               
    la   a0, prompt
    ecall

    li   a7, 5               
    ecall
    mv   t0, a0              

    beqz t0, loop_zero       

    
    slli t1, s2, 2           
    add  t1, s0, t1          
    sw   t0, 0(t1)

    addi s2, s2, 1           
    j    read_loop

loop_zero:
    li   a7, 4
    la   a0, msg_stop
    ecall
    j    print_array

loop_full:
    li   a7, 4
    la   a0, msg_full
    ecall

print_array:
    
    li   a7, 4
    la   a0, msg_header
    ecall

    li   a7, 1               
    mv   a0, s2
    ecall

    li   a7, 4
    la   a0, msg_mid
    ecall

    li   t2, 0               

print_loop:
    bge  t2, s2, end_program 

    slli t1, t2, 2
    add  t1, s0, t1
    lw   a0, 0(t1)
    li   a7, 1               
    ecall

    li   a7, 4
    la   a0, space
    ecall

    addi t2, t2, 1
    j    print_loop

end_program:
    li   a7, 4
    la   a0, newline
    ecall

    li   a7, 10               
    ecall
