.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global VFIsAvailable
VFIsAvailable:
/* 8031A4A0 00316100  80 6D AF E8 */	lwz r3, lbl_806402A8-_SDA_BASE_(r13)
/* 8031A4A4 00316104  7C 03 00 D0 */	neg r0, r3
/* 8031A4A8 00316108  7C 00 1B 78 */	or r0, r0, r3
/* 8031A4AC 0031610C  54 03 0F FE */	srwi r3, r0, 0x1f
/* 8031A4B0 00316110  4E 80 00 20 */	blr

.global VFInit
VFInit:
/* 8031A4B4 00316114  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8031A4B8 00316118  7C 08 02 A6 */	mflr r0
/* 8031A4BC 0031611C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031A4C0 00316120  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A4C4 00316124  2C 00 00 00 */	cmpwi r0, 0
/* 8031A4C8 00316128  40 82 00 18 */	bne lbl_8031A4E0
/* 8031A4CC 0031612C  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A4D0 00316130  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A4D4 00316134  4B F5 54 3D */	bl OSInitMutex
/* 8031A4D8 00316138  38 00 00 01 */	li r0, 1
/* 8031A4DC 0031613C  90 0D AF EC */	stw r0, lbl_806402AC-_SDA_BASE_(r13)
lbl_8031A4E0:
/* 8031A4E0 00316140  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A4E4 00316144  2C 00 00 00 */	cmpwi r0, 0
/* 8031A4E8 00316148  41 82 00 10 */	beq lbl_8031A4F8
/* 8031A4EC 0031614C  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A4F0 00316150  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A4F4 00316154  4B F5 54 55 */	bl OSLockMutex
lbl_8031A4F8:
/* 8031A4F8 00316158  80 0D AF E8 */	lwz r0, lbl_806402A8-_SDA_BASE_(r13)
/* 8031A4FC 0031615C  2C 00 00 00 */	cmpwi r0, 0
/* 8031A500 00316160  40 82 00 3C */	bne lbl_8031A53C
/* 8031A504 00316164  38 00 00 01 */	li r0, 1
/* 8031A508 00316168  3C 60 80 5A */	lis r3, lbl_805A75A0@ha
/* 8031A50C 0031616C  3C 80 00 07 */	lis r4, 0x00068000@ha
/* 8031A510 00316170  90 0D AF E8 */	stw r0, lbl_806402A8-_SDA_BASE_(r13)
/* 8031A514 00316174  38 63 75 A0 */	addi r3, r3, lbl_805A75A0@l
/* 8031A518 00316178  38 84 80 00 */	addi r4, r4, 0x00068000@l
/* 8031A51C 0031617C  48 00 07 05 */	bl VFSysInit
/* 8031A520 00316180  38 60 00 00 */	li r3, 0
/* 8031A524 00316184  38 80 00 00 */	li r4, 0
/* 8031A528 00316188  4B FE E8 89 */	bl VFipdm_init_diskmanager
/* 8031A52C 0031618C  38 60 00 00 */	li r3, 0
/* 8031A530 00316190  38 80 00 00 */	li r4, 0
/* 8031A534 00316194  4B FF FE A1 */	bl VFipf2_init_prfile2
/* 8031A538 00316198  48 00 13 25 */	bl dHash_InitHashTable
lbl_8031A53C:
/* 8031A53C 0031619C  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A540 003161A0  2C 00 00 00 */	cmpwi r0, 0
/* 8031A544 003161A4  41 82 00 10 */	beq lbl_8031A554
/* 8031A548 003161A8  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A54C 003161AC  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A550 003161B0  4B F5 54 D5 */	bl OSUnlockMutex
lbl_8031A554:
/* 8031A554 003161B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8031A558 003161B8  7C 08 03 A6 */	mtlr r0
/* 8031A55C 003161BC  38 21 00 10 */	addi r1, r1, 0x10
/* 8031A560 003161C0  4E 80 00 20 */	blr

