.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global func_8004D724
func_8004D724:
/* 8004D724 00049384  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004D728 00049388  7C 08 02 A6 */	mflr r0
/* 8004D72C 0004938C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004D730 00049390  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004D734 00049394  83 ED 98 30 */	lwz r31, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D738 00049398  2C 1F 00 00 */	cmpwi r31, 0
/* 8004D73C 0004939C  41 82 00 80 */	beq lbl_8004D7BC
/* 8004D740 000493A0  41 82 00 7C */	beq lbl_8004D7BC
/* 8004D744 000493A4  34 7F 35 10 */	addic. r3, r31, 0x3510
/* 8004D748 000493A8  41 82 00 18 */	beq lbl_8004D760
/* 8004D74C 000493AC  3C 80 80 05 */	lis r4, lbl_8004ED5C@ha
/* 8004D750 000493B0  38 A0 00 08 */	li r5, 8
/* 8004D754 000493B4  38 84 ED 5C */	addi r4, r4, lbl_8004ED5C@l
/* 8004D758 000493B8  38 C0 00 20 */	li r6, 0x20
/* 8004D75C 000493BC  48 17 98 05 */	bl __destroy_arr
lbl_8004D760:
/* 8004D760 000493C0  38 7F 34 C0 */	addi r3, r31, 0x34c0
/* 8004D764 000493C4  38 80 FF FF */	li r4, -1
/* 8004D768 000493C8  48 00 12 D9 */	bl func_8004EA40
/* 8004D76C 000493CC  3C 80 80 05 */	lis r4, lbl_8004DEF8@ha
/* 8004D770 000493D0  38 7F 27 C0 */	addi r3, r31, 0x27c0
/* 8004D774 000493D4  38 84 DE F8 */	addi r4, r4, lbl_8004DEF8@l
/* 8004D778 000493D8  38 A0 00 68 */	li r5, 0x68
/* 8004D77C 000493DC  38 C0 00 20 */	li r6, 0x20
/* 8004D780 000493E0  48 17 97 E1 */	bl __destroy_arr
/* 8004D784 000493E4  3C 80 80 04 */	lis r4, lbl_80047908@ha
/* 8004D788 000493E8  38 7F 1D 40 */	addi r3, r31, 0x1d40
/* 8004D78C 000493EC  38 84 79 08 */	addi r4, r4, lbl_80047908@l
/* 8004D790 000493F0  38 A0 00 38 */	li r5, 0x38
/* 8004D794 000493F4  38 C0 00 30 */	li r6, 0x30
/* 8004D798 000493F8  48 17 97 C9 */	bl __destroy_arr
/* 8004D79C 000493FC  3C 80 80 05 */	lis r4, lbl_80048748@ha
/* 8004D7A0 00049400  7F E3 FB 78 */	mr r3, r31
/* 8004D7A4 00049404  38 84 87 48 */	addi r4, r4, lbl_80048748@l
/* 8004D7A8 00049408  38 A0 00 9C */	li r5, 0x9c
/* 8004D7AC 0004940C  38 C0 00 30 */	li r6, 0x30
/* 8004D7B0 00049410  48 17 97 B1 */	bl __destroy_arr
/* 8004D7B4 00049414  7F E3 FB 78 */	mr r3, r31
/* 8004D7B8 00049418  48 18 D3 01 */	bl __dl__FPv
lbl_8004D7BC:
/* 8004D7BC 0004941C  38 60 36 94 */	li r3, 0x3694
/* 8004D7C0 00049420  48 18 D2 71 */	bl __nw__FUl
/* 8004D7C4 00049424  2C 03 00 00 */	cmpwi r3, 0
/* 8004D7C8 00049428  41 82 00 08 */	beq lbl_8004D7D0
/* 8004D7CC 0004942C  48 00 00 91 */	bl func_8004D85C
lbl_8004D7D0:
/* 8004D7D0 00049430  3C 80 80 05 */	lis r4, lbl_8004D814@ha
/* 8004D7D4 00049434  3C A0 80 05 */	lis r5, lbl_8004D848@ha
/* 8004D7D8 00049438  90 6D 98 30 */	stw r3, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D7DC 0004943C  38 84 D8 14 */	addi r4, r4, lbl_8004D814@l
/* 8004D7E0 00049440  80 6D A4 B8 */	lwz r3, lbl_8063F778-_SDA_BASE_(r13)
/* 8004D7E4 00049444  38 A5 D8 48 */	addi r5, r5, lbl_8004D848@l
/* 8004D7E8 00049448  38 C0 00 03 */	li r6, 3
/* 8004D7EC 0004944C  38 E0 00 0C */	li r7, 0xc
/* 8004D7F0 00049450  48 1F 13 69 */	bl func_8023EB58
/* 8004D7F4 00049454  48 00 11 2D */	bl func_8004E920
/* 8004D7F8 00049458  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004D7FC 0004945C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004D800 00049460  7C 08 03 A6 */	mtlr r0
/* 8004D804 00049464  38 21 00 10 */	addi r1, r1, 0x10
/* 8004D808 00049468  4E 80 00 20 */	blr

