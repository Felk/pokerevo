.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global NANDCheckAsync
NANDCheckAsync:
/* 802EA66C 002E62CC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802EA670 002E62D0  7C 08 02 A6 */	mflr r0
/* 802EA674 002E62D4  90 01 00 24 */	stw r0, 0x24(r1)
/* 802EA678 002E62D8  39 61 00 20 */	addi r11, r1, 0x20
/* 802EA67C 002E62DC  4B ED CA AD */	bl _savegpr_27
/* 802EA680 002E62E0  7C 7B 1B 78 */	mr r27, r3
/* 802EA684 002E62E4  7C 9C 23 78 */	mr r28, r4
/* 802EA688 002E62E8  7C BD 2B 78 */	mr r29, r5
/* 802EA68C 002E62EC  7C DE 33 78 */	mr r30, r6
/* 802EA690 002E62F0  7C FF 3B 78 */	mr r31, r7
/* 802EA694 002E62F4  4B FF ED 5D */	bl nandIsInitialized
/* 802EA698 002E62F8  2C 03 00 00 */	cmpwi r3, 0
/* 802EA69C 002E62FC  40 82 00 0C */	bne lbl_802EA6A8
/* 802EA6A0 002E6300  38 60 FF 80 */	li r3, -128
/* 802EA6A4 002E6304  48 00 00 5C */	b lbl_802EA700
lbl_802EA6A8:
/* 802EA6A8 002E6308  3C 60 80 44 */	lis r3, lbl_80445800@ha
/* 802EA6AC 002E630C  38 80 00 00 */	li r4, 0
/* 802EA6B0 002E6310  38 63 58 00 */	addi r3, r3, lbl_80445800@l
/* 802EA6B4 002E6314  38 00 00 14 */	li r0, 0x14
/* 802EA6B8 002E6318  93 DF 00 04 */	stw r30, 4(r31)
/* 802EA6BC 002E631C  93 7F 00 90 */	stw r27, 0x90(r31)
/* 802EA6C0 002E6320  93 9F 00 94 */	stw r28, 0x94(r31)
/* 802EA6C4 002E6324  93 BF 00 98 */	stw r29, 0x98(r31)
/* 802EA6C8 002E6328  90 9F 00 A4 */	stw r4, 0xa4(r31)
/* 802EA6CC 002E632C  90 9F 00 A8 */	stw r4, 0xa8(r31)
/* 802EA6D0 002E6330  90 9F 00 AC */	stw r4, 0xac(r31)
/* 802EA6D4 002E6334  90 9F 00 B0 */	stw r4, 0xb0(r31)
/* 802EA6D8 002E6338  90 7F 00 B4 */	stw r3, 0xb4(r31)
/* 802EA6DC 002E633C  90 1F 00 7C */	stw r0, 0x7c(r31)
/* 802EA6E0 002E6340  4B FF FE 09 */	bl nandGetHomeDir
/* 802EA6E4 002E6344  3C C0 80 2F */	lis r6, nandUserAreaCallback@ha
/* 802EA6E8 002E6348  7F E7 FB 78 */	mr r7, r31
/* 802EA6EC 002E634C  38 9F 00 9C */	addi r4, r31, 0x9c
/* 802EA6F0 002E6350  38 BF 00 A0 */	addi r5, r31, 0xa0
/* 802EA6F4 002E6354  38 C6 A7 18 */	addi r6, r6, nandUserAreaCallback@l
/* 802EA6F8 002E6358  4B FB AC 41 */	bl ISFS_GetUsageAsync
/* 802EA6FC 002E635C  4B FF ED 0D */	bl nandConvertErrorCode
lbl_802EA700:
/* 802EA700 002E6360  39 61 00 20 */	addi r11, r1, 0x20
/* 802EA704 002E6364  4B ED CA 71 */	bl _restgpr_27
/* 802EA708 002E6368  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802EA70C 002E636C  7C 08 03 A6 */	mtlr r0
/* 802EA710 002E6370  38 21 00 20 */	addi r1, r1, 0x20
/* 802EA714 002E6374  4E 80 00 20 */	blr

