.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global __OSInitAlarm
__OSInitAlarm:
/* 802696CC 0026532C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802696D0 00265330  7C 08 02 A6 */	mflr r0
/* 802696D4 00265334  38 60 00 08 */	li r3, 8
/* 802696D8 00265338  90 01 00 14 */	stw r0, 0x14(r1)
/* 802696DC 0026533C  4B FF FE 0D */	bl __OSGetExceptionHandler
/* 802696E0 00265340  3C 80 80 27 */	lis r4, DecrementerExceptionHandler@ha
/* 802696E4 00265344  38 84 9D BC */	addi r4, r4, DecrementerExceptionHandler@l
/* 802696E8 00265348  7C 03 20 40 */	cmplw r3, r4
/* 802696EC 0026534C  41 82 00 28 */	beq lbl_80269714
/* 802696F0 00265350  38 00 00 00 */	li r0, 0
/* 802696F4 00265354  38 6D A7 B0 */	addi r3, r13, lbl_8063FA70-_SDA_BASE_
/* 802696F8 00265358  90 03 00 04 */	stw r0, 4(r3)
/* 802696FC 0026535C  38 60 00 08 */	li r3, 8
/* 80269700 00265360  90 0D A7 B0 */	stw r0, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269704 00265364  4B FF FD D1 */	bl __OSSetExceptionHandler
/* 80269708 00265368  3C 60 80 42 */	lis r3, lbl_804269D0@ha
/* 8026970C 0026536C  38 63 69 D0 */	addi r3, r3, lbl_804269D0@l
/* 80269710 00265370  48 00 65 81 */	bl OSRegisterShutdownFunction
lbl_80269714:
/* 80269714 00265374  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80269718 00265378  7C 08 03 A6 */	mtlr r0
/* 8026971C 0026537C  38 21 00 10 */	addi r1, r1, 0x10
/* 80269720 00265380  4E 80 00 20 */	blr

.global OSCreateAlarm
OSCreateAlarm:
/* 80269724 00265384  38 00 00 00 */	li r0, 0
/* 80269728 00265388  90 03 00 00 */	stw r0, 0(r3)
/* 8026972C 0026538C  90 03 00 04 */	stw r0, 4(r3)
/* 80269730 00265390  4E 80 00 20 */	blr