.global func_8004D80C
func_8004D80C:
/* 8004D80C 0004946C  80 6D 98 30 */	lwz r3, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D810 00049470  4E 80 00 20 */	blr
lbl_8004D814:
/* 8004D814 00049474  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004D818 00049478  7C 08 02 A6 */	mflr r0
/* 8004D81C 0004947C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004D820 00049480  80 0D 98 30 */	lwz r0, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D824 00049484  2C 00 00 00 */	cmpwi r0, 0
/* 8004D828 00049488  41 82 00 10 */	beq lbl_8004D838
/* 8004D82C 0004948C  4B FB 9B 71 */	bl func_8000739C
/* 8004D830 00049490  80 6D 98 30 */	lwz r3, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D834 00049494  48 00 01 A5 */	bl func_8004D9D8
lbl_8004D838:
/* 8004D838 00049498  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004D83C 0004949C  7C 08 03 A6 */	mtlr r0
/* 8004D840 000494A0  38 21 00 10 */	addi r1, r1, 0x10
/* 8004D844 000494A4  4E 80 00 20 */	blr
lbl_8004D848:
/* 8004D848 000494A8  80 6D 98 30 */	lwz r3, lbl_8063EAF0-_SDA_BASE_(r13)
/* 8004D84C 000494AC  2C 03 00 00 */	cmpwi r3, 0
/* 8004D850 000494B0  4D 82 00 20 */	beqlr
/* 8004D854 000494B4  48 00 02 30 */	b lbl_8004DA84
/* 8004D858 000494B8  4E 80 00 20 */	blr

.global func_8004D85C
func_8004D85C:
/* 8004D85C 000494BC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004D860 000494C0  7C 08 02 A6 */	mflr r0
/* 8004D864 000494C4  3C 80 80 05 */	lis r4, lbl_80048728@ha
/* 8004D868 000494C8  3C A0 80 05 */	lis r5, lbl_80048748@ha
/* 8004D86C 000494CC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004D870 000494D0  38 C0 00 9C */	li r6, 0x9c
/* 8004D874 000494D4  38 84 87 28 */	addi r4, r4, lbl_80048728@l
/* 8004D878 000494D8  38 A5 87 48 */	addi r5, r5, lbl_80048748@l
/* 8004D87C 000494DC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004D880 000494E0  7C 7F 1B 78 */	mr r31, r3
/* 8004D884 000494E4  38 E0 00 30 */	li r7, 0x30
/* 8004D888 000494E8  48 17 95 E1 */	bl __construct_array
/* 8004D88C 000494EC  3C 80 80 04 */	lis r4, lbl_800478E4@ha
/* 8004D890 000494F0  3C A0 80 04 */	lis r5, lbl_80047908@ha
/* 8004D894 000494F4  38 7F 1D 40 */	addi r3, r31, 0x1d40
/* 8004D898 000494F8  38 C0 00 38 */	li r6, 0x38
/* 8004D89C 000494FC  38 84 78 E4 */	addi r4, r4, lbl_800478E4@l
/* 8004D8A0 00049500  38 A5 79 08 */	addi r5, r5, lbl_80047908@l
/* 8004D8A4 00049504  38 E0 00 30 */	li r7, 0x30
/* 8004D8A8 00049508  48 17 95 C1 */	bl __construct_array
/* 8004D8AC 0004950C  3C 80 80 05 */	lis r4, lbl_8004DE88@ha
/* 8004D8B0 00049510  3C A0 80 05 */	lis r5, lbl_8004DEF8@ha
/* 8004D8B4 00049514  38 7F 27 C0 */	addi r3, r31, 0x27c0
/* 8004D8B8 00049518  38 C0 00 68 */	li r6, 0x68
/* 8004D8BC 0004951C  38 84 DE 88 */	addi r4, r4, lbl_8004DE88@l
/* 8004D8C0 00049520  38 A5 DE F8 */	addi r5, r5, lbl_8004DEF8@l
/* 8004D8C4 00049524  38 E0 00 20 */	li r7, 0x20
/* 8004D8C8 00049528  48 17 95 A1 */	bl __construct_array
/* 8004D8CC 0004952C  38 7F 34 C0 */	addi r3, r31, 0x34c0
/* 8004D8D0 00049530  48 00 11 21 */	bl func_8004E9F0
/* 8004D8D4 00049534  38 7F 35 10 */	addi r3, r31, 0x3510
/* 8004D8D8 00049538  48 00 17 E5 */	bl func_8004F0BC
/* 8004D8DC 0004953C  38 7F 35 10 */	addi r3, r31, 0x3510
/* 8004D8E0 00049540  48 00 18 4D */	bl func_8004F12C
/* 8004D8E4 00049544  7F E3 FB 78 */	mr r3, r31
/* 8004D8E8 00049548  48 00 00 1D */	bl func_8004D904
/* 8004D8EC 0004954C  7F E3 FB 78 */	mr r3, r31
/* 8004D8F0 00049550  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004D8F4 00049554  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004D8F8 00049558  7C 08 03 A6 */	mtlr r0
/* 8004D8FC 0004955C  38 21 00 10 */	addi r1, r1, 0x10
/* 8004D900 00049560  4E 80 00 20 */	blr

