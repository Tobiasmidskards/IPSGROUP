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
# Function this
this:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_num_1_,2,0
# 	ori	_eq_L_7_,_param_num_1_,0
	ori	$10, $0, 100
# was:	ori	_zero_9_, 0, 100
	ori	$11, $0, 0
# was:	ori	_cond_6_, 0, 0
	bne	$2, $10, _false_10_
# was:	bne	_eq_L_7_, _zero_9_, _false_10_
	ori	$11, $0, 1
# was:	ori	_cond_6_, 0, 1
_false_10_:
	bne	$11, $0, _then_3_
# was:	bne	_cond_6_, 0, _then_3_
	j	_else_4_
_then_3_:
	ori	$2, $0, 97
# was:	ori	_thisres_2_, 0, 97
	j	_endif_5_
_else_4_:
# 	ori	_thisres_2_,_param_num_1_,0
_endif_5_:
# 	ori	2,_thisres_2_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	ori	$10, $0, 4
# was:	ori	_size_reg_13_, 0, 4
	ori	$18, $28, 0
# was:	ori	_letBind_12_, 28, 0
	addi	$11, $10, 3
# was:	addi	_tmp_16_, _size_reg_13_, 3
	sra	$11, $11, 2
# was:	sra	_tmp_16_, _tmp_16_, 2
	sll	$11, $11, 2
# was:	sll	_tmp_16_, _tmp_16_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	$28, $28, $11
# was:	add	28, 28, _tmp_16_
	sw	$10, 0($18)
# was:	sw	_size_reg_13_, 0(_letBind_12_)
	addi	$11, $18, 4
# was:	addi	_addr_reg_14_, _letBind_12_, 4
	ori	$10, $0, 100
# was:	ori	_tmp_reg_15_, 0, 100
	sb	$10, 0($11)
# was:	sb	_tmp_reg_15_, 0(_addr_reg_14_)
	addi	$11, $11, 1
# was:	addi	_addr_reg_14_, _addr_reg_14_, 1
	ori	$10, $0, 99
# was:	ori	_tmp_reg_15_, 0, 99
	sb	$10, 0($11)
# was:	sb	_tmp_reg_15_, 0(_addr_reg_14_)
	addi	$11, $11, 1
# was:	addi	_addr_reg_14_, _addr_reg_14_, 1
	ori	$10, $0, 98
# was:	ori	_tmp_reg_15_, 0, 98
	sb	$10, 0($11)
# was:	sb	_tmp_reg_15_, 0(_addr_reg_14_)
	addi	$11, $11, 1
# was:	addi	_addr_reg_14_, _addr_reg_14_, 1
	ori	$10, $0, 97
# was:	ori	_tmp_reg_15_, 0, 97
	sb	$10, 0($11)
# was:	sb	_tmp_reg_15_, 0(_addr_reg_14_)
	addi	$11, $11, 1
# was:	addi	_addr_reg_14_, _addr_reg_14_, 1
# 	ori	_arr_reg_18_,_letBind_12_,0
	lw	$17, 0($18)
# was:	lw	_size_reg_19_, 0(_arr_reg_18_)
	ori	$16, $28, 0
# was:	ori	_letBind_17_, 28, 0
	addi	$10, $17, 3
# was:	addi	_tmp_25_, _size_reg_19_, 3
	sra	$10, $10, 2
# was:	sra	_tmp_25_, _tmp_25_, 2
	sll	$10, $10, 2
# was:	sll	_tmp_25_, _tmp_25_, 2
	addi	$10, $10, 4
# was:	addi	_tmp_25_, _tmp_25_, 4
	add	$28, $28, $10
# was:	add	28, 28, _tmp_25_
	sw	$17, 0($16)
# was:	sw	_size_reg_19_, 0(_letBind_17_)
	addi	$18, $18, 4
# was:	addi	_arr_reg_18_, _arr_reg_18_, 4
	addi	$19, $16, 4
# was:	addi	_rez_reg_20_, _letBind_17_, 4
	ori	$20, $0, 0
# was:	ori	_ind_var_21_, 0, 0
_loop_beg_23_:
	sub	$2, $20, $17
# was:	sub	_tmp_reg_22_, _ind_var_21_, _size_reg_19_
	bgez	$2, _loop_end_24_
# was:	bgez	_tmp_reg_22_, _loop_end_24_
	lb	$2, 0($18)
# was:	lb	_tmp_reg_22_, 0(_arr_reg_18_)
# 	ori	2,_tmp_reg_22_,0
	jal	this
# was:	jal	this, 2
# 	ori	_tmp_reg_26_,2,0
# 	ori	_tmp_reg_22_,_tmp_reg_26_,0
	sb	$2, 0($19)
# was:	sb	_tmp_reg_22_, 0(_rez_reg_20_)
	addi	$18, $18, 1
# was:	addi	_arr_reg_18_, _arr_reg_18_, 1
	addi	$19, $19, 1
# was:	addi	_rez_reg_20_, _rez_reg_20_, 1
	addi	$20, $20, 1
# was:	addi	_ind_var_21_, _ind_var_21_, 1
	j	_loop_beg_23_
_loop_end_24_:
# 	ori	_tmp_27_,_letBind_17_,0
# 	ori	_mainres_11_,_tmp_27_,0
	ori	$2, $16, 0
# was:	ori	2, _tmp_27_, 0
	jal	putstring
# was:	jal	putstring, 2
	ori	$2, $16, 0
# was:	ori	2, _mainres_11_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
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