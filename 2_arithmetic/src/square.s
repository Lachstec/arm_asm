.text
.global _square
.align 2
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
  