.global VFFinalize
VFFinalize:
/* 8031A564 003161C4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8031A568 003161C8  7C 08 02 A6 */	mflr r0
/* 8031A56C 003161CC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031A570 003161D0  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A574 003161D4  2C 00 00 00 */	cmpwi r0, 0
/* 8031A578 003161D8  41 82 00 10 */	beq lbl_8031A588
/* 8031A57C 003161DC  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A580 003161E0  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A584 003161E4  4B F5 53 C5 */	bl OSLockMutex
lbl_8031A588:
/* 8031A588 003161E8  80 0D AF E8 */	lwz r0, lbl_806402A8-_SDA_BASE_(r13)
/* 8031A58C 003161EC  2C 00 00 00 */	cmpwi r0, 0
/* 8031A590 003161F0  41 82 00 10 */	beq lbl_8031A5A0
/* 8031A594 003161F4  48 00 08 11 */	bl VFSysFinalize
/* 8031A598 003161F8  38 00 00 00 */	li r0, 0
/* 8031A59C 003161FC  90 0D AF E8 */	stw r0, lbl_806402A8-_SDA_BASE_(r13)
lbl_8031A5A0:
/* 8031A5A0 00316200  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A5A4 00316204  2C 00 00 00 */	cmpwi r0, 0
/* 8031A5A8 00316208  41 82 00 10 */	beq lbl_8031A5B8
/* 8031A5AC 0031620C  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A5B0 00316210  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A5B4 00316214  4B F5 54 71 */	bl OSUnlockMutex
lbl_8031A5B8:
/* 8031A5B8 00316218  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8031A5BC 0031621C  7C 08 03 A6 */	mtlr r0
/* 8031A5C0 00316220  38 21 00 10 */	addi r1, r1, 0x10
/* 8031A5C4 00316224  4E 80 00 20 */	blr

