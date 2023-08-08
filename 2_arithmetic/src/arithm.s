.text
.global _square
.align 4
_square:
  mul x0, x0, x0
  ret

.global _my_pow
_my_pow:
  cmp x1, 0 ; check if second arg is 0
  beq exponent_is_one ; if so, return 1

  mov x2, x0 ; set x2 equal to the first arg
  mov x3, x1 ; set x3 equal to the second arg
pow_loop:
  cmp x3, #1
  beq pow_loop_end
  sub x3, x3, #1
  mul x2, x2, x0
  b pow_loop
pow_loop_end:
  mov x0, x2
  ret
exponent_is_one:
  mov x0, #1 ; set x0 to 1
  ret
  
.global _arithm_mean
_arithm_mean:
  mov x2, x1 ; x2 = sizeof array
  mov x3, #0 ; x3 = 0, later contains the mean 
  mov x4, x0 ; x4 = address of array
  mov x5, #0 ; x5 = offset into array
arithm_loop:
  cmp x2, #0
  beq arithm_loop_end ; if all elements have been added, exit loop
  ldr x6, [x4] ; x6 = value of current element
  add x3, x3, x6 ; x3 += x6
  add x4, x4, #8 ; x4 = address of current element
  sub x2, x2, #1 ; decrement x2 
  b arithm_loop
arithm_loop_end:
  mov x0, x3 ; x0 = x3
  sdiv x0, x0, x1 ; x0 = x3 / x1
  ret
  
  