.global func_8004D904
func_8004D904:
/* 8004D904 00049564  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004D908 00049568  7C 08 02 A6 */	mflr r0
/* 8004D90C 0004956C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8004D910 00049570  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8004D914 00049574  3B E3 1D 40 */	addi r31, r3, 0x1d40
/* 8004D918 00049578  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8004D91C 0004957C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8004D920 00049580  7C 7D 1B 78 */	mr r29, r3
/* 8004D924 00049584  7F BE EB 78 */	mr r30, r29
/* 8004D928 00049588  48 00 00 10 */	b lbl_8004D938
lbl_8004D92C:
/* 8004D92C 0004958C  7F C3 F3 78 */	mr r3, r30
/* 8004D930 00049590  4B FF AE 6D */	bl func_8004879C
/* 8004D934 00049594  3B DE 00 9C */	addi r30, r30, 0x9c
lbl_8004D938:
/* 8004D938 00049598  7C 1E F8 40 */	cmplw r30, r31
/* 8004D93C 0004959C  40 82 FF F0 */	bne lbl_8004D92C
/* 8004D940 000495A0  7F A3 EB 78 */	mr r3, r29
/* 8004D944 000495A4  48 00 03 89 */	bl func_8004DCCC
/* 8004D948 000495A8  38 7D 35 10 */	addi r3, r29, 0x3510
/* 8004D94C 000495AC  48 00 19 B5 */	bl func_8004F300
/* 8004D950 000495B0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8004D954 000495B4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8004D958 000495B8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8004D95C 000495BC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8004D960 000495C0  7C 08 03 A6 */	mtlr r0
/* 8004D964 000495C4  38 21 00 20 */	addi r1, r1, 0x20
/* 8004D968 000495C8  4E 80 00 20 */	blr

.global func_8004D96C
func_8004D96C:
/* 8004D96C 000495CC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004D970 000495D0  7C 08 02 A6 */	mflr r0
/* 8004D974 000495D4  90 01 00 24 */	stw r0, 0x24(r1)
/* 8004D978 000495D8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8004D97C 000495DC  3B E3 1D 40 */	addi r31, r3, 0x1d40
/* 8004D980 000495E0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8004D984 000495E4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8004D988 000495E8  7C 7D 1B 78 */	mr r29, r3
/* 8004D98C 000495EC  7F BE EB 78 */	mr r30, r29
/* 8004D990 000495F0  48 00 00 1C */	b lbl_8004D9AC
lbl_8004D994:
/* 8004D994 000495F4  80 1E 00 8C */	lwz r0, 0x8c(r30)
/* 8004D998 000495F8  28 00 00 0C */	cmplwi r0, 0xc
/* 8004D99C 000495FC  41 82 00 0C */	beq lbl_8004D9A8
/* 8004D9A0 00049600  7F C3 F3 78 */	mr r3, r30
/* 8004D9A4 00049604  4B FF AD F9 */	bl func_8004879C
lbl_8004D9A8:
/* 8004D9A8 00049608  3B DE 00 9C */	addi r30, r30, 0x9c
lbl_8004D9AC:
/* 8004D9AC 0004960C  7C 1E F8 40 */	cmplw r30, r31
/* 8004D9B0 00049610  40 82 FF E4 */	bne lbl_8004D994
/* 8004D9B4 00049614  7F A3 EB 78 */	mr r3, r29
/* 8004D9B8 00049618  48 00 03 6D */	bl func_8004DD24
/* 8004D9BC 0004961C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8004D9C0 00049620  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8004D9C4 00049624  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8004D9C8 00049628  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8004D9CC 0004962C  7C 08 03 A6 */	mtlr r0
/* 8004D9D0 00049630  38 21 00 20 */	addi r1, r1, 0x20
/* 8004D9D4 00049634  4E 80 00 20 */	blr