.global InsertAlarm
InsertAlarm:
/* 80269734 00265394  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80269738 00265398  7C 08 02 A6 */	mflr r0
/* 8026973C 0026539C  90 01 00 34 */	stw r0, 0x34(r1)
/* 80269740 002653A0  39 61 00 30 */	addi r11, r1, 0x30
/* 80269744 002653A4  4B F5 D9 DD */	bl _savegpr_25
/* 80269748 002653A8  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8026974C 002653AC  3B A0 00 00 */	li r29, 0
/* 80269750 002653B0  81 03 00 1C */	lwz r8, 0x1c(r3)
/* 80269754 002653B4  7C 7E 1B 78 */	mr r30, r3
/* 80269758 002653B8  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 8026975C 002653BC  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 80269760 002653C0  7C 68 E8 10 */	subfc r3, r8, r29
/* 80269764 002653C4  7C FF 3B 78 */	mr r31, r7
/* 80269768 002653C8  7C 84 01 10 */	subfe r4, r4, r0
/* 8026976C 002653CC  7C 80 01 10 */	subfe r4, r0, r0
/* 80269770 002653D0  7C 84 00 D1 */	neg. r4, r4
/* 80269774 002653D4  41 82 00 7C */	beq lbl_802697F0
/* 80269778 002653D8  48 00 90 61 */	bl __OSGetSystemTime
/* 8026977C 002653DC  83 9E 00 20 */	lwz r28, 0x20(r30)
/* 80269780 002653E0  6C 67 80 00 */	xoris r7, r3, 0x8000
/* 80269784 002653E4  83 7E 00 24 */	lwz r27, 0x24(r30)
/* 80269788 002653E8  6F 80 80 00 */	xoris r0, r28, 0x8000
/* 8026978C 002653EC  7F 85 E3 78 */	mr r5, r28
/* 80269790 002653F0  7C C4 D8 10 */	subfc r6, r4, r27
/* 80269794 002653F4  7C E7 01 10 */	subfe r7, r7, r0
/* 80269798 002653F8  7C E0 01 10 */	subfe r7, r0, r0
/* 8026979C 002653FC  7F 66 DB 78 */	mr r6, r27
/* 802697A0 00265400  7C E7 00 D1 */	neg. r7, r7
/* 802697A4 00265404  41 82 00 4C */	beq lbl_802697F0
/* 802697A8 00265408  83 5E 00 18 */	lwz r26, 0x18(r30)
/* 802697AC 0026540C  7C 9B 20 10 */	subfc r4, r27, r4
/* 802697B0 00265410  83 3E 00 1C */	lwz r25, 0x1c(r30)
/* 802697B4 00265414  7C 7C 19 10 */	subfe r3, r28, r3
/* 802697B8 00265418  7F 45 D3 78 */	mr r5, r26
/* 802697BC 0026541C  7F 26 CB 78 */	mr r6, r25
/* 802697C0 00265420  4B F5 DA B9 */	bl __div2i
/* 802697C4 00265424  38 00 00 01 */	li r0, 1
/* 802697C8 00265428  7C 84 00 14 */	addc r4, r4, r0
/* 802697CC 0026542C  7C 19 20 16 */	mulhwu r0, r25, r4
/* 802697D0 00265430  7C A3 E9 14 */	adde r5, r3, r29
/* 802697D4 00265434  7C 7A 21 D6 */	mullw r3, r26, r4
/* 802697D8 00265438  7C 99 21 D6 */	mullw r4, r25, r4
/* 802697DC 0026543C  7C 60 1A 14 */	add r3, r0, r3
/* 802697E0 00265440  7C 19 29 D6 */	mullw r0, r25, r5
/* 802697E4 00265444  7C DB 20 14 */	addc r6, r27, r4
/* 802697E8 00265448  7C 03 02 14 */	add r0, r3, r0
/* 802697EC 0026544C  7C BC 01 14 */	adde r5, r28, r0
lbl_802697F0:
/* 802697F0 00265450  93 FE 00 00 */	stw r31, 0(r30)
/* 802697F4 00265454  6C A0 80 00 */	xoris r0, r5, 0x8000
/* 802697F8 00265458  90 DE 00 0C */	stw r6, 0xc(r30)
/* 802697FC 0026545C  90 BE 00 08 */	stw r5, 8(r30)
/* 80269800 00265460  80 ED A7 B0 */	lwz r7, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269804 00265464  48 00 00 C4 */	b lbl_802698C8
lbl_80269808:
/* 80269808 00265468  80 67 00 08 */	lwz r3, 8(r7)
/* 8026980C 0026546C  80 A7 00 0C */	lwz r5, 0xc(r7)
/* 80269810 00265470  6C 64 80 00 */	xoris r4, r3, 0x8000
/* 80269814 00265474  7C 65 30 10 */	subfc r3, r5, r6
/* 80269818 00265478  7C 84 01 10 */	subfe r4, r4, r0
/* 8026981C 0026547C  7C 80 01 10 */	subfe r4, r0, r0
/* 80269820 00265480  7C 84 00 D1 */	neg. r4, r4
/* 80269824 00265484  41 82 00 A0 */	beq lbl_802698C4
/* 80269828 00265488  80 07 00 10 */	lwz r0, 0x10(r7)
/* 8026982C 0026548C  90 1E 00 10 */	stw r0, 0x10(r30)
/* 80269830 00265490  93 C7 00 10 */	stw r30, 0x10(r7)
/* 80269834 00265494  80 7E 00 10 */	lwz r3, 0x10(r30)
/* 80269838 00265498  90 FE 00 14 */	stw r7, 0x14(r30)
/* 8026983C 0026549C  2C 03 00 00 */	cmpwi r3, 0
/* 80269840 002654A0  41 82 00 0C */	beq lbl_8026984C
/* 80269844 002654A4  93 C3 00 14 */	stw r30, 0x14(r3)
/* 80269848 002654A8  48 00 01 24 */	b lbl_8026996C
lbl_8026984C:
/* 8026984C 002654AC  93 CD A7 B0 */	stw r30, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269850 002654B0  48 00 8F 89 */	bl __OSGetSystemTime
/* 80269854 002654B4  80 BE 00 0C */	lwz r5, 0xc(r30)
/* 80269858 002654B8  38 E0 00 00 */	li r7, 0
/* 8026985C 002654BC  80 1E 00 08 */	lwz r0, 8(r30)
/* 80269860 002654C0  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 80269864 002654C4  7D 04 28 10 */	subfc r8, r4, r5
/* 80269868 002654C8  7C 03 01 10 */	subfe r0, r3, r0
/* 8026986C 002654CC  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 80269870 002654D0  7C 07 40 10 */	subfc r0, r7, r8
/* 80269874 002654D4  7C C6 29 10 */	subfe r6, r6, r5
/* 80269878 002654D8  7C C5 29 10 */	subfe r6, r5, r5
/* 8026987C 002654DC  7C C6 00 D1 */	neg. r6, r6
/* 80269880 002654E0  41 82 00 10 */	beq lbl_80269890
/* 80269884 002654E4  38 60 00 00 */	li r3, 0
/* 80269888 002654E8  4B FF E9 D1 */	bl PPCMtdec
/* 8026988C 002654EC  48 00 00 E0 */	b lbl_8026996C
lbl_80269890:
/* 80269890 002654F0  3C 80 80 00 */	lis r4, 0x8000
/* 80269894 002654F4  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 80269898 002654F8  7C 04 40 10 */	subfc r0, r4, r8
/* 8026989C 002654FC  7C 63 29 10 */	subfe r3, r3, r5
/* 802698A0 00265500  7C 65 29 10 */	subfe r3, r5, r5
/* 802698A4 00265504  7C 63 00 D1 */	neg. r3, r3
/* 802698A8 00265508  41 82 00 10 */	beq lbl_802698B8
/* 802698AC 0026550C  7D 03 43 78 */	mr r3, r8
/* 802698B0 00265510  4B FF E9 A9 */	bl PPCMtdec
/* 802698B4 00265514  48 00 00 B8 */	b lbl_8026996C
lbl_802698B8:
/* 802698B8 00265518  38 64 FF FF */	addi r3, r4, -1
/* 802698BC 0026551C  4B FF E9 9D */	bl PPCMtdec
/* 802698C0 00265520  48 00 00 AC */	b lbl_8026996C
lbl_802698C4:
/* 802698C4 00265524  80 E7 00 14 */	lwz r7, 0x14(r7)
lbl_802698C8:
/* 802698C8 00265528  2C 07 00 00 */	cmpwi r7, 0
/* 802698CC 0026552C  40 82 FF 3C */	bne lbl_80269808
/* 802698D0 00265530  3B E0 00 00 */	li r31, 0
/* 802698D4 00265534  38 6D A7 B0 */	addi r3, r13, lbl_8063FA70-_SDA_BASE_
/* 802698D8 00265538  93 FE 00 14 */	stw r31, 0x14(r30)
/* 802698DC 0026553C  80 83 00 04 */	lwz r4, 4(r3)
/* 802698E0 00265540  93 C3 00 04 */	stw r30, 4(r3)
/* 802698E4 00265544  2C 04 00 00 */	cmpwi r4, 0
/* 802698E8 00265548  90 9E 00 10 */	stw r4, 0x10(r30)
/* 802698EC 0026554C  41 82 00 0C */	beq lbl_802698F8
/* 802698F0 00265550  93 C4 00 14 */	stw r30, 0x14(r4)
/* 802698F4 00265554  48 00 00 78 */	b lbl_8026996C
lbl_802698F8:
/* 802698F8 00265558  93 C3 00 04 */	stw r30, 4(r3)
/* 802698FC 0026555C  93 CD A7 B0 */	stw r30, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269900 00265560  48 00 8E D9 */	bl __OSGetSystemTime
/* 80269904 00265564  80 BE 00 0C */	lwz r5, 0xc(r30)
/* 80269908 00265568  6F E6 80 00 */	xoris r6, r31, 0x8000
/* 8026990C 0026556C  80 1E 00 08 */	lwz r0, 8(r30)
/* 80269910 00265570  7C E4 28 10 */	subfc r7, r4, r5
/* 80269914 00265574  7C 03 01 10 */	subfe r0, r3, r0
/* 80269918 00265578  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 8026991C 0026557C  7C 1F 38 10 */	subfc r0, r31, r7
/* 80269920 00265580  7C C6 29 10 */	subfe r6, r6, r5
/* 80269924 00265584  7C C5 29 10 */	subfe r6, r5, r5
/* 80269928 00265588  7C C6 00 D1 */	neg. r6, r6
/* 8026992C 0026558C  41 82 00 10 */	beq lbl_8026993C
/* 80269930 00265590  38 60 00 00 */	li r3, 0
/* 80269934 00265594  4B FF E9 25 */	bl PPCMtdec
/* 80269938 00265598  48 00 00 34 */	b lbl_8026996C
lbl_8026993C:
/* 8026993C 0026559C  3C 80 80 00 */	lis r4, 0x8000
/* 80269940 002655A0  6F E3 80 00 */	xoris r3, r31, 0x8000
/* 80269944 002655A4  7C 04 38 10 */	subfc r0, r4, r7
/* 80269948 002655A8  7C 63 29 10 */	subfe r3, r3, r5
/* 8026994C 002655AC  7C 65 29 10 */	subfe r3, r5, r5
/* 80269950 002655B0  7C 63 00 D1 */	neg. r3, r3
/* 80269954 002655B4  41 82 00 10 */	beq lbl_80269964
/* 80269958 002655B8  7C E3 3B 78 */	mr r3, r7
/* 8026995C 002655BC  4B FF E8 FD */	bl PPCMtdec
/* 80269960 002655C0  48 00 00 0C */	b lbl_8026996C
lbl_80269964:
/* 80269964 002655C4  38 64 FF FF */	addi r3, r4, -1
/* 80269968 002655C8  4B FF E8 F1 */	bl PPCMtdec
lbl_8026996C:
/* 8026996C 002655CC  39 61 00 30 */	addi r11, r1, 0x30
/* 80269970 002655D0  4B F5 D7 FD */	bl _restgpr_25
/* 80269974 002655D4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80269978 002655D8  7C 08 03 A6 */	mtlr r0
/* 8026997C 002655DC  38 21 00 30 */	addi r1, r1, 0x30
/* 80269980 002655E0  4E 80 00 20 */	blr

