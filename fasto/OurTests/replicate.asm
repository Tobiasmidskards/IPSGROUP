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
	ori	$10, $0, 7
# was:	ori	_size_reg_6_, 0, 7
	ori	$11, $0, 1
# was:	ori	_e_reg_7_, 0, 1
	addi	$10, $10, -1
# was:	addi	_size_reg_6_, _size_reg_6_, -1
	bgez	$10, _safe_lab_8_
# was:	bgez	_size_reg_6_, _safe_lab_8_
	j	_IllegalArrSizeError_
_safe_lab_8_:
	addi	$10, $10, 1
# was:	addi	_size_reg_6_, _size_reg_6_, 1
	ori	$12, $28, 0
# was:	ori	_letBind_5_, 28, 0
	sll	$13, $10, 2
# was:	sll	_tmp_11_, _size_reg_6_, 2
	addi	$13, $13, 4
# was:	addi	_tmp_11_, _tmp_11_, 4
	add	$28, $28, $13
# was:	add	28, 28, _tmp_11_
	sw	$10, 0($12)
# was:	sw	_size_reg_6_, 0(_letBind_5_)
	addi	$15, $12, 4
# was:	addi	_addr_reg_9_, _letBind_5_, 4
	ori	$14, $0, 0
# was:	ori	_i_reg_10_, 0, 0
_loop_beg_12_:
	sub	$13, $14, $10
# was:	sub	_tmp_reg_14_, _i_reg_10_, _size_reg_6_
	bgez	$13, _loop_end_13_
# was:	bgez	_tmp_reg_14_, _loop_end_13_
	sw	$11, 0($15)
# was:	sw	_e_reg_7_, 0(_addr_reg_9_)
	addi	$15, $15, 4
# was:	addi	_addr_reg_9_, _addr_reg_9_, 4
	addi	$14, $14, 1
# was:	addi	_i_reg_10_, _i_reg_10_, 1
	j	_loop_beg_12_
_loop_end_13_:
# 	ori	_arr_reg_16_,_letBind_5_,0
	lw	$16, 0($12)
# was:	lw	_size_reg_15_, 0(_arr_reg_16_)
	ori	$17, $28, 0
# was:	ori	_mainres_4_, 28, 0
	sll	$10, $16, 2
# was:	sll	_tmp_25_, _size_reg_15_, 2
	addi	$10, $10, 4
# was:	addi	_tmp_25_, _tmp_25_, 4
	add	$28, $28, $10
# was:	add	28, 28, _tmp_25_
	sw	$16, 0($17)
# was:	sw	_size_reg_15_, 0(_mainres_4_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_19_, _mainres_4_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_20_, 0, 0
	addi	$20, $12, 4
# was:	addi	_elem_reg_17_, _arr_reg_16_, 4
_loop_beg_21_:
	sub	$10, $19, $16
# was:	sub	_tmp_reg_23_, _i_reg_20_, _size_reg_15_
	bgez	$10, _loop_end_22_
# was:	bgez	_tmp_reg_23_, _loop_end_22_
	lw	$2, 0($20)
# was:	lw	_res_reg_18_, 0(_elem_reg_17_)
# 	ori	2,_res_reg_18_,0
	jal	writeBool
# was:	jal	writeBool, 2
# 	ori	_tmp_reg_24_,2,0
# 	ori	_res_reg_18_,_tmp_reg_24_,0
	addi	$20, $20, 4
# was:	addi	_elem_reg_17_, _elem_reg_17_, 4
	sw	$2, 0($18)
# was:	sw	_res_reg_18_, 0(_addr_reg_19_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_19_, _addr_reg_19_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_20_, _i_reg_20_, 1
	j	_loop_beg_21_
_loop_end_22_:
	ori	$2, $17, 0
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