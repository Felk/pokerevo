.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global __ct__Q34nw4r3lyt8DrawInfoFv
__ct__Q34nw4r3lyt8DrawInfoFv:
/* 8038D688 003892E8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038D68C 003892EC  7C 08 02 A6 */	mflr r0
/* 8038D690 003892F0  3C 80 80 45 */	lis r4, lbl_8044E550@ha
/* 8038D694 003892F4  C0 22 A8 D8 */	lfs f1, lbl_80642ED8-_SDA2_BASE_(r2)
/* 8038D698 003892F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038D69C 003892FC  38 84 E5 50 */	addi r4, r4, lbl_8044E550@l
/* 8038D6A0 00389300  C0 02 A8 DC */	lfs f0, lbl_80642EDC-_SDA2_BASE_(r2)
/* 8038D6A4 00389304  38 A0 00 01 */	li r5, 1
/* 8038D6A8 00389308  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038D6AC 0038930C  7C 7F 1B 78 */	mr r31, r3
/* 8038D6B0 00389310  90 83 00 00 */	stw r4, 0(r3)
/* 8038D6B4 00389314  38 80 00 00 */	li r4, 0
/* 8038D6B8 00389318  D0 23 00 34 */	stfs f1, 0x34(r3)
/* 8038D6BC 0038931C  D0 23 00 38 */	stfs f1, 0x38(r3)
/* 8038D6C0 00389320  D0 23 00 3C */	stfs f1, 0x3c(r3)
/* 8038D6C4 00389324  D0 23 00 40 */	stfs f1, 0x40(r3)
/* 8038D6C8 00389328  D0 03 00 44 */	stfs f0, 0x44(r3)
/* 8038D6CC 0038932C  D0 03 00 48 */	stfs f0, 0x48(r3)
/* 8038D6D0 00389330  D0 03 00 4C */	stfs f0, 0x4c(r3)
/* 8038D6D4 00389334  38 63 00 50 */	addi r3, r3, 0x50
/* 8038D6D8 00389338  4B C7 6A 2D */	bl memset
/* 8038D6DC 0038933C  38 7F 00 04 */	addi r3, r31, 4
/* 8038D6E0 00389340  4B EE E8 4D */	bl PSMTXIdentity
/* 8038D6E4 00389344  7F E3 FB 78 */	mr r3, r31
/* 8038D6E8 00389348  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038D6EC 0038934C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038D6F0 00389350  7C 08 03 A6 */	mtlr r0
/* 8038D6F4 00389354  38 21 00 10 */	addi r1, r1, 0x10
/* 8038D6F8 00389358  4E 80 00 20 */	blr 

.global __dt__Q34nw4r3lyt8DrawInfoFv
__dt__Q34nw4r3lyt8DrawInfoFv:
/* 8038D6FC 0038935C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8038D700 00389360  7C 08 02 A6 */	mflr r0
/* 8038D704 00389364  2C 03 00 00 */	cmpwi r3, 0
/* 8038D708 00389368  90 01 00 14 */	stw r0, 0x14(r1)
/* 8038D70C 0038936C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8038D710 00389370  7C 7F 1B 78 */	mr r31, r3
/* 8038D714 00389374  41 82 00 10 */	beq lbl_8038D724
/* 8038D718 00389378  2C 04 00 00 */	cmpwi r4, 0
/* 8038D71C 0038937C  40 81 00 08 */	ble lbl_8038D724
/* 8038D720 00389380  4B E4 D3 99 */	bl __dl__FPv
lbl_8038D724:
/* 8038D724 00389384  7F E3 FB 78 */	mr r3, r31
/* 8038D728 00389388  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8038D72C 0038938C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8038D730 00389390  7C 08 03 A6 */	mtlr r0
/* 8038D734 00389394  38 21 00 10 */	addi r1, r1, 0x10
/* 8038D738 00389398  4E 80 00 20 */	blr 