.global OSSetAlarm
OSSetAlarm:
/* 80269984 002655E4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80269988 002655E8  7C 08 02 A6 */	mflr r0
/* 8026998C 002655EC  90 01 00 24 */	stw r0, 0x24(r1)
/* 80269990 002655F0  39 61 00 20 */	addi r11, r1, 0x20
/* 80269994 002655F4  4B F5 D7 95 */	bl _savegpr_27
/* 80269998 002655F8  7C 7B 1B 78 */	mr r27, r3
/* 8026999C 002655FC  7C BD 2B 78 */	mr r29, r5
/* 802699A0 00265600  7C DC 33 78 */	mr r28, r6
/* 802699A4 00265604  7C FE 3B 78 */	mr r30, r7
/* 802699A8 00265608  48 00 4D B5 */	bl OSDisableInterrupts
/* 802699AC 0026560C  38 00 00 00 */	li r0, 0
/* 802699B0 00265610  7C 7F 1B 78 */	mr r31, r3
/* 802699B4 00265614  90 1B 00 1C */	stw r0, 0x1c(r27)
/* 802699B8 00265618  90 1B 00 18 */	stw r0, 0x18(r27)
/* 802699BC 0026561C  48 00 8E 1D */	bl __OSGetSystemTime
/* 802699C0 00265620  7C DC 20 14 */	addc r6, r28, r4
/* 802699C4 00265624  7F C7 F3 78 */	mr r7, r30
/* 802699C8 00265628  7C BD 19 14 */	adde r5, r29, r3
/* 802699CC 0026562C  7F 63 DB 78 */	mr r3, r27
/* 802699D0 00265630  4B FF FD 65 */	bl InsertAlarm
/* 802699D4 00265634  7F E3 FB 78 */	mr r3, r31
/* 802699D8 00265638  48 00 4D AD */	bl OSRestoreInterrupts
/* 802699DC 0026563C  39 61 00 20 */	addi r11, r1, 0x20
/* 802699E0 00265640  4B F5 D7 95 */	bl _restgpr_27
/* 802699E4 00265644  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802699E8 00265648  7C 08 03 A6 */	mtlr r0
/* 802699EC 0026564C  38 21 00 20 */	addi r1, r1, 0x20
/* 802699F0 00265650  4E 80 00 20 */	blr

