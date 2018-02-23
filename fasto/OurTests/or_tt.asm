	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$11, _true
# was:	la	_true_addr, _true
	ori	$10, $0, 4
# was:	ori	_true_init, 0, 4
	sw	$10, 0($11)
# was:	sw	_true_init, 0(_true_addr)
	la	$10, _false
# was:	la	_false_addr, _false
	ori	$11, $0, 5
# was:	ori	_false_init, 0, 5
	sw	$11, 0($10)
# was:	sw	_false_init, 0(_false_addr)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
# Function main
main:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
	jal	getint
# was:	jal	getint, 2
	ori	$16, $2, 0
# was:	ori	_letBind_2_, 2, 0
	jal	getint
# was:	jal	getint, 2
# 	ori	_letBind_3_,2,0
# 	ori	_minus_L_14_,_letBind_2_,0
	ori	$10, $0, 1
# was:	ori	_minus_R_15_, 0, 1
	sub	$10, $16, $10
# was:	sub	_eq_L_11_, _minus_L_14_, _minus_R_15_
	ori	$11, $0, 1
# was:	ori	_zero_13_, 0, 1
	ori	$12, $0, 0
# was:	ori	_and_L_8_, 0, 0
	bne	$10, $11, _false_16_
# was:	bne	_eq_L_11_, _zero_13_, _false_16_
	ori	$12, $0, 1
# was:	ori	_and_L_8_, 0, 1
_false_16_:
	ori	$10, $0, 1
# was:	ori	_one_10_, 0, 1
	ori	$11, $0, 1
# was:	ori	_cond_7_, 0, 1
	beq	$12, $10, true
# was:	beq	_and_L_8_, _one_10_, true
# 	ori	_times_L_20_,_letBind_3_,0
	ori	$12, $0, 2
# was:	ori	_times_R_21_, 0, 2
	mul	$12, $2, $12
# was:	mul	_eq_L_17_, _times_L_20_, _times_R_21_
	ori	$13, $0, 4
# was:	ori	_zero_19_, 0, 4
	ori	$14, $0, 0
# was:	ori	_and_R_9_, 0, 0
	bne	$12, $13, _false_22_
# was:	bne	_eq_L_17_, _zero_19_, _false_22_
	ori	$14, $0, 1
# was:	ori	_and_R_9_, 0, 1
_false_22_:
	beq	$14, $10, true
# was:	beq	_and_R_9_, _one_10_, true
	ori	$11, $0, 0
# was:	ori	_cond_7_, 0, 0
true:
	bne	$11, $0, _then_4_
# was:	bne	_cond_7_, 0, _then_4_
	j	_else_5_
_then_4_:
	ori	$16, $0, 1
# was:	ori	_tmp_23_, 0, 1
# 	ori	_mainres_1_,_tmp_23_,0
	la	$2, _true
# was:	la	2, _true
	bne	$16, $0, _wBoolF_24_
# was:	bne	_mainres_1_, 0, _wBoolF_24_
	la	$2, _false
# was:	la	2, _false
_wBoolF_24_:
	jal	putstring
# was:	jal	putstring, 2
	j	_endif_6_
_else_5_:
	ori	$16, $0, 0
# was:	ori	_tmp_25_, 0, 0
# 	ori	_mainres_1_,_tmp_25_,0
	la	$2, _true
# was:	la	2, _true
	bne	$16, $0, _wBoolF_26_
# was:	bne	_mainres_1_, 0, _wBoolF_26_
	la	$2, _false
# was:	la	2, _false
_wBoolF_26_:
	jal	putstring
# was:	jal	putstring, 2
_endif_6_:
	ori	$2, $16, 0
# was:	ori	2, _mainres_1_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_IllegalArrSizeError_:
	la	$4, _IllegalArrSizeString_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data	
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
_IllegalArrSizeString_:
	.asciiz	"Error: Array size less or equal to 0 at line "
# String Literals
	.align	2
_true:
	.space	4
	.asciiz	"true"
	.align	2
_false:
	.space	4
	.asciiz	"false"
	.align	2
_heap_:
	.space	100000