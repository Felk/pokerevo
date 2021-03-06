.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global NWC24iOpenResourceManager
NWC24iOpenResourceManager:
/* 8030467C 003002DC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80304680 003002E0  7C 08 02 A6 */	mflr r0
/* 80304684 003002E4  2C 05 00 00 */	cmpwi r5, 0
/* 80304688 003002E8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030468C 003002EC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80304690 003002F0  7C BF 2B 78 */	mr r31, r5
/* 80304694 003002F4  40 82 00 0C */	bne lbl_803046A0
/* 80304698 003002F8  38 60 FF FD */	li r3, -3
/* 8030469C 003002FC  48 00 00 44 */	b lbl_803046E0
lbl_803046A0:
/* 803046A0 00300300  7C 83 23 78 */	mr r3, r4
/* 803046A4 00300304  7C C4 33 78 */	mr r4, r6
/* 803046A8 00300308  4B F9 EA B1 */	bl IOS_Open
/* 803046AC 0030030C  2C 03 00 00 */	cmpwi r3, 0
/* 803046B0 00300310  90 7F 00 00 */	stw r3, 0(r31)
/* 803046B4 00300314  40 80 00 28 */	bge lbl_803046DC
/* 803046B8 00300318  2C 03 FF FA */	cmpwi r3, -6
/* 803046BC 0030031C  40 82 00 0C */	bne lbl_803046C8
/* 803046C0 00300320  38 60 FF E3 */	li r3, -29
/* 803046C4 00300324  48 00 00 1C */	b lbl_803046E0
lbl_803046C8:
/* 803046C8 00300328  2C 03 FF F8 */	cmpwi r3, -8
/* 803046CC 0030032C  38 60 FF D6 */	li r3, -42
/* 803046D0 00300330  40 82 00 10 */	bne lbl_803046E0
/* 803046D4 00300334  38 60 FF E6 */	li r3, -26
/* 803046D8 00300338  48 00 00 08 */	b lbl_803046E0
lbl_803046DC:
/* 803046DC 0030033C  38 60 00 00 */	li r3, 0
lbl_803046E0:
/* 803046E0 00300340  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803046E4 00300344  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803046E8 00300348  7C 08 03 A6 */	mtlr r0
/* 803046EC 0030034C  38 21 00 10 */	addi r1, r1, 0x10
/* 803046F0 00300350  4E 80 00 20 */	blr

.global NWC24iCloseResourceManager
NWC24iCloseResourceManager:
/* 803046F4 00300354  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803046F8 00300358  7C 08 02 A6 */	mflr r0
/* 803046FC 0030035C  7C 83 23 78 */	mr r3, r4
/* 80304700 00300360  90 01 00 14 */	stw r0, 0x14(r1)
/* 80304704 00300364  4B F9 EC 35 */	bl IOS_Close
/* 80304708 00300368  2C 03 00 00 */	cmpwi r3, 0
/* 8030470C 0030036C  38 60 00 00 */	li r3, 0
/* 80304710 00300370  40 80 00 08 */	bge lbl_80304718
/* 80304714 00300374  38 60 FF D6 */	li r3, -42
lbl_80304718:
/* 80304718 00300378  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8030471C 0030037C  7C 08 03 A6 */	mtlr r0
/* 80304720 00300380  38 21 00 10 */	addi r1, r1, 0x10
/* 80304724 00300384  4E 80 00 20 */	blr

.global NWC24iIoctlResourceManager
NWC24iIoctlResourceManager:
/* 80304728 00300388  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030472C 0030038C  7C 08 02 A6 */	mflr r0
/* 80304730 00300390  7C 83 23 78 */	mr r3, r4
/* 80304734 00300394  7C A4 2B 78 */	mr r4, r5
/* 80304738 00300398  90 01 00 14 */	stw r0, 0x14(r1)
/* 8030473C 0030039C  7C C5 33 78 */	mr r5, r6
/* 80304740 003003A0  7C E6 3B 78 */	mr r6, r7
/* 80304744 003003A4  7D 07 43 78 */	mr r7, r8
/* 80304748 003003A8  7D 28 4B 78 */	mr r8, r9
/* 8030474C 003003AC  4B F9 F3 A5 */	bl IOS_Ioctl
/* 80304750 003003B0  2C 03 00 00 */	cmpwi r3, 0
/* 80304754 003003B4  38 60 00 00 */	li r3, 0
/* 80304758 003003B8  40 80 00 08 */	bge lbl_80304760
/* 8030475C 003003BC  38 60 FF D6 */	li r3, -42
lbl_80304760:
/* 80304760 003003C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80304764 003003C4  7C 08 03 A6 */	mtlr r0
/* 80304768 003003C8  38 21 00 10 */	addi r1, r1, 0x10
/* 8030476C 003003CC  4E 80 00 20 */	blr

.global NWC24iIoctlResourceManagerAsync
NWC24iIoctlResourceManagerAsync:
/* 80304770 003003D0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80304774 003003D4  7C 08 02 A6 */	mflr r0
/* 80304778 003003D8  7C 83 23 78 */	mr r3, r4
/* 8030477C 003003DC  7C A4 2B 78 */	mr r4, r5
/* 80304780 003003E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80304784 003003E4  3D 60 80 30 */	lis r11, CallbackAsyncIpc@ha
/* 80304788 003003E8  7C C5 33 78 */	mr r5, r6
/* 8030478C 003003EC  7C E6 3B 78 */	mr r6, r7
/* 80304790 003003F0  7D 07 43 78 */	mr r7, r8
/* 80304794 003003F4  7D 28 4B 78 */	mr r8, r9
/* 80304798 003003F8  39 2B 47 D4 */	addi r9, r11, CallbackAsyncIpc@l
/* 8030479C 003003FC  4B F9 F2 1D */	bl IOS_IoctlAsync
/* 803047A0 00300400  2C 03 00 00 */	cmpwi r3, 0
/* 803047A4 00300404  40 80 00 0C */	bge lbl_803047B0
/* 803047A8 00300408  38 60 FF D6 */	li r3, -42
/* 803047AC 0030040C  48 00 00 10 */	b lbl_803047BC
lbl_803047B0:
/* 803047B0 00300410  38 00 00 01 */	li r0, 1
/* 803047B4 00300414  38 60 00 00 */	li r3, 0
/* 803047B8 00300418  90 0D AF C8 */	stw r0, lbl_80640288-_SDA_BASE_(r13)
lbl_803047BC:
/* 803047BC 0030041C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803047C0 00300420  7C 08 03 A6 */	mtlr r0
/* 803047C4 00300424  38 21 00 10 */	addi r1, r1, 0x10
/* 803047C8 00300428  4E 80 00 20 */	blr

.global NWC24iIsAsyncRequestPending
NWC24iIsAsyncRequestPending:
/* 803047CC 0030042C  80 6D AF C8 */	lwz r3, lbl_80640288-_SDA_BASE_(r13)
/* 803047D0 00300430  4E 80 00 20 */	blr

CallbackAsyncIpc:
/* 803047D4 00300434  2C 04 00 00 */	cmpwi r4, 0
/* 803047D8 00300438  41 82 00 08 */	beq lbl_803047E0
/* 803047DC 0030043C  90 64 00 00 */	stw r3, 0(r4)
lbl_803047E0:
/* 803047E0 00300440  38 00 00 00 */	li r0, 0
/* 803047E4 00300444  38 60 00 00 */	li r3, 0
/* 803047E8 00300448  90 0D AF C8 */	stw r0, lbl_80640288-_SDA_BASE_(r13)
/* 803047EC 0030044C  4E 80 00 20 */	blr