.global OSSetPeriodicAlarm
OSSetPeriodicAlarm:
/* 802699F4 00265654  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802699F8 00265658  7C 08 02 A6 */	mflr r0
/* 802699FC 0026565C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80269A00 00265660  39 61 00 20 */	addi r11, r1, 0x20
/* 80269A04 00265664  4B F5 D7 21 */	bl _savegpr_26
/* 80269A08 00265668  7C 7A 1B 78 */	mr r26, r3
/* 80269A0C 0026566C  7C BC 2B 78 */	mr r28, r5
/* 80269A10 00265670  7C DB 33 78 */	mr r27, r6
/* 80269A14 00265674  7C FD 3B 78 */	mr r29, r7
/* 80269A18 00265678  7D 1F 43 78 */	mr r31, r8
/* 80269A1C 0026567C  7D 3E 4B 78 */	mr r30, r9
/* 80269A20 00265680  48 00 4D 3D */	bl OSDisableInterrupts
/* 80269A24 00265684  93 FA 00 1C */	stw r31, 0x1c(r26)
/* 80269A28 00265688  7C 7F 1B 78 */	mr r31, r3
/* 80269A2C 0026568C  7F 64 DB 78 */	mr r4, r27
/* 80269A30 00265690  7F 83 E3 78 */	mr r3, r28
/* 80269A34 00265694  93 BA 00 18 */	stw r29, 0x18(r26)
/* 80269A38 00265698  48 00 8E 05 */	bl __OSTimeToSystemTime
/* 80269A3C 0026569C  90 7A 00 20 */	stw r3, 0x20(r26)
/* 80269A40 002656A0  7F 43 D3 78 */	mr r3, r26
/* 80269A44 002656A4  7F C7 F3 78 */	mr r7, r30
/* 80269A48 002656A8  38 C0 00 00 */	li r6, 0
/* 80269A4C 002656AC  90 9A 00 24 */	stw r4, 0x24(r26)
/* 80269A50 002656B0  38 A0 00 00 */	li r5, 0
/* 80269A54 002656B4  4B FF FC E1 */	bl InsertAlarm
/* 80269A58 002656B8  7F E3 FB 78 */	mr r3, r31
/* 80269A5C 002656BC  48 00 4D 29 */	bl OSRestoreInterrupts
/* 80269A60 002656C0  39 61 00 20 */	addi r11, r1, 0x20
/* 80269A64 002656C4  4B F5 D7 0D */	bl _restgpr_26
/* 80269A68 002656C8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80269A6C 002656CC  7C 08 03 A6 */	mtlr r0
/* 80269A70 002656D0  38 21 00 20 */	addi r1, r1, 0x20
/* 80269A74 002656D4  4E 80 00 20 */	blr