.global VF_path2handleidx
VF_path2handleidx:
/* 8031A5C8 00316228  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8031A5CC 0031622C  7C 08 02 A6 */	mflr r0
/* 8031A5D0 00316230  38 A0 00 08 */	li r5, 8
/* 8031A5D4 00316234  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031A5D8 00316238  38 00 FF FF */	li r0, -1
/* 8031A5DC 0031623C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8031A5E0 00316240  7C 9F 23 78 */	mr r31, r4
/* 8031A5E4 00316244  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8031A5E8 00316248  3B C0 00 00 */	li r30, 0
/* 8031A5EC 0031624C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8031A5F0 00316250  7C 9D 23 78 */	mr r29, r4
/* 8031A5F4 00316254  38 80 00 00 */	li r4, 0
/* 8031A5F8 00316258  93 81 00 10 */	stw r28, 0x10(r1)
/* 8031A5FC 0031625C  7C 7C 1B 78 */	mr r28, r3
/* 8031A600 00316260  90 03 00 00 */	stw r0, 0(r3)
/* 8031A604 00316264  38 61 00 08 */	addi r3, r1, 8
/* 8031A608 00316268  4B FE A9 CD */	bl VFipf_memset
/* 8031A60C 0031626C  38 61 00 08 */	addi r3, r1, 8
/* 8031A610 00316270  48 00 00 64 */	b lbl_8031A674
lbl_8031A614:
/* 8031A614 00316274  7C 80 07 74 */	extsb r0, r4
/* 8031A618 00316278  2C 00 00 5C */	cmpwi r0, 0x5c
/* 8031A61C 0031627C  41 82 00 64 */	beq lbl_8031A680
/* 8031A620 00316280  2C 00 00 2F */	cmpwi r0, 0x2f
/* 8031A624 00316284  41 82 00 5C */	beq lbl_8031A680
/* 8031A628 00316288  2C 00 00 3A */	cmpwi r0, 0x3a
/* 8031A62C 0031628C  40 82 00 30 */	bne lbl_8031A65C
/* 8031A630 00316290  38 61 00 08 */	addi r3, r1, 8
/* 8031A634 00316294  48 00 14 BD */	bl dHash_GetArg
/* 8031A638 00316298  2C 03 FF FF */	cmpwi r3, -1
/* 8031A63C 0031629C  90 7C 00 00 */	stw r3, 0(r28)
/* 8031A640 003162A0  41 82 00 0C */	beq lbl_8031A64C
/* 8031A644 003162A4  2C 1E 00 07 */	cmpwi r30, 7
/* 8031A648 003162A8  40 81 00 0C */	ble lbl_8031A654
lbl_8031A64C:
/* 8031A64C 003162AC  3B A0 00 00 */	li r29, 0
/* 8031A650 003162B0  48 00 00 30 */	b lbl_8031A680
lbl_8031A654:
/* 8031A654 003162B4  3B BF 00 01 */	addi r29, r31, 1
/* 8031A658 003162B8  48 00 00 28 */	b lbl_8031A680
lbl_8031A65C:
/* 8031A65C 003162BC  2C 1E 00 07 */	cmpwi r30, 7
/* 8031A660 003162C0  40 80 00 08 */	bge lbl_8031A668
/* 8031A664 003162C4  98 83 00 00 */	stb r4, 0(r3)
lbl_8031A668:
/* 8031A668 003162C8  3B FF 00 01 */	addi r31, r31, 1
/* 8031A66C 003162CC  38 63 00 01 */	addi r3, r3, 1
/* 8031A670 003162D0  3B DE 00 01 */	addi r30, r30, 1
lbl_8031A674:
/* 8031A674 003162D4  88 9F 00 00 */	lbz r4, 0(r31)
/* 8031A678 003162D8  7C 80 07 75 */	extsb. r0, r4
/* 8031A67C 003162DC  40 82 FF 98 */	bne lbl_8031A614
lbl_8031A680:
/* 8031A680 003162E0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8031A684 003162E4  7F A3 EB 78 */	mr r3, r29
/* 8031A688 003162E8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8031A68C 003162EC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8031A690 003162F0  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8031A694 003162F4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8031A698 003162F8  7C 08 03 A6 */	mtlr r0
/* 8031A69C 003162FC  38 21 00 20 */	addi r1, r1, 0x20
/* 8031A6A0 00316300  4E 80 00 20 */	blr