.global func_8004D9D8
func_8004D9D8:
/* 8004D9D8 00049638  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004D9DC 0004963C  7C 08 02 A6 */	mflr r0
/* 8004D9E0 00049640  90 01 00 24 */	stw r0, 0x24(r1)
/* 8004D9E4 00049644  DB E1 00 18 */	stfd f31, 0x18(r1)
/* 8004D9E8 00049648  FF E0 08 90 */	fmr f31, f1
/* 8004D9EC 0004964C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8004D9F0 00049650  3B E3 1D 40 */	addi r31, r3, 0x1d40
/* 8004D9F4 00049654  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8004D9F8 00049658  3B C3 27 C0 */	addi r30, r3, 0x27c0
/* 8004D9FC 0004965C  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8004DA00 00049660  7C 7D 1B 78 */	mr r29, r3
/* 8004DA04 00049664  48 00 00 14 */	b lbl_8004DA18
lbl_8004DA08:
/* 8004DA08 00049668  FC 20 F8 90 */	fmr f1, f31
/* 8004DA0C 0004966C  7F E3 FB 78 */	mr r3, r31
/* 8004DA10 00049670  4B FF A9 41 */	bl func_80048350
/* 8004DA14 00049674  3B FF 00 38 */	addi r31, r31, 0x38
lbl_8004DA18:
/* 8004DA18 00049678  7C 1F F0 40 */	cmplw r31, r30
/* 8004DA1C 0004967C  40 82 FF EC */	bne lbl_8004DA08
/* 8004DA20 00049680  3B FD 34 C0 */	addi r31, r29, 0x34c0
/* 8004DA24 00049684  48 00 00 20 */	b lbl_8004DA44
lbl_8004DA28:
/* 8004DA28 00049688  80 1E 00 34 */	lwz r0, 0x34(r30)
/* 8004DA2C 0004968C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8004DA30 00049690  41 82 00 10 */	beq lbl_8004DA40
/* 8004DA34 00049694  FC 20 F8 90 */	fmr f1, f31
/* 8004DA38 00049698  7F C3 F3 78 */	mr r3, r30
/* 8004DA3C 0004969C  48 00 0B 99 */	bl func_8004E5D4
lbl_8004DA40:
/* 8004DA40 000496A0  3B DE 00 68 */	addi r30, r30, 0x68
lbl_8004DA44:
/* 8004DA44 000496A4  7C 1E F8 40 */	cmplw r30, r31
/* 8004DA48 000496A8  40 82 FF E0 */	bne lbl_8004DA28
/* 8004DA4C 000496AC  FC 20 F8 90 */	fmr f1, f31
/* 8004DA50 000496B0  7F E3 FB 78 */	mr r3, r31
/* 8004DA54 000496B4  48 00 12 8D */	bl func_8004ECE0
/* 8004DA58 000496B8  FC 20 F8 90 */	fmr f1, f31
/* 8004DA5C 000496BC  38 7D 35 10 */	addi r3, r29, 0x3510
/* 8004DA60 000496C0  48 00 18 45 */	bl func_8004F2A4
/* 8004DA64 000496C4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8004DA68 000496C8  CB E1 00 18 */	lfd f31, 0x18(r1)
/* 8004DA6C 000496CC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8004DA70 000496D0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8004DA74 000496D4  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8004DA78 000496D8  7C 08 03 A6 */	mtlr r0
/* 8004DA7C 000496DC  38 21 00 20 */	addi r1, r1, 0x20
/* 8004DA80 000496E0  4E 80 00 20 */	blr
lbl_8004DA84:
/* 8004DA84 000496E4  4E 80 00 20 */	blr

