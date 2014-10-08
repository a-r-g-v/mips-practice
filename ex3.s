	.data
str:	.asciiz	"sum = "
items:	.word	0x59, 0x3, 0xc8, 0xbd6, 0x443, 0x3e6, 0xf, 0x1e, 0x13f05, 0x150
	.text
	.globl main
main:	add	$t0,	$0,	$0
	add	$t1,	$0,	$0
	la	$t2,	items
loop:	lw	$t3,	($t2)
	add	$t1,	$t1,	$t3
	addi	$t2,	$t2,	4
	addi	$t0,	$t0,	1
	blt	$t0,	10,	loop
	
	li	$v0,	4
	la	$a0,	str
	syscall
	li	$v0,	1
	move	$a0,	$t1
	syscall
	jr	$ra