.global VFOpenFile
VFOpenFile:
/* 8031A6A4 00316304  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8031A6A8 00316308  7C 08 02 A6 */	mflr r0
/* 8031A6AC 0031630C  38 A0 FF FF */	li r5, -1
/* 8031A6B0 00316310  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031A6B4 00316314  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8031A6B8 00316318  7C 9F 23 78 */	mr r31, r4
/* 8031A6BC 0031631C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8031A6C0 00316320  7C 7E 1B 78 */	mr r30, r3
/* 8031A6C4 00316324  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A6C8 00316328  90 A1 00 08 */	stw r5, 8(r1)
/* 8031A6CC 0031632C  2C 00 00 00 */	cmpwi r0, 0
/* 8031A6D0 00316330  41 82 00 10 */	beq lbl_8031A6E0
/* 8031A6D4 00316334  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A6D8 00316338  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A6DC 0031633C  4B F5 52 6D */	bl OSLockMutex
lbl_8031A6E0:
/* 8031A6E0 00316340  7F C4 F3 78 */	mr r4, r30
/* 8031A6E4 00316344  38 61 00 08 */	addi r3, r1, 8
/* 8031A6E8 00316348  4B FF FE E1 */	bl VF_path2handleidx
/* 8031A6EC 0031634C  2C 03 00 00 */	cmpwi r3, 0
/* 8031A6F0 00316350  7C 64 1B 78 */	mr r4, r3
/* 8031A6F4 00316354  40 82 00 30 */	bne lbl_8031A724
/* 8031A6F8 00316358  3C 60 00 01 */	lis r3, 0x0000B003@ha
/* 8031A6FC 0031635C  38 63 B0 03 */	addi r3, r3, 0x0000B003@l
/* 8031A700 00316360  48 00 03 6D */	bl VFSysSetLastError
/* 8031A704 00316364  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A708 00316368  2C 00 00 00 */	cmpwi r0, 0
/* 8031A70C 0031636C  41 82 00 10 */	beq lbl_8031A71C
/* 8031A710 00316370  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A714 00316374  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A718 00316378  4B F5 53 0D */	bl OSUnlockMutex
lbl_8031A71C:
/* 8031A71C 0031637C  38 60 00 00 */	li r3, 0
/* 8031A720 00316380  48 00 00 48 */	b lbl_8031A768
lbl_8031A724:
/* 8031A724 00316384  80 01 00 08 */	lwz r0, 8(r1)
/* 8031A728 00316388  2C 00 FF FF */	cmpwi r0, -1
/* 8031A72C 0031638C  41 82 00 14 */	beq lbl_8031A740
/* 8031A730 00316390  7C 03 03 78 */	mr r3, r0
/* 8031A734 00316394  7F E5 FB 78 */	mr r5, r31
/* 8031A738 00316398  48 00 08 E5 */	bl VFSysOpenFile
/* 8031A73C 0031639C  48 00 00 0C */	b lbl_8031A748
lbl_8031A740:
/* 8031A740 003163A0  7F E4 FB 78 */	mr r4, r31
/* 8031A744 003163A4  48 00 07 ED */	bl VFSysOpenFile_current
lbl_8031A748:
/* 8031A748 003163A8  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A74C 003163AC  7C 7F 1B 78 */	mr r31, r3
/* 8031A750 003163B0  2C 00 00 00 */	cmpwi r0, 0
/* 8031A754 003163B4  41 82 00 10 */	beq lbl_8031A764
/* 8031A758 003163B8  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A75C 003163BC  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A760 003163C0  4B F5 52 C5 */	bl OSUnlockMutex
lbl_8031A764:
/* 8031A764 003163C4  7F E3 FB 78 */	mr r3, r31
lbl_8031A768:
/* 8031A768 003163C8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8031A76C 003163CC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8031A770 003163D0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8031A774 003163D4  7C 08 03 A6 */	mtlr r0
/* 8031A778 003163D8  38 21 00 20 */	addi r1, r1, 0x20
/* 8031A77C 003163DC  4E 80 00 20 */	blr

.global VFCloseFile
VFCloseFile:
/* 8031A780 003163E0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8031A784 003163E4  7C 08 02 A6 */	mflr r0
/* 8031A788 003163E8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031A78C 003163EC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8031A790 003163F0  7C 7F 1B 78 */	mr r31, r3
/* 8031A794 003163F4  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A798 003163F8  2C 00 00 00 */	cmpwi r0, 0
/* 8031A79C 003163FC  41 82 00 10 */	beq lbl_8031A7AC
/* 8031A7A0 00316400  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A7A4 00316404  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A7A8 00316408  4B F5 51 A1 */	bl OSLockMutex
lbl_8031A7AC:
/* 8031A7AC 0031640C  7F E3 FB 78 */	mr r3, r31
/* 8031A7B0 00316410  48 00 09 A9 */	bl VFSysCloseFile
/* 8031A7B4 00316414  7C 7F 1B 78 */	mr r31, r3
/* 8031A7B8 00316418  48 00 02 B5 */	bl VFSysSetLastError
/* 8031A7BC 0031641C  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A7C0 00316420  2C 00 00 00 */	cmpwi r0, 0
/* 8031A7C4 00316424  41 82 00 10 */	beq lbl_8031A7D4
/* 8031A7C8 00316428  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A7CC 0031642C  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A7D0 00316430  4B F5 52 55 */	bl OSUnlockMutex
lbl_8031A7D4:
/* 8031A7D4 00316434  7F E3 FB 78 */	mr r3, r31
/* 8031A7D8 00316438  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8031A7DC 0031643C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8031A7E0 00316440  7C 08 03 A6 */	mtlr r0
/* 8031A7E4 00316444  38 21 00 10 */	addi r1, r1, 0x10
/* 8031A7E8 00316448  4E 80 00 20 */	blr