.global func_8004DA88
func_8004DA88:
/* 8004DA88 000496E8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004DA8C 000496EC  7C 08 02 A6 */	mflr r0
/* 8004DA90 000496F0  90 01 00 24 */	stw r0, 0x24(r1)
/* 8004DA94 000496F4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8004DA98 000496F8  3B E3 1D 40 */	addi r31, r3, 0x1d40
/* 8004DA9C 000496FC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8004DAA0 00049700  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8004DAA4 00049704  7C 9D 23 78 */	mr r29, r4
/* 8004DAA8 00049708  93 81 00 10 */	stw r28, 0x10(r1)
/* 8004DAAC 0004970C  7C 7C 1B 78 */	mr r28, r3
/* 8004DAB0 00049710  7F 9E E3 78 */	mr r30, r28
/* 8004DAB4 00049714  48 00 00 3C */	b lbl_8004DAF0
lbl_8004DAB8:
/* 8004DAB8 00049718  88 1E 00 00 */	lbz r0, 0(r30)
/* 8004DABC 0004971C  2C 00 00 00 */	cmpwi r0, 0
/* 8004DAC0 00049720  41 82 00 2C */	beq lbl_8004DAEC
/* 8004DAC4 00049724  7F A4 EB 78 */	mr r4, r29
/* 8004DAC8 00049728  38 7E 00 08 */	addi r3, r30, 8
/* 8004DACC 0004972C  48 18 09 81 */	bl strcmp
/* 8004DAD0 00049730  2C 03 00 00 */	cmpwi r3, 0
/* 8004DAD4 00049734  40 82 00 18 */	bne lbl_8004DAEC
/* 8004DAD8 00049738  80 9E 00 88 */	lwz r4, 0x88(r30)
/* 8004DADC 0004973C  7F C3 F3 78 */	mr r3, r30
/* 8004DAE0 00049740  38 04 00 01 */	addi r0, r4, 1
/* 8004DAE4 00049744  90 1E 00 88 */	stw r0, 0x88(r30)
/* 8004DAE8 00049748  48 00 00 4C */	b lbl_8004DB34
lbl_8004DAEC:
/* 8004DAEC 0004974C  3B DE 00 9C */	addi r30, r30, 0x9c
lbl_8004DAF0:
/* 8004DAF0 00049750  7C 1E F8 40 */	cmplw r30, r31
/* 8004DAF4 00049754  40 82 FF C4 */	bne lbl_8004DAB8
/* 8004DAF8 00049758  7F 83 E3 78 */	mr r3, r28
/* 8004DAFC 0004975C  48 00 01 2D */	bl func_8004DC28
/* 8004DB00 00049760  2C 03 00 00 */	cmpwi r3, 0
/* 8004DB04 00049764  7C 7E 1B 78 */	mr r30, r3
/* 8004DB08 00049768  41 82 00 28 */	beq lbl_8004DB30
/* 8004DB0C 0004976C  7F A4 EB 78 */	mr r4, r29
/* 8004DB10 00049770  4B FF AD 55 */	bl func_80048864
/* 8004DB14 00049774  2C 03 00 00 */	cmpwi r3, 0
/* 8004DB18 00049778  41 82 00 18 */	beq lbl_8004DB30
/* 8004DB1C 0004977C  80 9E 00 88 */	lwz r4, 0x88(r30)
/* 8004DB20 00049780  7F C3 F3 78 */	mr r3, r30
/* 8004DB24 00049784  38 04 00 01 */	addi r0, r4, 1
/* 8004DB28 00049788  90 1E 00 88 */	stw r0, 0x88(r30)
/* 8004DB2C 0004978C  48 00 00 08 */	b lbl_8004DB34
lbl_8004DB30:
/* 8004DB30 00049790  38 60 00 00 */	li r3, 0
lbl_8004DB34:
/* 8004DB34 00049794  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8004DB38 00049798  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8004DB3C 0004979C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8004DB40 000497A0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8004DB44 000497A4  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8004DB48 000497A8  7C 08 03 A6 */	mtlr r0
/* 8004DB4C 000497AC  38 21 00 20 */	addi r1, r1, 0x20
/* 8004DB50 000497B0  4E 80 00 20 */	blr

.global func_8004DB54
func_8004DB54:
/* 8004DB54 000497B4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004DB58 000497B8  7C 08 02 A6 */	mflr r0
/* 8004DB5C 000497BC  90 01 00 24 */	stw r0, 0x24(r1)
/* 8004DB60 000497C0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8004DB64 000497C4  7C BF 2B 78 */	mr r31, r5
/* 8004DB68 000497C8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8004DB6C 000497CC  7C 9E 23 78 */	mr r30, r4
/* 8004DB70 000497D0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8004DB74 000497D4  7C 7D 1B 78 */	mr r29, r3
/* 8004DB78 000497D8  48 00 00 71 */	bl func_8004DBE8
/* 8004DB7C 000497DC  2C 03 00 00 */	cmpwi r3, 0
/* 8004DB80 000497E0  40 82 00 20 */	bne lbl_8004DBA0
/* 8004DB84 000497E4  7F A3 EB 78 */	mr r3, r29
/* 8004DB88 000497E8  48 00 00 A1 */	bl func_8004DC28
/* 8004DB8C 000497EC  2C 03 00 00 */	cmpwi r3, 0
/* 8004DB90 000497F0  41 82 00 10 */	beq lbl_8004DBA0
/* 8004DB94 000497F4  7F C4 F3 78 */	mr r4, r30
/* 8004DB98 000497F8  7F E5 FB 78 */	mr r5, r31
/* 8004DB9C 000497FC  4B FF AD 6D */	bl func_80048908
lbl_8004DBA0:
/* 8004DBA0 00049800  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8004DBA4 00049804  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8004DBA8 00049808  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8004DBAC 0004980C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8004DBB0 00049810  7C 08 03 A6 */	mtlr r0
/* 8004DBB4 00049814  38 21 00 20 */	addi r1, r1, 0x20
/* 8004DBB8 00049818  4E 80 00 20 */	blr

.global func_8004DBBC
func_8004DBBC:
/* 8004DBBC 0004981C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004DBC0 00049820  7C 08 02 A6 */	mflr r0
/* 8004DBC4 00049824  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004DBC8 00049828  48 00 00 21 */	bl func_8004DBE8
/* 8004DBCC 0004982C  2C 03 00 00 */	cmpwi r3, 0
/* 8004DBD0 00049830  41 82 00 08 */	beq lbl_8004DBD8
/* 8004DBD4 00049834  4B FF AB C9 */	bl func_8004879C
lbl_8004DBD8:
/* 8004DBD8 00049838  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004DBDC 0004983C  7C 08 03 A6 */	mtlr r0
/* 8004DBE0 00049840  38 21 00 10 */	addi r1, r1, 0x10
/* 8004DBE4 00049844  4E 80 00 20 */	blr

