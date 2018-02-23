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
# Function sum
sum:
	sw	$31, -4($29)
	addi	$29, $29, -8
	ori	$10, $2, 0
# was:	ori	_param_x_1_, 2, 0
	ori	$11, $10, 0
# was:	ori	_plus_L_3_, _param_x_1_, 0
# 	ori	_plus_R_4_,_param_x_1_,0
	add	$2, $11, $10
# was:	add	_sumres_2_, _plus_L_3_, _plus_R_4_
# 	ori	2,_sumres_2_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function red
red:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_5_,2,0
# 	ori	_param_y_6_,3,0
# 	ori	_plus_L_8_,_param_x_5_,0
# 	ori	_plus_R_9_,_param_y_6_,0
	add	$2, $2, $3
# was:	add	_redres_7_, _plus_L_8_, _plus_R_9_
# 	ori	2,_redres_7_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function compute
compute:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	ori	$11, $2, 0
# was:	ori	_param_n_10_, 2, 0
# 	ori	_size_reg_13_,_param_n_10_,0
	addi	$11, $11, -1
# was:	addi	_size_reg_13_, _size_reg_13_, -1
	bgez	$11, _safe_lab_14_
# was:	bgez	_size_reg_13_, _safe_lab_14_
	ori	$5, $0, 5
# was:	ori	5, 0, 5
	j	_IllegalArrSizeError_
_safe_lab_14_:
	addi	$11, $11, 1
# was:	addi	_size_reg_13_, _size_reg_13_, 1
	ori	$10, $28, 0
# was:	ori	_letBind_12_, 28, 0
	sll	$12, $11, 2
# was:	sll	_tmp_20_, _size_reg_13_, 2
	addi	$12, $12, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	$28, $28, $12
# was:	add	28, 28, _tmp_20_
	sw	$11, 0($10)
# was:	sw	_size_reg_13_, 0(_letBind_12_)
	addi	$13, $10, 4
# was:	addi	_addr_reg_15_, _letBind_12_, 4
	ori	$14, $0, 0
# was:	ori	_i_reg_16_, 0, 0
_loop_beg_17_:
	sub	$12, $14, $11
# was:	sub	_tmp_reg_19_, _i_reg_16_, _size_reg_13_
	bgez	$12, _loop_end_18_
# was:	bgez	_tmp_reg_19_, _loop_end_18_
	sw	$14, 0($13)
# was:	sw	_i_reg_16_, 0(_addr_reg_15_)
	addi	$13, $13, 4
# was:	addi	_addr_reg_15_, _addr_reg_15_, 4
	addi	$14, $14, 1
# was:	addi	_i_reg_16_, _i_reg_16_, 1
	j	_loop_beg_17_
_loop_end_18_:
# 	ori	_arr_reg_23_,_letBind_12_,0
	lw	$17, 0($10)
# was:	lw	_size_reg_22_, 0(_arr_reg_23_)
	ori	$16, $28, 0
# was:	ori	_letBind_21_, 28, 0
	sll	$11, $17, 2
# was:	sll	_tmp_32_, _size_reg_22_, 2
	addi	$11, $11, 4
# was:	addi	_tmp_32_, _tmp_32_, 4
	add	$28, $28, $11
# was:	add	28, 28, _tmp_32_
	sw	$17, 0($16)
# was:	sw	_size_reg_22_, 0(_letBind_21_)
	addi	$18, $16, 4
# was:	addi	_addr_reg_26_, _letBind_21_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_27_, 0, 0
	addi	$20, $10, 4
# was:	addi	_elem_reg_24_, _arr_reg_23_, 4
_loop_beg_28_:
	sub	$10, $19, $17
# was:	sub	_tmp_reg_30_, _i_reg_27_, _size_reg_22_
	bgez	$10, _loop_end_29_
# was:	bgez	_tmp_reg_30_, _loop_end_29_
	lw	$2, 0($20)
# was:	lw	_res_reg_25_, 0(_elem_reg_24_)
# 	ori	2,_res_reg_25_,0
	jal	sum
# was:	jal	sum, 2
# 	ori	_tmp_reg_31_,2,0
# 	ori	_res_reg_25_,_tmp_reg_31_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_24_, _elem_reg_24_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_25_, 0(_addr_reg_26_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_26_, _addr_reg_26_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_27_, _i_reg_27_, 1
	j	_loop_beg_28_
_loop_end_29_:
	ori	$17, $16, 0
# was:	ori	_arr_reg_34_, _letBind_21_, 0
	lw	$16, 0($17)
# was:	lw	_size_reg_35_, 0(_arr_reg_34_)
	ori	$2, $0, 0
# was:	ori	_letBind_33_, 0, 0
	addi	$17, $17, 4
# was:	addi	_arr_reg_34_, _arr_reg_34_, 4
	ori	$18, $0, 0
# was:	ori	_ind_var_36_, 0, 0
_loop_beg_38_:
	sub	$3, $18, $16
# was:	sub	_tmp_reg_37_, _ind_var_36_, _size_reg_35_
	bgez	$3, _loop_end_39_
# was:	bgez	_tmp_reg_37_, _loop_end_39_
	lw	$3, 0($17)
# was:	lw	_tmp_reg_37_, 0(_arr_reg_34_)
	addi	$17, $17, 4
# was:	addi	_arr_reg_34_, _arr_reg_34_, 4
# 	ori	2,_letBind_33_,0
# 	ori	3,_tmp_reg_37_,0
	jal	red
# was:	jal	red, 2 3
# 	ori	_tmp_reg_40_,2,0
# 	ori	_letBind_33_,_tmp_reg_40_,0
	addi	$18, $18, 1
# was:	addi	_ind_var_36_, _ind_var_36_, 1
	j	_loop_beg_38_
_loop_end_39_:
	ori	$16, $2, 0
# was:	ori	_tmp_41_, _letBind_33_, 0
# 	ori	_computeres_11_,_tmp_41_,0
	ori	$2, $16, 0
# was:	ori	2, _computeres_11_, 0
	jal	putint
# was:	jal	putint, 2
	ori	$2, $16, 0
# was:	ori	2, _computeres_11_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
	jal	getint
# was:	jal	getint, 2
# 	ori	_letBind_43_,2,0
# 	ori	_lt_L_48_,_letBind_43_,0
	ori	$10, $0, 1
# was:	ori	_lt_R_49_, 0, 1
	slt	$10, $2, $10
# was:	slt	_cond_47_, _lt_L_48_, _lt_R_49_
	bne	$10, $0, _then_44_
# was:	bne	_cond_47_, 0, _then_44_
	j	_else_45_
_then_44_:
	ori	$16, $0, 0
# was:	ori	_tmp_50_, 0, 0
# 	ori	_mainres_42_,_tmp_50_,0
	ori	$2, $16, 0
# was:	ori	2, _mainres_42_, 0
	jal	putint
# was:	jal	putint, 2
	j	_endif_46_
_else_45_:
# 	ori	_arg_51_,_letBind_43_,0
# 	ori	2,_arg_51_,0
	jal	compute
# was:	jal	compute, 2
	ori	$16, $2, 0
# was:	ori	_mainres_42_, 2, 0
_endif_46_:
	ori	$2, $16, 0
# was:	ori	2, _mainres_42_, 0
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