.global VFSeekFile
VFSeekFile:
/* 8031A7EC 0031644C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8031A7F0 00316450  7C 08 02 A6 */	mflr r0
/* 8031A7F4 00316454  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031A7F8 00316458  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8031A7FC 0031645C  7C BF 2B 78 */	mr r31, r5
/* 8031A800 00316460  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8031A804 00316464  7C 9E 23 78 */	mr r30, r4
/* 8031A808 00316468  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8031A80C 0031646C  7C 7D 1B 78 */	mr r29, r3
/* 8031A810 00316470  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A814 00316474  2C 00 00 00 */	cmpwi r0, 0
/* 8031A818 00316478  41 82 00 10 */	beq lbl_8031A828
/* 8031A81C 0031647C  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A820 00316480  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A824 00316484  4B F5 51 25 */	bl OSLockMutex
lbl_8031A828:
/* 8031A828 00316488  7F A3 EB 78 */	mr r3, r29
/* 8031A82C 0031648C  7F C4 F3 78 */	mr r4, r30
/* 8031A830 00316490  7F E5 FB 78 */	mr r5, r31
/* 8031A834 00316494  48 00 0A 0D */	bl VFSysSeekFile
/* 8031A838 00316498  7C 7F 1B 78 */	mr r31, r3
/* 8031A83C 0031649C  48 00 02 31 */	bl VFSysSetLastError
/* 8031A840 003164A0  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A844 003164A4  2C 00 00 00 */	cmpwi r0, 0
/* 8031A848 003164A8  41 82 00 10 */	beq lbl_8031A858
/* 8031A84C 003164AC  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A850 003164B0  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A854 003164B4  4B F5 51 D1 */	bl OSUnlockMutex
lbl_8031A858:
/* 8031A858 003164B8  7F E3 FB 78 */	mr r3, r31
/* 8031A85C 003164BC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8031A860 003164C0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8031A864 003164C4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8031A868 003164C8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8031A86C 003164CC  7C 08 03 A6 */	mtlr r0
/* 8031A870 003164D0  38 21 00 20 */	addi r1, r1, 0x20
/* 8031A874 003164D4  4E 80 00 20 */	blr

