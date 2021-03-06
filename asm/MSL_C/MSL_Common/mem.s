.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global memmove
memmove:
/* 801CA274 001C5ED4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801CA278 001C5ED8  7C 08 02 A6 */	mflr r0
/* 801CA27C 001C5EDC  7C 66 22 78 */	xor r6, r3, r4
/* 801CA280 001C5EE0  28 05 00 20 */	cmplwi r5, 0x20
/* 801CA284 001C5EE4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801CA288 001C5EE8  7C C0 00 34 */	cntlzw r0, r6
/* 801CA28C 001C5EEC  7C 60 00 30 */	slw r0, r3, r0
/* 801CA290 001C5EF0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801CA294 001C5EF4  7C 7F 1B 78 */	mr r31, r3
/* 801CA298 001C5EF8  54 07 0F FE */	srwi r7, r0, 0x1f
/* 801CA29C 001C5EFC  41 80 00 40 */	blt lbl_801CA2DC
/* 801CA2A0 001C5F00  54 C0 07 BF */	clrlwi. r0, r6, 0x1e
/* 801CA2A4 001C5F04  41 82 00 1C */	beq lbl_801CA2C0
/* 801CA2A8 001C5F08  2C 07 00 00 */	cmpwi r7, 0
/* 801CA2AC 001C5F0C  40 82 00 0C */	bne lbl_801CA2B8
/* 801CA2B0 001C5F10  48 00 02 99 */	bl __copy_longs_unaligned
/* 801CA2B4 001C5F14  48 00 00 20 */	b lbl_801CA2D4
lbl_801CA2B8:
/* 801CA2B8 001C5F18  48 00 03 51 */	bl __copy_longs_rev_unaligned
/* 801CA2BC 001C5F1C  48 00 00 18 */	b lbl_801CA2D4
lbl_801CA2C0:
/* 801CA2C0 001C5F20  2C 07 00 00 */	cmpwi r7, 0
/* 801CA2C4 001C5F24  40 82 00 0C */	bne lbl_801CA2D0
/* 801CA2C8 001C5F28  48 00 01 1D */	bl __copy_longs_aligned
/* 801CA2CC 001C5F2C  48 00 00 08 */	b lbl_801CA2D4
lbl_801CA2D0:
/* 801CA2D0 001C5F30  48 00 01 D1 */	bl __copy_longs_rev_aligned
lbl_801CA2D4:
/* 801CA2D4 001C5F34  7F E3 FB 78 */	mr r3, r31
/* 801CA2D8 001C5F38  48 00 00 54 */	b lbl_801CA32C
lbl_801CA2DC:
/* 801CA2DC 001C5F3C  2C 07 00 00 */	cmpwi r7, 0
/* 801CA2E0 001C5F40  40 82 00 28 */	bne lbl_801CA308
/* 801CA2E4 001C5F44  38 84 FF FF */	addi r4, r4, -1
/* 801CA2E8 001C5F48  38 63 FF FF */	addi r3, r3, -1
/* 801CA2EC 001C5F4C  38 A5 00 01 */	addi r5, r5, 1
/* 801CA2F0 001C5F50  48 00 00 0C */	b lbl_801CA2FC
lbl_801CA2F4:
/* 801CA2F4 001C5F54  8C 04 00 01 */	lbzu r0, 1(r4)
/* 801CA2F8 001C5F58  9C 03 00 01 */	stbu r0, 1(r3)
lbl_801CA2FC:
/* 801CA2FC 001C5F5C  34 A5 FF FF */	addic. r5, r5, -1
/* 801CA300 001C5F60  40 82 FF F4 */	bne lbl_801CA2F4
/* 801CA304 001C5F64  48 00 00 24 */	b lbl_801CA328
lbl_801CA308:
/* 801CA308 001C5F68  7C 84 2A 14 */	add r4, r4, r5
/* 801CA30C 001C5F6C  7C 63 2A 14 */	add r3, r3, r5
/* 801CA310 001C5F70  38 A5 00 01 */	addi r5, r5, 1
/* 801CA314 001C5F74  48 00 00 0C */	b lbl_801CA320
lbl_801CA318:
/* 801CA318 001C5F78  8C 04 FF FF */	lbzu r0, -1(r4)
/* 801CA31C 001C5F7C  9C 03 FF FF */	stbu r0, -1(r3)
lbl_801CA320:
/* 801CA320 001C5F80  34 A5 FF FF */	addic. r5, r5, -1
/* 801CA324 001C5F84  40 82 FF F4 */	bne lbl_801CA318
lbl_801CA328:
/* 801CA328 001C5F88  7F E3 FB 78 */	mr r3, r31
lbl_801CA32C:
/* 801CA32C 001C5F8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801CA330 001C5F90  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801CA334 001C5F94  7C 08 03 A6 */	mtlr r0
/* 801CA338 001C5F98  38 21 00 10 */	addi r1, r1, 0x10
/* 801CA33C 001C5F9C  4E 80 00 20 */	blr