.global OSCancelAlarm
OSCancelAlarm:
/* 80269A78 002656D8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80269A7C 002656DC  7C 08 02 A6 */	mflr r0
/* 80269A80 002656E0  90 01 00 24 */	stw r0, 0x24(r1)
/* 80269A84 002656E4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80269A88 002656E8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80269A8C 002656EC  7C 7E 1B 78 */	mr r30, r3
/* 80269A90 002656F0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80269A94 002656F4  48 00 4C C9 */	bl OSDisableInterrupts
/* 80269A98 002656F8  80 1E 00 00 */	lwz r0, 0(r30)
/* 80269A9C 002656FC  7C 7F 1B 78 */	mr r31, r3
/* 80269AA0 00265700  2C 00 00 00 */	cmpwi r0, 0
/* 80269AA4 00265704  40 82 00 0C */	bne lbl_80269AB0
/* 80269AA8 00265708  48 00 4C DD */	bl OSRestoreInterrupts
/* 80269AAC 0026570C  48 00 00 C8 */	b lbl_80269B74
lbl_80269AB0:
/* 80269AB0 00265710  83 BE 00 14 */	lwz r29, 0x14(r30)
/* 80269AB4 00265714  2C 1D 00 00 */	cmpwi r29, 0
/* 80269AB8 00265718  40 82 00 14 */	bne lbl_80269ACC
/* 80269ABC 0026571C  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 80269AC0 00265720  38 6D A7 B0 */	addi r3, r13, lbl_8063FA70-_SDA_BASE_
/* 80269AC4 00265724  90 03 00 04 */	stw r0, 4(r3)
/* 80269AC8 00265728  48 00 00 0C */	b lbl_80269AD4
lbl_80269ACC:
/* 80269ACC 0026572C  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 80269AD0 00265730  90 1D 00 10 */	stw r0, 0x10(r29)
lbl_80269AD4:
/* 80269AD4 00265734  80 7E 00 10 */	lwz r3, 0x10(r30)
/* 80269AD8 00265738  2C 03 00 00 */	cmpwi r3, 0
/* 80269ADC 0026573C  41 82 00 0C */	beq lbl_80269AE8
/* 80269AE0 00265740  93 A3 00 14 */	stw r29, 0x14(r3)
/* 80269AE4 00265744  48 00 00 80 */	b lbl_80269B64
lbl_80269AE8:
/* 80269AE8 00265748  2C 1D 00 00 */	cmpwi r29, 0
/* 80269AEC 0026574C  93 AD A7 B0 */	stw r29, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269AF0 00265750  41 82 00 74 */	beq lbl_80269B64
/* 80269AF4 00265754  48 00 8C E5 */	bl __OSGetSystemTime
/* 80269AF8 00265758  80 BD 00 0C */	lwz r5, 0xc(r29)
/* 80269AFC 0026575C  38 E0 00 00 */	li r7, 0
/* 80269B00 00265760  80 1D 00 08 */	lwz r0, 8(r29)
/* 80269B04 00265764  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 80269B08 00265768  7D 04 28 10 */	subfc r8, r4, r5
/* 80269B0C 0026576C  7C 03 01 10 */	subfe r0, r3, r0
/* 80269B10 00265770  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 80269B14 00265774  7C 07 40 10 */	subfc r0, r7, r8
/* 80269B18 00265778  7C C6 29 10 */	subfe r6, r6, r5
/* 80269B1C 0026577C  7C C5 29 10 */	subfe r6, r5, r5
/* 80269B20 00265780  7C C6 00 D1 */	neg. r6, r6
/* 80269B24 00265784  41 82 00 10 */	beq lbl_80269B34
/* 80269B28 00265788  38 60 00 00 */	li r3, 0
/* 80269B2C 0026578C  4B FF E7 2D */	bl PPCMtdec
/* 80269B30 00265790  48 00 00 34 */	b lbl_80269B64
lbl_80269B34:
/* 80269B34 00265794  3C 80 80 00 */	lis r4, 0x8000
/* 80269B38 00265798  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 80269B3C 0026579C  7C 04 40 10 */	subfc r0, r4, r8
/* 80269B40 002657A0  7C 63 29 10 */	subfe r3, r3, r5
/* 80269B44 002657A4  7C 65 29 10 */	subfe r3, r5, r5
/* 80269B48 002657A8  7C 63 00 D1 */	neg. r3, r3
/* 80269B4C 002657AC  41 82 00 10 */	beq lbl_80269B5C
/* 80269B50 002657B0  7D 03 43 78 */	mr r3, r8
/* 80269B54 002657B4  4B FF E7 05 */	bl PPCMtdec
/* 80269B58 002657B8  48 00 00 0C */	b lbl_80269B64
lbl_80269B5C:
/* 80269B5C 002657BC  38 64 FF FF */	addi r3, r4, -1
/* 80269B60 002657C0  4B FF E6 F9 */	bl PPCMtdec
lbl_80269B64:
/* 80269B64 002657C4  38 00 00 00 */	li r0, 0
/* 80269B68 002657C8  7F E3 FB 78 */	mr r3, r31
/* 80269B6C 002657CC  90 1E 00 00 */	stw r0, 0(r30)
/* 80269B70 002657D0  48 00 4C 15 */	bl OSRestoreInterrupts
lbl_80269B74:
/* 80269B74 002657D4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80269B78 002657D8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80269B7C 002657DC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80269B80 002657E0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80269B84 002657E4  7C 08 03 A6 */	mtlr r0
/* 80269B88 002657E8  38 21 00 20 */	addi r1, r1, 0x20
/* 80269B8C 002657EC  4E 80 00 20 */	blr

