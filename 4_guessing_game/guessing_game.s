.arch armv8-a
.global _start
.align 2

.text
_start:
  bl _rng_middle_square ; generate random number
  adrp x1, answer@page ; load address of answer
  add x1, x1, answer@pageoff ; store address to x1
  str x0, [x1] ; store random number to answer
  mov x0, #1 ; x0 = 1 => stdout
  adr x1, greeting
  mov x2, #56 ; length of greeting
  mov x16, #4 ; x16 = 4 => syscall number for write is 4
  svc #0x80 ; syscall to print greeting
game_loop:
  adrp x0, format@page
  add x0, x0, format@pageoff
  adrp x11, guess@page
  add x11, x11, guess@pageoff
  str x11, [sp, #-32]!
  bl _scanf
  add sp, sp, #16
  adrp x0, answer@page
  add x0, x0, answer@pageoff
  ldr x0, [x0]
  adrp x1, guess@page
  add x1, x1, guess@pageoff
  ldr x1, [x1]
  cmp x0, x1
  beq _exit_program
  bgt incorrect_is_smaller
  blt incorrect_is_bigger
incorrect_is_bigger:
  mov x0, #1 ; x0 = 1 => stdout
  adr x1, incorrect_bigger
  mov x2, #65 ; length of incorrect_bigger
  mov x16, #4 ; x16 = 4 => syscall number for write is 4
  svc #0x80 ; syscall to print incorrect_bigger
  b game_loop
incorrect_is_smaller:
  mov x0, #1 ; x0 = 1 => stdout
  adr x1, incorrect_smaller
  mov x2, #66 ; length of incorrect_smaller
  mov x16, #4 ; x16 = 4 => syscall number for write is 4
  svc #0x80 ; syscall to print incorrect_smaller
  b game_loop
_exit_program:
  mov x0, #1 ; x0 = 1 => stdout
  adr x1, correct
  mov x2, #40 ; length of correct
  mov x16, #4 ; x16 = 4 => syscall number for write is 4
  svc #0x80 ; syscall to print correct
  mov x0, #0 ; x0 = 0 => exit status
  mov x16, #1 ; x16 = 1 => syscall number for exit is 1
  svc #0x80 ; syscall to exit program
_rng_middle_square:
  mov x0, #876
  mul x0, x0, x0 
  mul x0, x0, x0
  lsr x0, x0, #32
  mov x3, #100
  udiv x1, x0, x3
  mul x2, x1, x3
  sub x0, x0, x2
  ret
  

greeting: .asciz "Welcome to the guessing game!\nPlease enter your guess:\n"
correct: .asciz "Congratulations! You guessed correctly!\n"
incorrect_bigger: .asciz "Sorry, you guessed incorrectly. The number is bigger. Try again:\n"
incorrect_smaller: .asciz "Sorry, you guessed incorrectly. The number is smaller. Try again:\n"

.data
format: .asciz "%ld"
.align 4
guess: .word 64
.align 4
answer: .word 64
