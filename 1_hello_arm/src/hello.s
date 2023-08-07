.arch armv8-a
.text
.global _say_hello
.align 2

_say_hello:
  mov x0, #1
  adr x1, greeting
  mov x2, #14
  mov x16, #4
  svc #0x80

  mov x0, #0
  mov x16, #1
  svc #0x80


greeting: .ascii "Hello, World!\n"