.global func_8004DBE8
func_8004DBE8:
/* 8004DBE8 00049848  38 03 1D 40 */	addi r0, r3, 0x1d40
/* 8004DBEC 0004984C  48 00 00 2C */	b lbl_8004DC18
lbl_8004DBF0:
/* 8004DBF0 00049850  88 C3 00 00 */	lbz r6, 0(r3)
/* 8004DBF4 00049854  2C 06 00 00 */	cmpwi r6, 0
/* 8004DBF8 00049858  41 82 00 1C */	beq lbl_8004DC14
/* 8004DBFC 0004985C  80 C3 00 8C */	lwz r6, 0x8c(r3)
/* 8004DC00 00049860  7C 04 30 40 */	cmplw r4, r6
/* 8004DC04 00049864  40 82 00 10 */	bne lbl_8004DC14
/* 8004DC08 00049868  80 C3 00 90 */	lwz r6, 0x90(r3)
/* 8004DC0C 0004986C  7C 05 30 40 */	cmplw r5, r6
/* 8004DC10 00049870  4D 82 00 20 */	beqlr
lbl_8004DC14:
/* 8004DC14 00049874  38 63 00 9C */	addi r3, r3, 0x9c
lbl_8004DC18:
/* 8004DC18 00049878  7C 03 00 40 */	cmplw r3, r0
/* 8004DC1C 0004987C  40 82 FF D4 */	bne lbl_8004DBF0
/* 8004DC20 00049880  38 60 00 00 */	li r3, 0
/* 8004DC24 00049884  4E 80 00 20 */	blr

.global func_8004DC28
func_8004DC28:
/* 8004DC28 00049888  38 03 1D 40 */	addi r0, r3, 0x1d40
/* 8004DC2C 0004988C  48 00 00 14 */	b lbl_8004DC40
lbl_8004DC30:
/* 8004DC30 00049890  88 83 00 00 */	lbz r4, 0(r3)
/* 8004DC34 00049894  2C 04 00 00 */	cmpwi r4, 0
/* 8004DC38 00049898  4D 82 00 20 */	beqlr
/* 8004DC3C 0004989C  38 63 00 9C */	addi r3, r3, 0x9c
lbl_8004DC40:
/* 8004DC40 000498A0  7C 03 00 40 */	cmplw r3, r0
/* 8004DC44 000498A4  40 82 FF EC */	bne lbl_8004DC30
/* 8004DC48 000498A8  38 60 00 00 */	li r3, 0
/* 8004DC4C 000498AC  4E 80 00 20 */	blr

.global func_8004DC50
func_8004DC50:
/* 8004DC50 000498B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004DC54 000498B4  7C 08 02 A6 */	mflr r0
/* 8004DC58 000498B8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004DC5C 000498BC  38 03 34 C0 */	addi r0, r3, 0x34c0
/* 8004DC60 000498C0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004DC64 000498C4  3B E3 27 C0 */	addi r31, r3, 0x27c0
/* 8004DC68 000498C8  48 00 00 24 */	b lbl_8004DC8C
lbl_8004DC6C:
/* 8004DC6C 000498CC  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 8004DC70 000498D0  54 63 07 FF */	clrlwi. r3, r3, 0x1f
/* 8004DC74 000498D4  40 82 00 14 */	bne lbl_8004DC88
/* 8004DC78 000498D8  7F E3 FB 78 */	mr r3, r31
/* 8004DC7C 000498DC  48 00 02 D1 */	bl func_8004DF4C
/* 8004DC80 000498E0  7F E3 FB 78 */	mr r3, r31
/* 8004DC84 000498E4  48 00 00 14 */	b lbl_8004DC98
lbl_8004DC88:
/* 8004DC88 000498E8  3B FF 00 68 */	addi r31, r31, 0x68
lbl_8004DC8C:
/* 8004DC8C 000498EC  7C 1F 00 40 */	cmplw r31, r0
/* 8004DC90 000498F0  40 82 FF DC */	bne lbl_8004DC6C
/* 8004DC94 000498F4  38 60 00 00 */	li r3, 0
lbl_8004DC98:
/* 8004DC98 000498F8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004DC9C 000498FC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004DCA0 00049900  7C 08 03 A6 */	mtlr r0
/* 8004DCA4 00049904  38 21 00 10 */	addi r1, r1, 0x10
/* 8004DCA8 00049908  4E 80 00 20 */	blr

.global func_8004DCAC
func_8004DCAC:
/* 8004DCAC 0004990C  2C 04 00 00 */	cmpwi r4, 0
/* 8004DCB0 00049910  4D 82 00 20 */	beqlr
/* 8004DCB4 00049914  80 04 00 34 */	lwz r0, 0x34(r4)
/* 8004DCB8 00049918  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8004DCBC 0004991C  4D 82 00 20 */	beqlr
/* 8004DCC0 00049920  7C 83 23 78 */	mr r3, r4
/* 8004DCC4 00049924  48 00 02 B4 */	b func_8004DF78
/* 8004DCC8 00049928  4E 80 00 20 */	blr