.global DecrementerExceptionCallback
DecrementerExceptionCallback:
/* 80269B90 002657F0  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 80269B94 002657F4  7C 08 02 A6 */	mflr r0
/* 80269B98 002657F8  90 01 02 E4 */	stw r0, 0x2e4(r1)
/* 80269B9C 002657FC  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 80269BA0 00265800  93 C1 02 D8 */	stw r30, 0x2d8(r1)
/* 80269BA4 00265804  93 A1 02 D4 */	stw r29, 0x2d4(r1)
/* 80269BA8 00265808  7C 9D 23 78 */	mr r29, r4
/* 80269BAC 0026580C  93 81 02 D0 */	stw r28, 0x2d0(r1)
/* 80269BB0 00265810  48 00 8C 29 */	bl __OSGetSystemTime
/* 80269BB4 00265814  83 ED A7 B0 */	lwz r31, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269BB8 00265818  7C 9C 23 78 */	mr r28, r4
/* 80269BBC 0026581C  7C 7E 1B 78 */	mr r30, r3
/* 80269BC0 00265820  2C 1F 00 00 */	cmpwi r31, 0
/* 80269BC4 00265824  40 82 00 0C */	bne lbl_80269BD0
/* 80269BC8 00265828  7F A3 EB 78 */	mr r3, r29
/* 80269BCC 0026582C  48 00 13 85 */	bl OSLoadContext
lbl_80269BD0:
/* 80269BD0 00265830  80 7F 00 08 */	lwz r3, 8(r31)
/* 80269BD4 00265834  6F C0 80 00 */	xoris r0, r30, 0x8000
/* 80269BD8 00265838  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 80269BDC 0026583C  6C 64 80 00 */	xoris r4, r3, 0x8000
/* 80269BE0 00265840  7C 65 E0 10 */	subfc r3, r5, r28
/* 80269BE4 00265844  7C 84 01 10 */	subfe r4, r4, r0
/* 80269BE8 00265848  7C 80 01 10 */	subfe r4, r0, r0
/* 80269BEC 0026584C  7C 84 00 D1 */	neg. r4, r4
/* 80269BF0 00265850  41 82 00 7C */	beq lbl_80269C6C
/* 80269BF4 00265854  48 00 8B E5 */	bl __OSGetSystemTime
/* 80269BF8 00265858  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 80269BFC 0026585C  38 E0 00 00 */	li r7, 0
/* 80269C00 00265860  80 1F 00 08 */	lwz r0, 8(r31)
/* 80269C04 00265864  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 80269C08 00265868  7D 04 28 10 */	subfc r8, r4, r5
/* 80269C0C 0026586C  7C 03 01 10 */	subfe r0, r3, r0
/* 80269C10 00265870  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 80269C14 00265874  7C 07 40 10 */	subfc r0, r7, r8
/* 80269C18 00265878  7C C6 29 10 */	subfe r6, r6, r5
/* 80269C1C 0026587C  7C C5 29 10 */	subfe r6, r5, r5
/* 80269C20 00265880  7C C6 00 D1 */	neg. r6, r6
/* 80269C24 00265884  41 82 00 10 */	beq lbl_80269C34
/* 80269C28 00265888  38 60 00 00 */	li r3, 0
/* 80269C2C 0026588C  4B FF E6 2D */	bl PPCMtdec
/* 80269C30 00265890  48 00 00 34 */	b lbl_80269C64
lbl_80269C34:
/* 80269C34 00265894  3C 80 80 00 */	lis r4, 0x8000
/* 80269C38 00265898  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 80269C3C 0026589C  7C 04 40 10 */	subfc r0, r4, r8
/* 80269C40 002658A0  7C 63 29 10 */	subfe r3, r3, r5
/* 80269C44 002658A4  7C 65 29 10 */	subfe r3, r5, r5
/* 80269C48 002658A8  7C 63 00 D1 */	neg. r3, r3
/* 80269C4C 002658AC  41 82 00 10 */	beq lbl_80269C5C
/* 80269C50 002658B0  7D 03 43 78 */	mr r3, r8
/* 80269C54 002658B4  4B FF E6 05 */	bl PPCMtdec
/* 80269C58 002658B8  48 00 00 0C */	b lbl_80269C64
lbl_80269C5C:
/* 80269C5C 002658BC  38 64 FF FF */	addi r3, r4, -1
/* 80269C60 002658C0  4B FF E5 F9 */	bl PPCMtdec
lbl_80269C64:
/* 80269C64 002658C4  7F A3 EB 78 */	mr r3, r29
/* 80269C68 002658C8  48 00 12 E9 */	bl OSLoadContext
lbl_80269C6C:
/* 80269C6C 002658CC  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80269C70 002658D0  2C 03 00 00 */	cmpwi r3, 0
/* 80269C74 002658D4  90 6D A7 B0 */	stw r3, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269C78 002658D8  40 82 00 14 */	bne lbl_80269C8C
/* 80269C7C 002658DC  38 00 00 00 */	li r0, 0
/* 80269C80 002658E0  38 6D A7 B0 */	addi r3, r13, lbl_8063FA70-_SDA_BASE_
/* 80269C84 002658E4  90 03 00 04 */	stw r0, 4(r3)
/* 80269C88 002658E8  48 00 00 0C */	b lbl_80269C94
lbl_80269C8C:
/* 80269C8C 002658EC  38 00 00 00 */	li r0, 0
/* 80269C90 002658F0  90 03 00 10 */	stw r0, 0x10(r3)
lbl_80269C94:
/* 80269C94 002658F4  83 DF 00 00 */	lwz r30, 0(r31)
/* 80269C98 002658F8  38 C0 00 00 */	li r6, 0
/* 80269C9C 002658FC  6C C0 80 00 */	xoris r0, r6, 0x8000
/* 80269CA0 00265900  90 DF 00 00 */	stw r6, 0(r31)
/* 80269CA4 00265904  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80269CA8 00265908  80 BF 00 1C */	lwz r5, 0x1c(r31)
/* 80269CAC 0026590C  6C 64 80 00 */	xoris r4, r3, 0x8000
/* 80269CB0 00265910  7C 65 30 10 */	subfc r3, r5, r6
/* 80269CB4 00265914  7C 84 01 10 */	subfe r4, r4, r0
/* 80269CB8 00265918  7C 80 01 10 */	subfe r4, r0, r0
/* 80269CBC 0026591C  7C 84 00 D1 */	neg. r4, r4
/* 80269CC0 00265920  41 82 00 18 */	beq lbl_80269CD8
/* 80269CC4 00265924  7F E3 FB 78 */	mr r3, r31
/* 80269CC8 00265928  7F C7 F3 78 */	mr r7, r30
/* 80269CCC 0026592C  38 C0 00 00 */	li r6, 0
/* 80269CD0 00265930  38 A0 00 00 */	li r5, 0
/* 80269CD4 00265934  4B FF FA 61 */	bl InsertAlarm
lbl_80269CD8:
/* 80269CD8 00265938  83 8D A7 B0 */	lwz r28, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269CDC 0026593C  2C 1C 00 00 */	cmpwi r28, 0
/* 80269CE0 00265940  41 82 00 74 */	beq lbl_80269D54
/* 80269CE4 00265944  48 00 8A F5 */	bl __OSGetSystemTime
/* 80269CE8 00265948  80 BC 00 0C */	lwz r5, 0xc(r28)
/* 80269CEC 0026594C  38 E0 00 00 */	li r7, 0
/* 80269CF0 00265950  80 1C 00 08 */	lwz r0, 8(r28)
/* 80269CF4 00265954  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 80269CF8 00265958  7D 04 28 10 */	subfc r8, r4, r5
/* 80269CFC 0026595C  7C 03 01 10 */	subfe r0, r3, r0
/* 80269D00 00265960  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 80269D04 00265964  7C 07 40 10 */	subfc r0, r7, r8
/* 80269D08 00265968  7C C6 29 10 */	subfe r6, r6, r5
/* 80269D0C 0026596C  7C C5 29 10 */	subfe r6, r5, r5
/* 80269D10 00265970  7C C6 00 D1 */	neg. r6, r6
/* 80269D14 00265974  41 82 00 10 */	beq lbl_80269D24
/* 80269D18 00265978  38 60 00 00 */	li r3, 0
/* 80269D1C 0026597C  4B FF E5 3D */	bl PPCMtdec
/* 80269D20 00265980  48 00 00 34 */	b lbl_80269D54
lbl_80269D24:
/* 80269D24 00265984  3C 80 80 00 */	lis r4, 0x8000
/* 80269D28 00265988  6C E3 80 00 */	xoris r3, r7, 0x8000
/* 80269D2C 0026598C  7C 04 40 10 */	subfc r0, r4, r8
/* 80269D30 00265990  7C 63 29 10 */	subfe r3, r3, r5
/* 80269D34 00265994  7C 65 29 10 */	subfe r3, r5, r5
/* 80269D38 00265998  7C 63 00 D1 */	neg. r3, r3
/* 80269D3C 0026599C  41 82 00 10 */	beq lbl_80269D4C
/* 80269D40 002659A0  7D 03 43 78 */	mr r3, r8
/* 80269D44 002659A4  4B FF E5 15 */	bl PPCMtdec
/* 80269D48 002659A8  48 00 00 0C */	b lbl_80269D54
lbl_80269D4C:
/* 80269D4C 002659AC  38 64 FF FF */	addi r3, r4, -1
/* 80269D50 002659B0  4B FF E5 09 */	bl PPCMtdec
lbl_80269D54:
/* 80269D54 002659B4  48 00 75 F1 */	bl OSDisableScheduler
/* 80269D58 002659B8  38 61 00 08 */	addi r3, r1, 8
/* 80269D5C 002659BC  48 00 13 35 */	bl OSClearContext
/* 80269D60 002659C0  38 61 00 08 */	addi r3, r1, 8
/* 80269D64 002659C4  48 00 11 05 */	bl OSSetCurrentContext
/* 80269D68 002659C8  7F CC F3 78 */	mr r12, r30
/* 80269D6C 002659CC  7F E3 FB 78 */	mr r3, r31
/* 80269D70 002659D0  7F A4 EB 78 */	mr r4, r29
/* 80269D74 002659D4  7D 89 03 A6 */	mtctr r12
/* 80269D78 002659D8  4E 80 04 21 */	bctrl
/* 80269D7C 002659DC  38 61 00 08 */	addi r3, r1, 8
/* 80269D80 002659E0  48 00 13 11 */	bl OSClearContext
/* 80269D84 002659E4  7F A3 EB 78 */	mr r3, r29
/* 80269D88 002659E8  48 00 10 E1 */	bl OSSetCurrentContext
/* 80269D8C 002659EC  48 00 75 F5 */	bl OSEnableScheduler
/* 80269D90 002659F0  48 00 7A FD */	bl __OSReschedule
/* 80269D94 002659F4  7F A3 EB 78 */	mr r3, r29
/* 80269D98 002659F8  48 00 11 B9 */	bl OSLoadContext
/* 80269D9C 002659FC  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 80269DA0 00265A00  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 80269DA4 00265A04  83 C1 02 D8 */	lwz r30, 0x2d8(r1)
/* 80269DA8 00265A08  83 A1 02 D4 */	lwz r29, 0x2d4(r1)
/* 80269DAC 00265A0C  83 81 02 D0 */	lwz r28, 0x2d0(r1)
/* 80269DB0 00265A10  7C 08 03 A6 */	mtlr r0
/* 80269DB4 00265A14  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 80269DB8 00265A18  4E 80 00 20 */	blr

