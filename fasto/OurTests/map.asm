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
# was:	ori	_eq_R_11_, 0, 1
	ori	$12, $0, 0
# was:	ori	_cond_9_, 0, 0
	bne	$11, $10, _false_12_
# was:	bne	_eq_L_10_, _eq_R_11_, _false_12_
	ori	$12, $0, 1
# was:	ori	_cond_9_, 0, 1
_false_12_:
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
	ori	$11, $0, 4
# was:	ori	_size_reg_15_, 0, 4
	ori	$10, $28, 0
# was:	ori	_letBind_14_, 28, 0
	sll	$12, $11, 2
# was:	sll	_tmp_18_, _size_reg_15_, 2
	addi	$12, $12, 4
# was:	addi	_tmp_18_, _tmp_18_, 4
	add	$28, $28, $12
# was:	add	28, 28, _tmp_18_
	sw	$11, 0($10)
# was:	sw	_size_reg_15_, 0(_letBind_14_)
	addi	$12, $10, 4
# was:	addi	_addr_reg_16_, _letBind_14_, 4
	ori	$11, $0, 2
# was:	ori	_tmp_reg_17_, 0, 2
	sw	$11, 0($12)
# was:	sw	_tmp_reg_17_, 0(_addr_reg_16_)
	addi	$12, $12, 4
# was:	addi	_addr_reg_16_, _addr_reg_16_, 4
	ori	$11, $0, 1
# was:	ori	_tmp_reg_17_, 0, 1
	sw	$11, 0($12)
# was:	sw	_tmp_reg_17_, 0(_addr_reg_16_)
	addi	$12, $12, 4
# was:	addi	_addr_reg_16_, _addr_reg_16_, 4
	ori	$11, $0, 3
# was:	ori	_tmp_reg_17_, 0, 3
	sw	$11, 0($12)
# was:	sw	_tmp_reg_17_, 0(_addr_reg_16_)
	addi	$12, $12, 4
# was:	addi	_addr_reg_16_, _addr_reg_16_, 4
	ori	$11, $0, 1
# was:	ori	_tmp_reg_17_, 0, 1
	sw	$11, 0($12)
# was:	sw	_tmp_reg_17_, 0(_addr_reg_16_)
	addi	$12, $12, 4
# was:	addi	_addr_reg_16_, _addr_reg_16_, 4
# 	ori	_arr_reg_21_,_letBind_14_,0
	lw	$16, 0($10)
# was:	lw	_size_reg_20_, 0(_arr_reg_21_)
	ori	$17, $28, 0
# was:	ori	_letBind_19_, 28, 0
	sll	$11, $16, 2
# was:	sll	_tmp_30_, _size_reg_20_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_30_, _tmp_30_, 4
	add	$28, $28, $11
# was:	add	28, 28, _tmp_30_
	sw	$16, 0($17)
# was:	sw	_size_reg_20_, 0(_letBind_19_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_24_, _letBind_19_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_25_, 0, 0
	addi	$20, $10, 4
# was:	addi	_elem_reg_22_, _arr_reg_21_, 4
_loop_beg_26_:
	sub	$10, $19, $16
# was:	sub	_tmp_reg_28_, _i_reg_25_, _size_reg_20_
	bgez	$10, _loop_end_27_
# was:	bgez	_tmp_reg_28_, _loop_end_27_
	lw	$2, 0($20)
# was:	lw	_res_reg_23_, 0(_elem_reg_22_)
# 	ori	2,_res_reg_23_,0
	jal	this
# was:	jal	this, 2
# 	ori	_tmp_reg_29_,2,0
# 	ori	_res_reg_23_,_tmp_reg_29_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_22_, _elem_reg_22_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_23_, 0(_addr_reg_24_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_24_, _addr_reg_24_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_25_, _i_reg_25_, 1
	j	_loop_beg_26_
_loop_end_27_:
	ori	$10, $17, 0
# was:	ori	_arr_reg_32_, _letBind_19_, 0
	lw	$17, 0($10)
# was:	lw	_size_reg_31_, 0(_arr_reg_32_)
	ori	$16, $28, 0
# was:	ori	_mainres_13_, 28, 0
	sll	$11, $17, 2
# was:	sll	_tmp_41_, _size_reg_31_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_41_, _tmp_41_, 4
	add	$28, $28, $11
# was:	add	28, 28, _tmp_41_
	sw	$17, 0($16)
# was:	sw	_size_reg_31_, 0(_mainres_13_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_35_, _mainres_13_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_36_, 0, 0
	addi	$20, $10, 4
# was:	addi	_elem_reg_33_, _arr_reg_32_, 4
_loop_beg_37_:
	sub	$10, $19, $17
# was:	sub	_tmp_reg_39_, _i_reg_36_, _size_reg_31_
	bgez	$10, _loop_end_38_
# was:	bgez	_tmp_reg_39_, _loop_end_38_
	lw	$2, 0($20)
# was:	lw	_res_reg_34_, 0(_elem_reg_33_)
# 	ori	2,_res_reg_34_,0
	jal	printInt
# was:	jal	printInt, 2
# 	ori	_tmp_reg_40_,2,0
# 	ori	_res_reg_34_,_tmp_reg_40_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_33_, _elem_reg_33_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_34_, 0(_addr_reg_35_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_35_, _addr_reg_35_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_36_, _i_reg_36_, 1
	j	_loop_beg_37_
_loop_end_38_:
	ori	$2, $16, 0
# was:	ori	2, _mainres_13_, 0
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