.global memchr
memchr:
/* 801CA340 001C5FA0  54 84 06 3E */	clrlwi r4, r4, 0x18
/* 801CA344 001C5FA4  38 63 FF FF */	addi r3, r3, -1
/* 801CA348 001C5FA8  38 A5 00 01 */	addi r5, r5, 1
/* 801CA34C 001C5FAC  48 00 00 10 */	b lbl_801CA35C
lbl_801CA350:
/* 801CA350 001C5FB0  8C 03 00 01 */	lbzu r0, 1(r3)
/* 801CA354 001C5FB4  7C 00 20 40 */	cmplw r0, r4
/* 801CA358 001C5FB8  4D 82 00 20 */	beqlr
lbl_801CA35C:
/* 801CA35C 001C5FBC  34 A5 FF FF */	addic. r5, r5, -1
/* 801CA360 001C5FC0  40 82 FF F0 */	bne lbl_801CA350
/* 801CA364 001C5FC4  38 60 00 00 */	li r3, 0
/* 801CA368 001C5FC8  4E 80 00 20 */	blr

.global __memrchr
__memrchr:
/* 801CA36C 001C5FCC  7C 63 2A 14 */	add r3, r3, r5
/* 801CA370 001C5FD0  54 84 06 3E */	clrlwi r4, r4, 0x18
/* 801CA374 001C5FD4  38 A5 00 01 */	addi r5, r5, 1
/* 801CA378 001C5FD8  48 00 00 10 */	b lbl_801CA388
lbl_801CA37C:
/* 801CA37C 001C5FDC  8C 03 FF FF */	lbzu r0, -1(r3)
/* 801CA380 001C5FE0  7C 00 20 40 */	cmplw r0, r4
/* 801CA384 001C5FE4  4D 82 00 20 */	beqlr
lbl_801CA388:
/* 801CA388 001C5FE8  34 A5 FF FF */	addic. r5, r5, -1
/* 801CA38C 001C5FEC  40 82 FF F0 */	bne lbl_801CA37C
/* 801CA390 001C5FF0  38 60 00 00 */	li r3, 0
/* 801CA394 001C5FF4  4E 80 00 20 */	blr

.global memcmp
memcmp:
/* 801CA398 001C5FF8  38 E4 FF FF */	addi r7, r4, -1
/* 801CA39C 001C5FFC  38 C3 FF FF */	addi r6, r3, -1
/* 801CA3A0 001C6000  38 85 00 01 */	addi r4, r5, 1
/* 801CA3A4 001C6004  48 00 00 30 */	b lbl_801CA3D4
lbl_801CA3A8:
/* 801CA3A8 001C6008  8C 66 00 01 */	lbzu r3, 1(r6)
/* 801CA3AC 001C600C  8C 07 00 01 */	lbzu r0, 1(r7)
/* 801CA3B0 001C6010  7C 03 00 40 */	cmplw r3, r0
/* 801CA3B4 001C6014  41 82 00 20 */	beq lbl_801CA3D4
/* 801CA3B8 001C6018  88 86 00 00 */	lbz r4, 0(r6)
/* 801CA3BC 001C601C  38 60 00 01 */	li r3, 1
/* 801CA3C0 001C6020  88 07 00 00 */	lbz r0, 0(r7)
/* 801CA3C4 001C6024  7C 04 00 40 */	cmplw r4, r0
/* 801CA3C8 001C6028  4C 80 00 20 */	bgelr
/* 801CA3CC 001C602C  38 60 FF FF */	li r3, -1
/* 801CA3D0 001C6030  4E 80 00 20 */	blr
lbl_801CA3D4:
/* 801CA3D4 001C6034  34 84 FF FF */	addic. r4, r4, -1
/* 801CA3D8 001C6038  40 82 FF D0 */	bne lbl_801CA3A8
/* 801CA3DC 001C603C  38 60 00 00 */	li r3, 0
/* 801CA3E0 001C6040  4E 80 00 20 */	blr