.global func_8004DCCC
func_8004DCCC:
/* 8004DCCC 0004992C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004DCD0 00049930  7C 08 02 A6 */	mflr r0
/* 8004DCD4 00049934  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004DCD8 00049938  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004DCDC 0004993C  3B E3 34 C0 */	addi r31, r3, 0x34c0
/* 8004DCE0 00049940  93 C1 00 08 */	stw r30, 8(r1)
/* 8004DCE4 00049944  3B C3 27 C0 */	addi r30, r3, 0x27c0
/* 8004DCE8 00049948  48 00 00 1C */	b lbl_8004DD04
lbl_8004DCEC:
/* 8004DCEC 0004994C  80 1E 00 34 */	lwz r0, 0x34(r30)
/* 8004DCF0 00049950  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8004DCF4 00049954  41 82 00 0C */	beq lbl_8004DD00
/* 8004DCF8 00049958  7F C3 F3 78 */	mr r3, r30
/* 8004DCFC 0004995C  48 00 02 7D */	bl func_8004DF78
lbl_8004DD00:
/* 8004DD00 00049960  3B DE 00 68 */	addi r30, r30, 0x68
lbl_8004DD04:
/* 8004DD04 00049964  7C 1E F8 40 */	cmplw r30, r31
/* 8004DD08 00049968  40 82 FF E4 */	bne lbl_8004DCEC
/* 8004DD0C 0004996C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004DD10 00049970  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004DD14 00049974  83 C1 00 08 */	lwz r30, 8(r1)
/* 8004DD18 00049978  7C 08 03 A6 */	mtlr r0
/* 8004DD1C 0004997C  38 21 00 10 */	addi r1, r1, 0x10
/* 8004DD20 00049980  4E 80 00 20 */	blr

.global func_8004DD24
func_8004DD24:
/* 8004DD24 00049984  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004DD28 00049988  7C 08 02 A6 */	mflr r0
/* 8004DD2C 0004998C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004DD30 00049990  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004DD34 00049994  3B E3 34 C0 */	addi r31, r3, 0x34c0
/* 8004DD38 00049998  93 C1 00 08 */	stw r30, 8(r1)
/* 8004DD3C 0004999C  3B C3 27 C0 */	addi r30, r3, 0x27c0
/* 8004DD40 000499A0  48 00 00 38 */	b lbl_8004DD78
lbl_8004DD44:
/* 8004DD44 000499A4  80 1E 00 34 */	lwz r0, 0x34(r30)
/* 8004DD48 000499A8  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8004DD4C 000499AC  41 82 00 28 */	beq lbl_8004DD74
/* 8004DD50 000499B0  80 1E 00 44 */	lwz r0, 0x44(r30)
/* 8004DD54 000499B4  28 00 00 0C */	cmplwi r0, 0xc
/* 8004DD58 000499B8  41 82 00 1C */	beq lbl_8004DD74
/* 8004DD5C 000499BC  28 00 00 64 */	cmplwi r0, 0x64
/* 8004DD60 000499C0  41 80 00 0C */	blt lbl_8004DD6C
/* 8004DD64 000499C4  28 00 00 73 */	cmplwi r0, 0x73
/* 8004DD68 000499C8  40 81 00 0C */	ble lbl_8004DD74
lbl_8004DD6C:
/* 8004DD6C 000499CC  7F C3 F3 78 */	mr r3, r30
/* 8004DD70 000499D0  48 00 02 09 */	bl func_8004DF78
lbl_8004DD74:
/* 8004DD74 000499D4  3B DE 00 68 */	addi r30, r30, 0x68
lbl_8004DD78:
/* 8004DD78 000499D8  7C 1E F8 40 */	cmplw r30, r31
/* 8004DD7C 000499DC  40 82 FF C8 */	bne lbl_8004DD44
/* 8004DD80 000499E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004DD84 000499E4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004DD88 000499E8  83 C1 00 08 */	lwz r30, 8(r1)
/* 8004DD8C 000499EC  7C 08 03 A6 */	mtlr r0
/* 8004DD90 000499F0  38 21 00 10 */	addi r1, r1, 0x10
/* 8004DD94 000499F4  4E 80 00 20 */	blr