nandUserAreaCallback:
/* 802EA718 002E6378  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802EA71C 002E637C  7C 08 02 A6 */	mflr r0
/* 802EA720 002E6380  2C 03 00 00 */	cmpwi r3, 0
/* 802EA724 002E6384  90 01 00 14 */	stw r0, 0x14(r1)
/* 802EA728 002E6388  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802EA72C 002E638C  7C 9F 23 78 */	mr r31, r4
/* 802EA730 002E6390  41 82 00 0C */	beq lbl_802EA73C
/* 802EA734 002E6394  2C 03 FF 96 */	cmpwi r3, -106
/* 802EA738 002E6398  40 82 01 EC */	bne lbl_802EA924
lbl_802EA73C:
/* 802EA73C 002E639C  80 A4 00 B4 */	lwz r5, 0xb4(r4)
/* 802EA740 002E63A0  2C 03 00 00 */	cmpwi r3, 0
/* 802EA744 002E63A4  80 65 00 00 */	lwz r3, 0(r5)
/* 802EA748 002E63A8  40 82 00 24 */	bne lbl_802EA76C
/* 802EA74C 002E63AC  80 E4 00 A4 */	lwz r7, 0xa4(r4)
/* 802EA750 002E63B0  80 C4 00 AC */	lwz r6, 0xac(r4)
/* 802EA754 002E63B4  80 A4 00 A8 */	lwz r5, 0xa8(r4)
/* 802EA758 002E63B8  80 04 00 B0 */	lwz r0, 0xb0(r4)
/* 802EA75C 002E63BC  7C C7 32 14 */	add r6, r7, r6
/* 802EA760 002E63C0  90 C4 00 A4 */	stw r6, 0xa4(r4)
/* 802EA764 002E63C4  7C 05 02 14 */	add r0, r5, r0
/* 802EA768 002E63C8  90 04 00 A8 */	stw r0, 0xa8(r4)
lbl_802EA76C:
/* 802EA76C 002E63CC  2C 03 00 00 */	cmpwi r3, 0
/* 802EA770 002E63D0  41 82 00 48 */	beq lbl_802EA7B8
/* 802EA774 002E63D4  80 A4 00 B4 */	lwz r5, 0xb4(r4)
/* 802EA778 002E63D8  3C C0 80 2F */	lis r6, nandUserAreaCallback@ha
/* 802EA77C 002E63DC  7F E7 FB 78 */	mr r7, r31
/* 802EA780 002E63E0  38 05 00 04 */	addi r0, r5, 4
/* 802EA784 002E63E4  38 BF 00 B0 */	addi r5, r31, 0xb0
/* 802EA788 002E63E8  90 04 00 B4 */	stw r0, 0xb4(r4)
/* 802EA78C 002E63EC  38 84 00 AC */	addi r4, r4, 0xac
/* 802EA790 002E63F0  38 C6 A7 18 */	addi r6, r6, nandUserAreaCallback@l
/* 802EA794 002E63F4  4B FB AB A5 */	bl ISFS_GetUsageAsync
/* 802EA798 002E63F8  2C 03 00 00 */	cmpwi r3, 0
/* 802EA79C 002E63FC  41 82 01 9C */	beq lbl_802EA938
/* 802EA7A0 002E6400  4B FF EC 69 */	bl nandConvertErrorCode
/* 802EA7A4 002E6404  81 9F 00 04 */	lwz r12, 4(r31)
/* 802EA7A8 002E6408  7F E4 FB 78 */	mr r4, r31
/* 802EA7AC 002E640C  7D 89 03 A6 */	mtctr r12
/* 802EA7B0 002E6410  4E 80 04 21 */	bctrl
/* 802EA7B4 002E6414  48 00 01 84 */	b lbl_802EA938
lbl_802EA7B8:
/* 802EA7B8 002E6418  80 04 00 7C */	lwz r0, 0x7c(r4)
/* 802EA7BC 002E641C  2C 00 00 14 */	cmpwi r0, 0x14
/* 802EA7C0 002E6420  40 82 00 84 */	bne lbl_802EA844
/* 802EA7C4 002E6424  80 64 00 90 */	lwz r3, 0x90(r4)
/* 802EA7C8 002E6428  39 00 00 00 */	li r8, 0
/* 802EA7CC 002E642C  80 04 00 9C */	lwz r0, 0x9c(r4)
/* 802EA7D0 002E6430  80 E4 00 A8 */	lwz r7, 0xa8(r4)
/* 802EA7D4 002E6434  7C 00 1A 14 */	add r0, r0, r3
/* 802EA7D8 002E6438  80 C4 00 A4 */	lwz r6, 0xa4(r4)
/* 802EA7DC 002E643C  28 00 04 00 */	cmplwi r0, 0x400
/* 802EA7E0 002E6440  80 04 00 A0 */	lwz r0, 0xa0(r4)
/* 802EA7E4 002E6444  80 A4 00 94 */	lwz r5, 0x94(r4)
/* 802EA7E8 002E6448  40 81 00 08 */	ble lbl_802EA7F0
/* 802EA7EC 002E644C  61 08 00 01 */	ori r8, r8, 1
lbl_802EA7F0:
/* 802EA7F0 002E6450  7C 00 2A 14 */	add r0, r0, r5
/* 802EA7F4 002E6454  28 00 00 21 */	cmplwi r0, 0x21
/* 802EA7F8 002E6458  40 81 00 08 */	ble lbl_802EA800
/* 802EA7FC 002E645C  61 08 00 02 */	ori r8, r8, 2
lbl_802EA800:
/* 802EA800 002E6460  7C 06 1A 14 */	add r0, r6, r3
/* 802EA804 002E6464  28 00 44 00 */	cmplwi r0, 0x4400
/* 802EA808 002E6468  40 81 00 08 */	ble lbl_802EA810
/* 802EA80C 002E646C  61 08 00 04 */	ori r8, r8, 4
lbl_802EA810:
/* 802EA810 002E6470  7C 07 2A 14 */	add r0, r7, r5
/* 802EA814 002E6474  28 00 0F A0 */	cmplwi r0, 0xfa0
/* 802EA818 002E6478  40 81 00 08 */	ble lbl_802EA820
/* 802EA81C 002E647C  61 08 00 08 */	ori r8, r8, 8
lbl_802EA820:
/* 802EA820 002E6480  80 84 00 98 */	lwz r4, 0x98(r4)
/* 802EA824 002E6484  38 60 00 00 */	li r3, 0
/* 802EA828 002E6488  91 04 00 00 */	stw r8, 0(r4)
/* 802EA82C 002E648C  4B FF EB DD */	bl nandConvertErrorCode
/* 802EA830 002E6490  81 9F 00 04 */	lwz r12, 4(r31)
/* 802EA834 002E6494  7F E4 FB 78 */	mr r4, r31
/* 802EA838 002E6498  7D 89 03 A6 */	mtctr r12
/* 802EA83C 002E649C  4E 80 04 21 */	bctrl
/* 802EA840 002E64A0  48 00 00 F8 */	b lbl_802EA938
lbl_802EA844:
/* 802EA844 002E64A4  2C 00 00 15 */	cmpwi r0, 0x15
/* 802EA848 002E64A8  40 82 00 A8 */	bne lbl_802EA8F0
/* 802EA84C 002E64AC  80 A4 00 A4 */	lwz r5, 0xa4(r4)
/* 802EA850 002E64B0  38 60 44 00 */	li r3, 0x4400
/* 802EA854 002E64B4  81 24 00 A8 */	lwz r9, 0xa8(r4)
/* 802EA858 002E64B8  38 00 0F A0 */	li r0, 0xfa0
/* 802EA85C 002E64BC  7C 65 18 10 */	subfc r3, r5, r3
/* 802EA860 002E64C0  81 44 00 9C */	lwz r10, 0x9c(r4)
/* 802EA864 002E64C4  7D 03 19 10 */	subfe r8, r3, r3
/* 802EA868 002E64C8  81 64 00 A0 */	lwz r11, 0xa0(r4)
/* 802EA86C 002E64CC  20 C5 44 00 */	subfic r6, r5, 0x4400
/* 802EA870 002E64D0  38 60 04 00 */	li r3, 0x400
/* 802EA874 002E64D4  7C A9 00 10 */	subfc r5, r9, r0
/* 802EA878 002E64D8  38 00 00 21 */	li r0, 0x21
/* 802EA87C 002E64DC  7C E5 29 10 */	subfe r7, r5, r5
/* 802EA880 002E64E0  7C C8 40 78 */	andc r8, r6, r8
/* 802EA884 002E64E4  20 C9 0F A0 */	subfic r6, r9, 0xfa0
/* 802EA888 002E64E8  7C 6A 18 10 */	subfc r3, r10, r3
/* 802EA88C 002E64EC  7C A3 19 10 */	subfe r5, r3, r3
/* 802EA890 002E64F0  7C C6 38 78 */	andc r6, r6, r7
/* 802EA894 002E64F4  20 6A 04 00 */	subfic r3, r10, 0x400
/* 802EA898 002E64F8  7C 65 28 78 */	andc r5, r3, r5
/* 802EA89C 002E64FC  7C 0B 00 10 */	subfc r0, r11, r0
/* 802EA8A0 002E6500  7C 60 01 10 */	subfe r3, r0, r0
/* 802EA8A4 002E6504  20 0B 00 21 */	subfic r0, r11, 0x21
/* 802EA8A8 002E6508  7C 08 28 40 */	cmplw r8, r5
/* 802EA8AC 002E650C  7C 00 18 78 */	andc r0, r0, r3
/* 802EA8B0 002E6510  40 80 00 08 */	bge lbl_802EA8B8
/* 802EA8B4 002E6514  7D 05 43 78 */	mr r5, r8
lbl_802EA8B8:
/* 802EA8B8 002E6518  80 64 00 0C */	lwz r3, 0xc(r4)
/* 802EA8BC 002E651C  7C 06 00 40 */	cmplw r6, r0
/* 802EA8C0 002E6520  90 A3 00 00 */	stw r5, 0(r3)
/* 802EA8C4 002E6524  40 80 00 08 */	bge lbl_802EA8CC
/* 802EA8C8 002E6528  7C C0 33 78 */	mr r0, r6
lbl_802EA8CC:
/* 802EA8CC 002E652C  80 84 00 10 */	lwz r4, 0x10(r4)
/* 802EA8D0 002E6530  38 60 00 00 */	li r3, 0
/* 802EA8D4 002E6534  90 04 00 00 */	stw r0, 0(r4)
/* 802EA8D8 002E6538  4B FF EB 31 */	bl nandConvertErrorCode
/* 802EA8DC 002E653C  81 9F 00 04 */	lwz r12, 4(r31)
/* 802EA8E0 002E6540  7F E4 FB 78 */	mr r4, r31
/* 802EA8E4 002E6544  7D 89 03 A6 */	mtctr r12
/* 802EA8E8 002E6548  4E 80 04 21 */	bctrl
/* 802EA8EC 002E654C  48 00 00 4C */	b lbl_802EA938
lbl_802EA8F0:
/* 802EA8F0 002E6550  3C 60 80 44 */	lis r3, lbl_80445844@ha
/* 802EA8F4 002E6554  3C 80 80 44 */	lis r4, lbl_8044582C@ha
/* 802EA8F8 002E6558  38 63 58 44 */	addi r3, r3, lbl_80445844@l
/* 802EA8FC 002E655C  38 84 58 2C */	addi r4, r4, lbl_8044582C@l
/* 802EA900 002E6560  4C C6 31 82 */	crclr 6
/* 802EA904 002E6564  4B D1 D1 C1 */	bl OSReport
/* 802EA908 002E6568  38 60 FF 8B */	li r3, -117
/* 802EA90C 002E656C  4B FF EA FD */	bl nandConvertErrorCode
/* 802EA910 002E6570  81 9F 00 04 */	lwz r12, 4(r31)
/* 802EA914 002E6574  7F E4 FB 78 */	mr r4, r31
/* 802EA918 002E6578  7D 89 03 A6 */	mtctr r12
/* 802EA91C 002E657C  4E 80 04 21 */	bctrl
/* 802EA920 002E6580  48 00 00 18 */	b lbl_802EA938
lbl_802EA924:
/* 802EA924 002E6584  4B FF EA E5 */	bl nandConvertErrorCode
/* 802EA928 002E6588  81 9F 00 04 */	lwz r12, 4(r31)
/* 802EA92C 002E658C  7F E4 FB 78 */	mr r4, r31
/* 802EA930 002E6590  7D 89 03 A6 */	mtctr r12
/* 802EA934 002E6594  4E 80 04 21 */	bctrl
lbl_802EA938:
/* 802EA938 002E6598  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802EA93C 002E659C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802EA940 002E65A0  7C 08 03 A6 */	mtlr r0
/* 802EA944 002E65A4  38 21 00 10 */	addi r1, r1, 0x10
/* 802EA948 002E65A8  4E 80 00 20 */	blr
