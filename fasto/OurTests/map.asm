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
# Function printInt
printInt:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_i_1_,2,0
	ori	$16, $2, 0
# was:	ori	_tmp_3_, _param_i_1_, 0
# 	ori	_printIntres_2_,_tmp_3_,0
	ori	$2, $16, 0
# was:	ori	2, _printIntres_2_, 0
	jal	putint
# was:	jal	putint, 2
	ori	$2, $16, 0
# was:	ori	2, _printIntres_2_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function this
this:
	sw	$31, -4($29)
	addi	$29, $29, -8
	ori	$11, $2, 0
# was:	ori	_param_num_4_, 2, 0
# 	ori	_eq_L_10_,_param_num_4_,0
	ori	$10, $0, 1
# was:	ori	_zero_12_, 0, 1
	ori	$12, $0, 0
# was:	ori	_cond_9_, 0, 0
	bne	$11, $10, _false_13_
# was:	bne	_eq_L_10_, _zero_12_, _false_13_
	ori	$12, $0, 1
# was:	ori	_cond_9_, 0, 1
_false_13_:
	bne	$12, $0, _then_6_
# was:	bne	_cond_9_, 0, _then_6_
	j	_else_7_
_then_6_:
	ori	$2, $0, 2
# was:	ori	_thisres_5_, 0, 2
	j	_endif_8_
_else_7_:
	ori	$2, $0, 1
# was:	ori	_thisres_5_, 0, 1
_endif_8_:
# 	ori	2,_thisres_5_,0
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
# was:	ori	_size_reg_16_, 0, 4
	ori	$16, $28, 0
# was:	ori	_letBind_15_, 28, 0
	sll	$11, $10, 2
# was:	sll	_tmp_19_, _size_reg_16_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_19_, _tmp_19_, 4
	add	$28, $28, $11
# was:	add	28, 28, _tmp_19_
	sw	$10, 0($16)
# was:	sw	_size_reg_16_, 0(_letBind_15_)
	addi	$11, $16, 4
# was:	addi	_addr_reg_17_, _letBind_15_, 4
	ori	$10, $0, 2
# was:	ori	_tmp_reg_18_, 0, 2
	sw	$10, 0($11)
# was:	sw	_tmp_reg_18_, 0(_addr_reg_17_)
	addi	$11, $11, 4
# was:	addi	_addr_reg_17_, _addr_reg_17_, 4
	ori	$10, $0, 1
# was:	ori	_tmp_reg_18_, 0, 1
	sw	$10, 0($11)
# was:	sw	_tmp_reg_18_, 0(_addr_reg_17_)
	addi	$11, $11, 4
# was:	addi	_addr_reg_17_, _addr_reg_17_, 4
	ori	$10, $0, 3
# was:	ori	_tmp_reg_18_, 0, 3
	sw	$10, 0($11)
# was:	sw	_tmp_reg_18_, 0(_addr_reg_17_)
	addi	$11, $11, 4
# was:	addi	_addr_reg_17_, _addr_reg_17_, 4
	ori	$10, $0, 1
# was:	ori	_tmp_reg_18_, 0, 1
	sw	$10, 0($11)
# was:	sw	_tmp_reg_18_, 0(_addr_reg_17_)
	addi	$11, $11, 4
# was:	addi	_addr_reg_17_, _addr_reg_17_, 4
# 	ori	_arr_reg_21_,_letBind_15_,0
	lw	$17, 0($16)
# was:	lw	_size_reg_22_, 0(_arr_reg_21_)
	ori	$18, $28, 0
# was:	ori	_letBind_20_, 28, 0
	sll	$10, $17, 2
# was:	sll	_tmp_28_, _size_reg_22_, 2
	addi	$10, $10, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	$28, $28, $10
# was:	add	28, 28, _tmp_28_
	sw	$17, 0($18)
# was:	sw	_size_reg_22_, 0(_letBind_20_)
	addi	$16, $16, 4
# was:	addi	_arr_reg_21_, _arr_reg_21_, 4
	addi	$19, $18, 4
# was:	addi	_rez_reg_23_, _letBind_20_, 4
	ori	$20, $0, 0
# was:	ori	_ind_var_24_, 0, 0
_loop_beg_26_:
	sub	$2, $20, $17
# was:	sub	_tmp_reg_25_, _ind_var_24_, _size_reg_22_
	bgez	$2, _loop_end_27_
# was:	bgez	_tmp_reg_25_, _loop_end_27_
	lw	$2, 0($16)
# was:	lw	_tmp_reg_25_, 0(_arr_reg_21_)
# 	ori	2,_tmp_reg_25_,0
	jal	this
# was:	jal	this, 2
# 	ori	_tmp_reg_29_,2,0
# 	ori	_tmp_reg_25_,_tmp_reg_29_,0
	sw	$2, 0($19)
# was:	sw	_tmp_reg_25_, 0(_rez_reg_23_)
	addi	$16, $16, 4
# was:	addi	_arr_reg_21_, _arr_reg_21_, 4
	addi	$19, $19, 4
# was:	addi	_rez_reg_23_, _rez_reg_23_, 4
	addi	$20, $20, 1
# was:	addi	_ind_var_24_, _ind_var_24_, 1
	j	_loop_beg_26_
_loop_end_27_:
# 	ori	_arr_reg_30_,_letBind_20_,0
	lw	$16, 0($18)
# was:	lw	_size_reg_31_, 0(_arr_reg_30_)
	ori	$17, $28, 0
# was:	ori	_mainres_14_, 28, 0
	sll	$10, $16, 2
# was:	sll	_tmp_37_, _size_reg_31_, 2
	addi	$10, $10, 4
# was:	addi	_tmp_37_, _tmp_37_, 4
	add	$28, $28, $10
# was:	add	28, 28, _tmp_37_
	sw	$16, 0($17)
# was:	sw	_size_reg_31_, 0(_mainres_14_)
	addi	$18, $18, 4
# was:	addi	_arr_reg_30_, _arr_reg_30_, 4
	addi	$19, $17, 4
# was:	addi	_rez_reg_32_, _mainres_14_, 4
	ori	$20, $0, 0
# was:	ori	_ind_var_33_, 0, 0
_loop_beg_35_:
	sub	$2, $20, $16
# was:	sub	_tmp_reg_34_, _ind_var_33_, _size_reg_31_
	bgez	$2, _loop_end_36_
# was:	bgez	_tmp_reg_34_, _loop_end_36_
	lw	$2, 0($18)
# was:	lw	_tmp_reg_34_, 0(_arr_reg_30_)
# 	ori	2,_tmp_reg_34_,0
	jal	printInt
# was:	jal	printInt, 2
# 	ori	_tmp_reg_38_,2,0
# 	ori	_tmp_reg_34_,_tmp_reg_38_,0
	sw	$2, 0($19)
# was:	sw	_tmp_reg_34_, 0(_rez_reg_32_)
	addi	$18, $18, 4
# was:	addi	_arr_reg_30_, _arr_reg_30_, 4
	addi	$19, $19, 4
# was:	addi	_rez_reg_32_, _rez_reg_32_, 4
	addi	$20, $20, 1
# was:	addi	_ind_var_33_, _ind_var_33_, 1
	j	_loop_beg_35_
_loop_end_36_:
	ori	$2, $17, 0
# was:	ori	2, _mainres_14_, 0
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