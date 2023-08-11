.arch armv8-a

.text
.align 2
.global _shell
_shell:
  mov x16, #59
  adr x0, path
  mov x1, xzr
  mov x2, xzr

  svc #0x80
  ret

path: .asciz "/bin/bash"