.global DecrementerExceptionHandler
DecrementerExceptionHandler:
/* 80269DBC 00265A1C  90 04 00 00 */	stw r0, 0(r4)
/* 80269DC0 00265A20  90 24 00 04 */	stw r1, 4(r4)
/* 80269DC4 00265A24  90 44 00 08 */	stw r2, 8(r4)
/* 80269DC8 00265A28  BC C4 00 18 */	stmw r6, 0x18(r4)
/* 80269DCC 00265A2C  7C 11 E2 A6 */	mfspr r0, 0x391
/* 80269DD0 00265A30  90 04 01 A8 */	stw r0, 0x1a8(r4)
/* 80269DD4 00265A34  7C 12 E2 A6 */	mfspr r0, 0x392
/* 80269DD8 00265A38  90 04 01 AC */	stw r0, 0x1ac(r4)
/* 80269DDC 00265A3C  7C 13 E2 A6 */	mfspr r0, 0x393
/* 80269DE0 00265A40  90 04 01 B0 */	stw r0, 0x1b0(r4)
/* 80269DE4 00265A44  7C 14 E2 A6 */	mfspr r0, 0x394
/* 80269DE8 00265A48  90 04 01 B4 */	stw r0, 0x1b4(r4)
/* 80269DEC 00265A4C  7C 15 E2 A6 */	mfspr r0, 0x395
/* 80269DF0 00265A50  90 04 01 B8 */	stw r0, 0x1b8(r4)
/* 80269DF4 00265A54  7C 16 E2 A6 */	mfspr r0, 0x396
/* 80269DF8 00265A58  90 04 01 BC */	stw r0, 0x1bc(r4)
/* 80269DFC 00265A5C  7C 17 E2 A6 */	mfspr r0, 0x397
/* 80269E00 00265A60  90 04 01 C0 */	stw r0, 0x1c0(r4)
/* 80269E04 00265A64  94 21 FF F8 */	stwu r1, -8(r1)
/* 80269E08 00265A68  4B FF FD 88 */	b DecrementerExceptionCallback