.global VFReadFile
VFReadFile:
/* 8031A878 003164D8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8031A87C 003164DC  7C 08 02 A6 */	mflr r0
/* 8031A880 003164E0  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031A884 003164E4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8031A888 003164E8  7C DF 33 78 */	mr r31, r6
/* 8031A88C 003164EC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8031A890 003164F0  7C BE 2B 78 */	mr r30, r5
/* 8031A894 003164F4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8031A898 003164F8  7C 9D 23 78 */	mr r29, r4
/* 8031A89C 003164FC  93 81 00 10 */	stw r28, 0x10(r1)
/* 8031A8A0 00316500  7C 7C 1B 78 */	mr r28, r3
/* 8031A8A4 00316504  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A8A8 00316508  2C 00 00 00 */	cmpwi r0, 0
/* 8031A8AC 0031650C  41 82 00 10 */	beq lbl_8031A8BC
/* 8031A8B0 00316510  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A8B4 00316514  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A8B8 00316518  4B F5 50 91 */	bl OSLockMutex
lbl_8031A8BC:
/* 8031A8BC 0031651C  7F E3 FB 78 */	mr r3, r31
/* 8031A8C0 00316520  7F A4 EB 78 */	mr r4, r29
/* 8031A8C4 00316524  7F C5 F3 78 */	mr r5, r30
/* 8031A8C8 00316528  7F 86 E3 78 */	mr r6, r28
/* 8031A8CC 0031652C  48 00 0A 7D */	bl VFSysReadFile
/* 8031A8D0 00316530  7C 7F 1B 78 */	mr r31, r3
/* 8031A8D4 00316534  48 00 01 99 */	bl VFSysSetLastError
/* 8031A8D8 00316538  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A8DC 0031653C  2C 00 00 00 */	cmpwi r0, 0
/* 8031A8E0 00316540  41 82 00 10 */	beq lbl_8031A8F0
/* 8031A8E4 00316544  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A8E8 00316548  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A8EC 0031654C  4B F5 51 39 */	bl OSUnlockMutex
lbl_8031A8F0:
/* 8031A8F0 00316550  7F E3 FB 78 */	mr r3, r31
/* 8031A8F4 00316554  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8031A8F8 00316558  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8031A8FC 0031655C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8031A900 00316560  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8031A904 00316564  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8031A908 00316568  7C 08 03 A6 */	mtlr r0
/* 8031A90C 0031656C  38 21 00 20 */	addi r1, r1, 0x20
/* 8031A910 00316570  4E 80 00 20 */	blr

.global VFWriteFile
VFWriteFile:
/* 8031A914 00316574  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8031A918 00316578  7C 08 02 A6 */	mflr r0
/* 8031A91C 0031657C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8031A920 00316580  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8031A924 00316584  7C BF 2B 78 */	mr r31, r5
/* 8031A928 00316588  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8031A92C 0031658C  7C 9E 23 78 */	mr r30, r4
/* 8031A930 00316590  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8031A934 00316594  7C 7D 1B 78 */	mr r29, r3
/* 8031A938 00316598  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A93C 0031659C  2C 00 00 00 */	cmpwi r0, 0
/* 8031A940 003165A0  41 82 00 10 */	beq lbl_8031A950
/* 8031A944 003165A4  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A948 003165A8  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A94C 003165AC  4B F5 4F FD */	bl OSLockMutex
lbl_8031A950:
/* 8031A950 003165B0  7F C3 F3 78 */	mr r3, r30
/* 8031A954 003165B4  7F E4 FB 78 */	mr r4, r31
/* 8031A958 003165B8  7F A5 EB 78 */	mr r5, r29
/* 8031A95C 003165BC  48 00 0B 65 */	bl VFSysWriteFile
/* 8031A960 003165C0  7C 7F 1B 78 */	mr r31, r3
/* 8031A964 003165C4  48 00 01 09 */	bl VFSysSetLastError
/* 8031A968 003165C8  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A96C 003165CC  2C 00 00 00 */	cmpwi r0, 0
/* 8031A970 003165D0  41 82 00 10 */	beq lbl_8031A980
/* 8031A974 003165D4  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031A978 003165D8  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031A97C 003165DC  4B F5 50 A9 */	bl OSUnlockMutex
lbl_8031A980:
/* 8031A980 003165E0  7F E3 FB 78 */	mr r3, r31
/* 8031A984 003165E4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8031A988 003165E8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8031A98C 003165EC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8031A990 003165F0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8031A994 003165F4  7C 08 03 A6 */	mtlr r0
/* 8031A998 003165F8  38 21 00 20 */	addi r1, r1, 0x20
/* 8031A99C 003165FC  4E 80 00 20 */	blr