.global func_8004DD98
func_8004DD98:
/* 8004DD98 000499F8  38 83 1D 40 */	addi r4, r3, 0x1d40
/* 8004DD9C 000499FC  38 03 27 C0 */	addi r0, r3, 0x27c0
/* 8004DDA0 00049A00  48 00 00 1C */	b lbl_8004DDBC
lbl_8004DDA4:
/* 8004DDA4 00049A04  80 64 00 00 */	lwz r3, 0(r4)
/* 8004DDA8 00049A08  54 63 07 FF */	clrlwi. r3, r3, 0x1f
/* 8004DDAC 00049A0C  40 82 00 0C */	bne lbl_8004DDB8
/* 8004DDB0 00049A10  7C 83 23 78 */	mr r3, r4
/* 8004DDB4 00049A14  4E 80 00 20 */	blr
lbl_8004DDB8:
/* 8004DDB8 00049A18  38 84 00 38 */	addi r4, r4, 0x38
lbl_8004DDBC:
/* 8004DDBC 00049A1C  7C 04 00 40 */	cmplw r4, r0
/* 8004DDC0 00049A20  40 82 FF E4 */	bne lbl_8004DDA4
/* 8004DDC4 00049A24  38 60 00 00 */	li r3, 0
/* 8004DDC8 00049A28  4E 80 00 20 */	blr

.global func_8004DDCC
func_8004DDCC:
/* 8004DDCC 00049A2C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8004DDD0 00049A30  7C 08 02 A6 */	mflr r0
/* 8004DDD4 00049A34  2C 04 00 00 */	cmpwi r4, 0
/* 8004DDD8 00049A38  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004DDDC 00049A3C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8004DDE0 00049A40  41 82 00 34 */	beq lbl_8004DE14
/* 8004DDE4 00049A44  80 04 00 00 */	lwz r0, 0(r4)
/* 8004DDE8 00049A48  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8004DDEC 00049A4C  41 82 00 28 */	beq lbl_8004DE14
/* 8004DDF0 00049A50  83 E4 00 24 */	lwz r31, 0x24(r4)
/* 8004DDF4 00049A54  7C 83 23 78 */	mr r3, r4
/* 8004DDF8 00049A58  4B FF 9C B1 */	bl func_80047AA8
/* 8004DDFC 00049A5C  80 1F 00 88 */	lwz r0, 0x88(r31)
/* 8004DE00 00049A60  34 00 FF FF */	addic. r0, r0, -1
/* 8004DE04 00049A64  90 1F 00 88 */	stw r0, 0x88(r31)
/* 8004DE08 00049A68  40 82 00 0C */	bne lbl_8004DE14
/* 8004DE0C 00049A6C  7F E3 FB 78 */	mr r3, r31
/* 8004DE10 00049A70  4B FF A9 8D */	bl func_8004879C
lbl_8004DE14:
/* 8004DE14 00049A74  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8004DE18 00049A78  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8004DE1C 00049A7C  7C 08 03 A6 */	mtlr r0
/* 8004DE20 00049A80  38 21 00 10 */	addi r1, r1, 0x10
/* 8004DE24 00049A84  4E 80 00 20 */	blr

.global func_8004DE28
func_8004DE28:
/* 8004DE28 00049A88  38 00 00 20 */	li r0, 0x20
/* 8004DE2C 00049A8C  7C 65 1B 78 */	mr r5, r3
/* 8004DE30 00049A90  38 C0 00 00 */	li r6, 0
/* 8004DE34 00049A94  7C 09 03 A6 */	mtctr r0
lbl_8004DE38:
/* 8004DE38 00049A98  80 05 28 10 */	lwz r0, 0x2810(r5)
/* 8004DE3C 00049A9C  7C 04 00 40 */	cmplw r4, r0
/* 8004DE40 00049AA0  40 82 00 14 */	bne lbl_8004DE54
/* 8004DE44 00049AA4  1C 06 00 68 */	mulli r0, r6, 0x68
/* 8004DE48 00049AA8  7C 63 02 14 */	add r3, r3, r0
/* 8004DE4C 00049AAC  38 63 27 C0 */	addi r3, r3, 0x27c0
/* 8004DE50 00049AB0  4E 80 00 20 */	blr
lbl_8004DE54:
/* 8004DE54 00049AB4  38 A5 00 68 */	addi r5, r5, 0x68
/* 8004DE58 00049AB8  38 C6 00 01 */	addi r6, r6, 1
/* 8004DE5C 00049ABC  42 00 FF DC */	bdnz lbl_8004DE38
/* 8004DE60 00049AC0  38 60 00 00 */	li r3, 0
/* 8004DE64 00049AC4  4E 80 00 20 */	blr

.global func_8004DE68
func_8004DE68:
/* 8004DE68 00049AC8  38 A0 00 01 */	li r5, 1
/* 8004DE6C 00049ACC  38 6D 98 28 */	addi r3, r13, lbl_8063EAE8-_SDA_BASE_
/* 8004DE70 00049AD0  38 80 00 04 */	li r4, 4
/* 8004DE74 00049AD4  38 00 00 00 */	li r0, 0
/* 8004DE78 00049AD8  98 AD 98 28 */	stb r5, lbl_8063EAE8-_SDA_BASE_(r13)
/* 8004DE7C 00049ADC  B0 83 00 02 */	sth r4, 2(r3)
/* 8004DE80 00049AE0  98 03 00 04 */	stb r0, 4(r3)
/* 8004DE84 00049AE4  4E 80 00 20 */	blr
