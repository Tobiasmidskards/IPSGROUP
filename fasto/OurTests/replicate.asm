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
# Function writeBool
writeBool:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
	ori	$16, $2, 0
# was:	ori	_param_b_1_, 2, 0
# 	ori	_tmp_3_,_param_b_1_,0
# 	ori	_writeBoolres_2_,_tmp_3_,0
	ori	$2, $16, 0
# was:	ori	2, _writeBoolres_2_, 0
	jal	putint
# was:	jal	putint, 2
	ori	$2, $16, 0
# was:	ori	2, _writeBoolres_2_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
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
	ori	$11, $0, 7
# was:	ori	_size_reg_6_, 0, 7
	ori	$10, $0, 1
# was:	ori	_e_reg_7_, 0, 1
	addi	$11, $11, -1
# was:	addi	_size_reg_6_, _size_reg_6_, -1
	bgez	$11, _safe_lab_8_
# was:	bgez	_size_reg_6_, _safe_lab_8_
	j	_IllegalArrSizeError_
_safe_lab_8_:
	addi	$11, $11, 1
# was:	addi	_size_reg_6_, _size_reg_6_, 1
	ori	$17, $28, 0
# was:	ori	_letBind_5_, 28, 0
	sll	$12, $11, 2
# was:	sll	_tmp_11_, _size_reg_6_, 2
	addi	$12, $12, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	$28, $28, $12
# was:	add	28, 28, _tmp_11_
	sw	$11, 0($17)
# was:	sw	_size_reg_6_, 0(_letBind_5_)
	addi	$14, $17, 4
# was:	addi	_addr_reg_9_, _letBind_5_, 4
	ori	$12, $0, 0
# was:	ori	_i_reg_10_, 0, 0
_loop_beg_12_:
	sub	$13, $12, $11
# was:	sub	_tmp_reg_14_, _i_reg_10_, _size_reg_6_
	bgez	$13, _loop_end_13_
# was:	bgez	_tmp_reg_14_, _loop_end_13_
	sw	$10, 0($14)
# was:	sw	_e_reg_7_, 0(_addr_reg_9_)
	addi	$14, $14, 4
# was:	addi	_addr_reg_9_, _addr_reg_9_, 4
	addi	$12, $12, 1
# was:	addi	_i_reg_10_, _i_reg_10_, 1
	j	_loop_beg_12_
_loop_end_13_:
# 	ori	_arr_reg_15_,_letBind_5_,0
	lw	$16, 0($17)
# was:	lw	_size_reg_16_, 0(_arr_reg_15_)
	ori	$18, $28, 0
# was:	ori	_mainres_4_, 28, 0
	sll	$10, $16, 2
# was:	sll	_tmp_22_, _size_reg_16_, 2
	addi	$10, $10, 4
# was:	addi	_tmp_22_, _tmp_22_, 4
	add	$28, $28, $10
# was:	add	28, 28, _tmp_22_
	sw	$16, 0($18)
# was:	sw	_size_reg_16_, 0(_mainres_4_)
	addi	$17, $17, 4
# was:	addi	_arr_reg_15_, _arr_reg_15_, 4
	addi	$19, $18, 4
# was:	addi	_rez_reg_17_, _mainres_4_, 4
	ori	$20, $0, 0
# was:	ori	_ind_var_18_, 0, 0
_loop_beg_20_:
	sub	$2, $20, $16
# was:	sub	_tmp_reg_19_, _ind_var_18_, _size_reg_16_
	bgez	$2, _loop_end_21_
# was:	bgez	_tmp_reg_19_, _loop_end_21_
	lw	$2, 0($17)
# was:	lw	_tmp_reg_19_, 0(_arr_reg_15_)
# 	ori	2,_tmp_reg_19_,0
	jal	writeBool
# was:	jal	writeBool, 2
# 	ori	_tmp_reg_23_,2,0
# 	ori	_tmp_reg_19_,_tmp_reg_23_,0
	sw	$2, 0($19)
# was:	sw	_tmp_reg_19_, 0(_rez_reg_17_)
	addi	$17, $17, 4
# was:	addi	_arr_reg_15_, _arr_reg_15_, 4
	addi	$19, $19, 4
# was:	addi	_rez_reg_17_, _rez_reg_17_, 4
	addi	$20, $20, 1
# was:	addi	_ind_var_18_, _ind_var_18_, 1
	j	_loop_beg_20_
_loop_end_21_:
	ori	$2, $18, 0
# was:	ori	2, _mainres_4_, 0
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