.global VFGetFileSizeByFd
VFGetFileSizeByFd:
/* 8031A9A0 00316600  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8031A9A4 00316604  7C 08 02 A6 */	mflr r0
/* 8031A9A8 00316608  7C 64 1B 78 */	mr r4, r3
/* 8031A9AC 0031660C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031A9B0 00316610  38 00 FF FF */	li r0, -1
/* 8031A9B4 00316614  38 61 00 08 */	addi r3, r1, 8
/* 8031A9B8 00316618  90 01 00 08 */	stw r0, 8(r1)
/* 8031A9BC 0031661C  48 00 0C 11 */	bl VFSysGetFileSizeByFd
/* 8031A9C0 00316620  2C 03 00 00 */	cmpwi r3, 0
/* 8031A9C4 00316624  41 82 00 08 */	beq lbl_8031A9CC
/* 8031A9C8 00316628  48 00 00 A5 */	bl VFSysSetLastError
lbl_8031A9CC:
/* 8031A9CC 0031662C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8031A9D0 00316630  80 61 00 08 */	lwz r3, 8(r1)
/* 8031A9D4 00316634  7C 08 03 A6 */	mtlr r0
/* 8031A9D8 00316638  38 21 00 10 */	addi r1, r1, 0x10
/* 8031A9DC 0031663C  4E 80 00 20 */	blr

.global VFGetLastError
VFGetLastError:
/* 8031A9E0 00316640  48 00 0C 54 */	b VFSysGetLastError

.global VFGetLastDeviceError
VFGetLastDeviceError:
/* 8031A9E4 00316644  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8031A9E8 00316648  7C 08 02 A6 */	mflr r0
/* 8031A9EC 0031664C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8031A9F0 00316650  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8031A9F4 00316654  7C 7F 1B 78 */	mr r31, r3
/* 8031A9F8 00316658  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031A9FC 0031665C  2C 00 00 00 */	cmpwi r0, 0
/* 8031AA00 00316660  41 82 00 10 */	beq lbl_8031AA10
/* 8031AA04 00316664  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031AA08 00316668  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031AA0C 0031666C  4B F5 4F 3D */	bl OSLockMutex
lbl_8031AA10:
/* 8031AA10 00316670  2C 1F 00 00 */	cmpwi r31, 0
/* 8031AA14 00316674  41 82 00 18 */	beq lbl_8031AA2C
/* 8031AA18 00316678  7F E3 FB 78 */	mr r3, r31
/* 8031AA1C 0031667C  48 00 10 D5 */	bl dHash_GetArg
/* 8031AA20 00316680  48 00 0C C9 */	bl VFSysGetLastDeviceError
/* 8031AA24 00316684  7C 7F 1B 78 */	mr r31, r3
/* 8031AA28 00316688  48 00 00 0C */	b lbl_8031AA34
lbl_8031AA2C:
/* 8031AA2C 0031668C  48 00 0C 11 */	bl VFSysGetLastDeviceError_current
/* 8031AA30 00316690  7C 7F 1B 78 */	mr r31, r3
lbl_8031AA34:
/* 8031AA34 00316694  7F E3 FB 78 */	mr r3, r31
/* 8031AA38 00316698  48 00 00 35 */	bl VFSysSetLastError
/* 8031AA3C 0031669C  80 0D AF EC */	lwz r0, lbl_806402AC-_SDA_BASE_(r13)
/* 8031AA40 003166A0  2C 00 00 00 */	cmpwi r0, 0
/* 8031AA44 003166A4  41 82 00 10 */	beq lbl_8031AA54
/* 8031AA48 003166A8  3C 60 80 5A */	lis r3, lbl_805A7580@ha
/* 8031AA4C 003166AC  38 63 75 80 */	addi r3, r3, lbl_805A7580@l
/* 8031AA50 003166B0  4B F5 4F D5 */	bl OSUnlockMutex
lbl_8031AA54:
/* 8031AA54 003166B4  7F E3 FB 78 */	mr r3, r31
/* 8031AA58 003166B8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8031AA5C 003166BC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8031AA60 003166C0  7C 08 03 A6 */	mtlr r0
/* 8031AA64 003166C4  38 21 00 10 */	addi r1, r1, 0x10
/* 8031AA68 003166C8  4E 80 00 20 */	blr