.global OSSetAlarmTag
OSSetAlarmTag:
/* 80269E0C 00265A6C  90 83 00 04 */	stw r4, 4(r3)
/* 80269E10 00265A70  4E 80 00 20 */	blr

.global OnReset
OnReset:
/* 80269E14 00265A74  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80269E18 00265A78  7C 08 02 A6 */	mflr r0
/* 80269E1C 00265A7C  2C 03 00 00 */	cmpwi r3, 0
/* 80269E20 00265A80  90 01 00 14 */	stw r0, 0x14(r1)
/* 80269E24 00265A84  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80269E28 00265A88  93 C1 00 08 */	stw r30, 8(r1)
/* 80269E2C 00265A8C  41 82 00 58 */	beq lbl_80269E84
/* 80269E30 00265A90  83 ED A7 B0 */	lwz r31, lbl_8063FA70-_SDA_BASE_(r13)
/* 80269E34 00265A94  2C 1F 00 00 */	cmpwi r31, 0
/* 80269E38 00265A98  41 82 00 0C */	beq lbl_80269E44
/* 80269E3C 00265A9C  83 DF 00 14 */	lwz r30, 0x14(r31)
/* 80269E40 00265AA0  48 00 00 3C */	b lbl_80269E7C
lbl_80269E44:
/* 80269E44 00265AA4  3B C0 00 00 */	li r30, 0
/* 80269E48 00265AA8  48 00 00 34 */	b lbl_80269E7C
lbl_80269E4C:
/* 80269E4C 00265AAC  7F E3 FB 78 */	mr r3, r31
/* 80269E50 00265AB0  48 02 2B 11 */	bl func_8028C960
/* 80269E54 00265AB4  2C 03 00 00 */	cmpwi r3, 0
/* 80269E58 00265AB8  40 82 00 0C */	bne lbl_80269E64
/* 80269E5C 00265ABC  7F E3 FB 78 */	mr r3, r31
/* 80269E60 00265AC0  4B FF FC 19 */	bl OSCancelAlarm
lbl_80269E64:
/* 80269E64 00265AC4  2C 1E 00 00 */	cmpwi r30, 0
/* 80269E68 00265AC8  7F DF F3 78 */	mr r31, r30
/* 80269E6C 00265ACC  41 82 00 0C */	beq lbl_80269E78
/* 80269E70 00265AD0  83 DE 00 14 */	lwz r30, 0x14(r30)
/* 80269E74 00265AD4  48 00 00 08 */	b lbl_80269E7C
lbl_80269E78:
/* 80269E78 00265AD8  3B C0 00 00 */	li r30, 0
lbl_80269E7C:
/* 80269E7C 00265ADC  2C 1F 00 00 */	cmpwi r31, 0
/* 80269E80 00265AE0  40 82 FF CC */	bne lbl_80269E4C
lbl_80269E84:
/* 80269E84 00265AE4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80269E88 00265AE8  38 60 00 01 */	li r3, 1
/* 80269E8C 00265AEC  83 C1 00 08 */	lwz r30, 8(r1)
/* 80269E90 00265AF0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80269E94 00265AF4  7C 08 03 A6 */	mtlr r0
/* 80269E98 00265AF8  38 21 00 10 */	addi r1, r1, 0x10
/* 80269E9C 00265AFC  4E 80 00 20 */	blr

.global OSSetAlarmUserData
OSSetAlarmUserData:
/* 80269EA0 00265B00  90 83 00 28 */	stw r4, 0x28(r3)
/* 80269EA4 00265B04  4E 80 00 20 */	blr

.global OSGetAlarmUserData
OSGetAlarmUserData:
/* 80269EA8 00265B08  80 63 00 28 */	lwz r3, 0x28(r3)
/* 80269EAC 00265B0C  4E 80 00 20 */	blr
