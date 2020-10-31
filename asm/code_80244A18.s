.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global func_80244A18
func_80244A18:
/* 80244A18 00240678  7C 64 1B 78 */	mr r4, r3
/* 80244A1C 0024067C  80 6D A5 08 */	lwz r3, lbl_8063F7C8-_SDA_BASE_(r13)
/* 80244A20 00240680  4B F9 62 74 */	b func_801DAC94

.global func_80244A24
func_80244A24:
/* 80244A24 00240684  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244A28 00240688  7C 08 02 A6 */	mflr r0
/* 80244A2C 0024068C  7C 64 1B 78 */	mr r4, r3
/* 80244A30 00240690  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244A34 00240694  80 6D A5 08 */	lwz r3, lbl_8063F7C8-_SDA_BASE_(r13)
/* 80244A38 00240698  4B F9 63 11 */	bl func_801DAD48
/* 80244A3C 0024069C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244A40 002406A0  38 60 00 01 */	li r3, 1
/* 80244A44 002406A4  7C 08 03 A6 */	mtlr r0
/* 80244A48 002406A8  38 21 00 10 */	addi r1, r1, 0x10
/* 80244A4C 002406AC  4E 80 00 20 */	blr

.global func_80244A50
func_80244A50:
/* 80244A50 002406B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244A54 002406B4  7C 08 02 A6 */	mflr r0
/* 80244A58 002406B8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244A5C 002406BC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80244A60 002406C0  48 02 56 8D */	bl OSGetMEM2ArenaLo
/* 80244A64 002406C4  3F E3 00 05 */	addis r31, r3, 5
/* 80244A68 002406C8  3C 80 00 05 */	lis r4, 5
/* 80244A6C 002406CC  38 A0 00 04 */	li r5, 4
/* 80244A70 002406D0  4B F9 61 09 */	bl func_801DAB78
/* 80244A74 002406D4  2C 03 00 00 */	cmpwi r3, 0
/* 80244A78 002406D8  90 6D A5 08 */	stw r3, lbl_8063F7C8-_SDA_BASE_(r13)
/* 80244A7C 002406DC  40 82 00 0C */	bne lbl_80244A88
/* 80244A80 002406E0  38 60 00 00 */	li r3, 0
/* 80244A84 002406E4  48 00 00 18 */	b lbl_80244A9C
lbl_80244A88:
/* 80244A88 002406E8  38 80 00 01 */	li r4, 1
/* 80244A8C 002406EC  4B F9 62 05 */	bl func_801DAC90
/* 80244A90 002406F0  7F E3 FB 78 */	mr r3, r31
/* 80244A94 002406F4  48 02 56 89 */	bl OSSetMEM2ArenaLo
/* 80244A98 002406F8  38 60 00 01 */	li r3, 1
lbl_80244A9C:
/* 80244A9C 002406FC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244AA0 00240700  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80244AA4 00240704  7C 08 03 A6 */	mtlr r0
/* 80244AA8 00240708  38 21 00 10 */	addi r1, r1, 0x10
/* 80244AAC 0024070C  4E 80 00 20 */	blr

.global func_80244AB0
func_80244AB0:
/* 80244AB0 00240710  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244AB4 00240714  7C 08 02 A6 */	mflr r0
/* 80244AB8 00240718  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244ABC 0024071C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80244AC0 00240720  7C 7F 1B 78 */	mr r31, r3
/* 80244AC4 00240724  80 03 00 20 */	lwz r0, 0x20(r3)
/* 80244AC8 00240728  2C 00 00 00 */	cmpwi r0, 0
/* 80244ACC 0024072C  41 82 00 0C */	beq lbl_80244AD8
/* 80244AD0 00240730  38 60 00 00 */	li r3, 0
/* 80244AD4 00240734  48 00 00 60 */	b lbl_80244B34
lbl_80244AD8:
/* 80244AD8 00240738  38 00 00 00 */	li r0, 0
/* 80244ADC 0024073C  80 83 00 1C */	lwz r4, 0x1c(r3)
/* 80244AE0 00240740  98 03 00 2E */	stb r0, 0x2e(r3)
/* 80244AE4 00240744  80 64 00 08 */	lwz r3, 8(r4)
/* 80244AE8 00240748  38 03 00 1F */	addi r0, r3, 0x1f
/* 80244AEC 0024074C  54 03 00 34 */	rlwinm r3, r0, 0, 0, 0x1a
/* 80244AF0 00240750  4B FF FF 29 */	bl func_80244A18
/* 80244AF4 00240754  2C 03 00 00 */	cmpwi r3, 0
/* 80244AF8 00240758  90 7F 00 20 */	stw r3, 0x20(r31)
/* 80244AFC 0024075C  40 82 00 0C */	bne lbl_80244B08
/* 80244B00 00240760  38 60 00 00 */	li r3, 0
/* 80244B04 00240764  48 00 00 30 */	b lbl_80244B34
lbl_80244B08:
/* 80244B08 00240768  38 80 00 00 */	li r4, 0
/* 80244B0C 0024076C  38 A0 00 60 */	li r5, 0x60
/* 80244B10 00240770  4B DB F5 F5 */	bl memset
/* 80244B14 00240774  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80244B18 00240778  38 8D 86 D8 */	addi r4, r13, lbl_8063D998-_SDA_BASE_
/* 80244B1C 0024077C  38 A0 00 04 */	li r5, 4
/* 80244B20 00240780  4B DB F4 E1 */	bl memcpy
/* 80244B24 00240784  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80244B28 00240788  38 80 00 60 */	li r4, 0x60
/* 80244B2C 0024078C  48 02 5B 29 */	bl DCFlushRange
/* 80244B30 00240790  38 60 00 01 */	li r3, 1
lbl_80244B34:
/* 80244B34 00240794  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244B38 00240798  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80244B3C 0024079C  7C 08 03 A6 */	mtlr r0
/* 80244B40 002407A0  38 21 00 10 */	addi r1, r1, 0x10
/* 80244B44 002407A4  4E 80 00 20 */	blr

.global func_80244B48
func_80244B48:
/* 80244B48 002407A8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244B4C 002407AC  7C 08 02 A6 */	mflr r0
/* 80244B50 002407B0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244B54 002407B4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80244B58 002407B8  93 C1 00 08 */	stw r30, 8(r1)
/* 80244B5C 002407BC  7C 7E 1B 78 */	mr r30, r3
/* 80244B60 002407C0  48 02 9B FD */	bl OSDisableInterrupts
/* 80244B64 002407C4  83 FE 00 20 */	lwz r31, 0x20(r30)
/* 80244B68 002407C8  38 00 00 00 */	li r0, 0
/* 80244B6C 002407CC  98 1E 00 2E */	stb r0, 0x2e(r30)
/* 80244B70 002407D0  90 1E 00 20 */	stw r0, 0x20(r30)
/* 80244B74 002407D4  48 02 9C 11 */	bl OSRestoreInterrupts
/* 80244B78 002407D8  7F E3 FB 78 */	mr r3, r31
/* 80244B7C 002407DC  4B FF FE A9 */	bl func_80244A24
/* 80244B80 002407E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244B84 002407E4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80244B88 002407E8  83 C1 00 08 */	lwz r30, 8(r1)
/* 80244B8C 002407EC  7C 08 03 A6 */	mtlr r0
/* 80244B90 002407F0  38 21 00 10 */	addi r1, r1, 0x10
/* 80244B94 002407F4  4E 80 00 20 */	blr

.global func_80244B98
func_80244B98:
/* 80244B98 002407F8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80244B9C 002407FC  7C 08 02 A6 */	mflr r0
/* 80244BA0 00240800  90 01 00 24 */	stw r0, 0x24(r1)
/* 80244BA4 00240804  39 61 00 20 */	addi r11, r1, 0x20
/* 80244BA8 00240808  4B F8 25 81 */	bl _savegpr_27
/* 80244BAC 0024080C  7C 7B 1B 78 */	mr r27, r3
/* 80244BB0 00240810  80 63 00 00 */	lwz r3, 0(r3)
/* 80244BB4 00240814  7C 9C 23 78 */	mr r28, r4
/* 80244BB8 00240818  7C BD 2B 78 */	mr r29, r5
/* 80244BBC 0024081C  7C DE 33 78 */	mr r30, r6
/* 80244BC0 00240820  48 00 09 19 */	bl func_802454D8
/* 80244BC4 00240824  2C 03 00 00 */	cmpwi r3, 0
/* 80244BC8 00240828  7C 7F 1B 78 */	mr r31, r3
/* 80244BCC 0024082C  40 82 00 7C */	bne lbl_80244C48
/* 80244BD0 00240830  8B FB 00 2D */	lbz r31, 0x2d(r27)
/* 80244BD4 00240834  7F 63 DB 78 */	mr r3, r27
/* 80244BD8 00240838  48 00 12 D9 */	bl func_80245EB0
/* 80244BDC 0024083C  2C 03 00 00 */	cmpwi r3, 0
/* 80244BE0 00240840  41 82 00 14 */	beq lbl_80244BF4
/* 80244BE4 00240844  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80244BE8 00240848  54 00 00 43 */	rlwinm. r0, r0, 0, 1, 1
/* 80244BEC 0024084C  41 82 00 08 */	beq lbl_80244BF4
/* 80244BF0 00240850  3B E0 00 01 */	li r31, 1
lbl_80244BF4:
/* 80244BF4 00240854  80 7B 00 00 */	lwz r3, 0(r27)
/* 80244BF8 00240858  7F 84 E3 78 */	mr r4, r28
/* 80244BFC 0024085C  7F E5 FB 78 */	mr r5, r31
/* 80244C00 00240860  7F C7 F3 78 */	mr r7, r30
/* 80244C04 00240864  38 C0 00 01 */	li r6, 1
/* 80244C08 00240868  48 00 07 C9 */	bl func_802453D0
/* 80244C0C 0024086C  2C 03 00 00 */	cmpwi r3, 0
/* 80244C10 00240870  7C 7F 1B 78 */	mr r31, r3
/* 80244C14 00240874  40 82 00 0C */	bne lbl_80244C20
/* 80244C18 00240878  38 60 00 00 */	li r3, 0
/* 80244C1C 0024087C  48 00 00 30 */	b lbl_80244C4C
lbl_80244C20:
/* 80244C20 00240880  93 A3 00 10 */	stw r29, 0x10(r3)
/* 80244C24 00240884  7F A3 EB 78 */	mr r3, r29
/* 80244C28 00240888  48 00 0B B1 */	bl func_802457D8
/* 80244C2C 0024088C  2C 03 00 00 */	cmpwi r3, 0
/* 80244C30 00240890  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80244C34 00240894  40 82 00 14 */	bne lbl_80244C48
/* 80244C38 00240898  7F E3 FB 78 */	mr r3, r31
/* 80244C3C 0024089C  48 00 08 95 */	bl func_802454D0
/* 80244C40 002408A0  38 60 00 00 */	li r3, 0
/* 80244C44 002408A4  48 00 00 08 */	b lbl_80244C4C
lbl_80244C48:
/* 80244C48 002408A8  80 7F 00 0C */	lwz r3, 0xc(r31)
lbl_80244C4C:
/* 80244C4C 002408AC  39 61 00 20 */	addi r11, r1, 0x20
/* 80244C50 002408B0  4B F8 25 25 */	bl _restgpr_27
/* 80244C54 002408B4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80244C58 002408B8  7C 08 03 A6 */	mtlr r0
/* 80244C5C 002408BC  38 21 00 20 */	addi r1, r1, 0x20
/* 80244C60 002408C0  4E 80 00 20 */	blr

.global func_80244C64
func_80244C64:
/* 80244C64 002408C4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244C68 002408C8  7C 08 02 A6 */	mflr r0
/* 80244C6C 002408CC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244C70 002408D0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80244C74 002408D4  93 C1 00 08 */	stw r30, 8(r1)
/* 80244C78 002408D8  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80244C7C 002408DC  83 C3 00 10 */	lwz r30, 0x10(r3)
/* 80244C80 002408E0  48 00 08 51 */	bl func_802454D0
/* 80244C84 002408E4  7F E3 FB 78 */	mr r3, r31
/* 80244C88 002408E8  7F C4 F3 78 */	mr r4, r30
/* 80244C8C 002408EC  48 00 0B BD */	bl func_80245848
/* 80244C90 002408F0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80244C94 002408F4  38 60 00 01 */	li r3, 1
/* 80244C98 002408F8  83 C1 00 08 */	lwz r30, 8(r1)
/* 80244C9C 002408FC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244CA0 00240900  7C 08 03 A6 */	mtlr r0
/* 80244CA4 00240904  38 21 00 10 */	addi r1, r1, 0x10
/* 80244CA8 00240908  4E 80 00 20 */	blr
lbl_80244CAC:
/* 80244CAC 0024090C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244CB0 00240910  7C 08 02 A6 */	mflr r0
/* 80244CB4 00240914  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244CB8 00240918  48 00 08 F1 */	bl func_802455A8
/* 80244CBC 0024091C  2C 03 00 00 */	cmpwi r3, 0
/* 80244CC0 00240920  40 82 00 0C */	bne lbl_80244CCC
/* 80244CC4 00240924  38 60 00 00 */	li r3, 0
/* 80244CC8 00240928  48 00 00 08 */	b lbl_80244CD0
lbl_80244CCC:
/* 80244CCC 0024092C  4B FF FF 99 */	bl func_80244C64
lbl_80244CD0:
/* 80244CD0 00240930  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244CD4 00240934  7C 08 03 A6 */	mtlr r0
/* 80244CD8 00240938  38 21 00 10 */	addi r1, r1, 0x10
/* 80244CDC 0024093C  4E 80 00 20 */	blr

.global func_80244CE0
func_80244CE0:
/* 80244CE0 00240940  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244CE4 00240944  7C 08 02 A6 */	mflr r0
/* 80244CE8 00240948  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244CEC 0024094C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80244CF0 00240950  7C 9F 23 78 */	mr r31, r4
/* 80244CF4 00240954  93 C1 00 08 */	stw r30, 8(r1)
/* 80244CF8 00240958  7C 7E 1B 78 */	mr r30, r3
lbl_80244CFC:
/* 80244CFC 0024095C  48 00 0B B1 */	bl func_802458AC
/* 80244D00 00240960  3C 03 FF F8 */	addis r0, r3, 0xfff8
/* 80244D04 00240964  7C 1F 00 40 */	cmplw r31, r0
/* 80244D08 00240968  41 80 00 34 */	blt lbl_80244D3C
/* 80244D0C 0024096C  7F C3 F3 78 */	mr r3, r30
/* 80244D10 00240970  38 80 00 00 */	li r4, 0
/* 80244D14 00240974  48 00 08 F1 */	bl func_80245604
/* 80244D18 00240978  2C 03 00 00 */	cmpwi r3, 0
/* 80244D1C 0024097C  40 82 00 0C */	bne lbl_80244D28
/* 80244D20 00240980  38 60 00 00 */	li r3, 0
/* 80244D24 00240984  48 00 00 1C */	b lbl_80244D40
lbl_80244D28:
/* 80244D28 00240988  4B FF FF 3D */	bl func_80244C64
/* 80244D2C 0024098C  2C 03 00 00 */	cmpwi r3, 0
/* 80244D30 00240990  40 82 FF CC */	bne lbl_80244CFC
/* 80244D34 00240994  38 60 00 00 */	li r3, 0
/* 80244D38 00240998  48 00 00 08 */	b lbl_80244D40
lbl_80244D3C:
/* 80244D3C 0024099C  38 60 00 01 */	li r3, 1
lbl_80244D40:
/* 80244D40 002409A0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244D44 002409A4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80244D48 002409A8  83 C1 00 08 */	lwz r30, 8(r1)
/* 80244D4C 002409AC  7C 08 03 A6 */	mtlr r0
/* 80244D50 002409B0  38 21 00 10 */	addi r1, r1, 0x10
/* 80244D54 002409B4  4E 80 00 20 */	blr

.global func_80244D58
func_80244D58:
/* 80244D58 002409B8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80244D5C 002409BC  7C 08 02 A6 */	mflr r0
/* 80244D60 002409C0  90 01 00 24 */	stw r0, 0x24(r1)
/* 80244D64 002409C4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80244D68 002409C8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80244D6C 002409CC  3B C0 00 00 */	li r30, 0
/* 80244D70 002409D0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80244D74 002409D4  7C 7D 1B 78 */	mr r29, r3
lbl_80244D78:
/* 80244D78 002409D8  7F A3 EB 78 */	mr r3, r29
/* 80244D7C 002409DC  38 80 00 01 */	li r4, 1
/* 80244D80 002409E0  48 00 08 85 */	bl func_80245604
/* 80244D84 002409E4  2C 03 00 00 */	cmpwi r3, 0
/* 80244D88 002409E8  40 82 00 0C */	bne lbl_80244D94
/* 80244D8C 002409EC  7F C3 F3 78 */	mr r3, r30
/* 80244D90 002409F0  48 00 00 38 */	b lbl_80244DC8
lbl_80244D94:
/* 80244D94 002409F4  28 1E 00 01 */	cmplwi r30, 1
/* 80244D98 002409F8  40 82 00 10 */	bne lbl_80244DA8
/* 80244D9C 002409FC  80 03 00 14 */	lwz r0, 0x14(r3)
/* 80244DA0 00240A00  7C 1F 00 40 */	cmplw r31, r0
/* 80244DA4 00240A04  40 82 00 20 */	bne lbl_80244DC4
lbl_80244DA8:
/* 80244DA8 00240A08  83 E3 00 14 */	lwz r31, 0x14(r3)
/* 80244DAC 00240A0C  3B C0 00 01 */	li r30, 1
/* 80244DB0 00240A10  4B FF FE B5 */	bl func_80244C64
/* 80244DB4 00240A14  2C 03 00 00 */	cmpwi r3, 0
/* 80244DB8 00240A18  40 82 FF C0 */	bne lbl_80244D78
/* 80244DBC 00240A1C  38 60 00 00 */	li r3, 0
/* 80244DC0 00240A20  48 00 00 08 */	b lbl_80244DC8
lbl_80244DC4:
/* 80244DC4 00240A24  7F C3 F3 78 */	mr r3, r30
lbl_80244DC8:
/* 80244DC8 00240A28  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80244DCC 00240A2C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80244DD0 00240A30  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80244DD4 00240A34  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80244DD8 00240A38  7C 08 03 A6 */	mtlr r0
/* 80244DDC 00240A3C  38 21 00 20 */	addi r1, r1, 0x20
/* 80244DE0 00240A40  4E 80 00 20 */	blr

.global func_80244DE4
func_80244DE4:
/* 80244DE4 00240A44  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80244DE8 00240A48  7C 08 02 A6 */	mflr r0
/* 80244DEC 00240A4C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80244DF0 00240A50  38 05 00 1F */	addi r0, r5, 0x1f
/* 80244DF4 00240A54  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80244DF8 00240A58  54 1F 00 34 */	rlwinm r31, r0, 0, 0, 0x1a
/* 80244DFC 00240A5C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80244E00 00240A60  7C DE 33 78 */	mr r30, r6
/* 80244E04 00240A64  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80244E08 00240A68  7C 9D 23 78 */	mr r29, r4
/* 80244E0C 00240A6C  7F E4 FB 78 */	mr r4, r31
/* 80244E10 00240A70  93 81 00 10 */	stw r28, 0x10(r1)
/* 80244E14 00240A74  7C 7C 1B 78 */	mr r28, r3
/* 80244E18 00240A78  80 63 00 00 */	lwz r3, 0(r3)
/* 80244E1C 00240A7C  4B FF FE C5 */	bl func_80244CE0
lbl_80244E20:
/* 80244E20 00240A80  7F 83 E3 78 */	mr r3, r28
/* 80244E24 00240A84  7F A4 EB 78 */	mr r4, r29
/* 80244E28 00240A88  7F E5 FB 78 */	mr r5, r31
/* 80244E2C 00240A8C  7F C6 F3 78 */	mr r6, r30
/* 80244E30 00240A90  4B FF FD 69 */	bl func_80244B98
/* 80244E34 00240A94  2C 03 00 00 */	cmpwi r3, 0
/* 80244E38 00240A98  40 82 00 18 */	bne lbl_80244E50
/* 80244E3C 00240A9C  80 7C 00 00 */	lwz r3, 0(r28)
/* 80244E40 00240AA0  4B FF FF 19 */	bl func_80244D58
/* 80244E44 00240AA4  2C 03 00 00 */	cmpwi r3, 0
/* 80244E48 00240AA8  40 82 FF D8 */	bne lbl_80244E20
/* 80244E4C 00240AAC  38 60 00 00 */	li r3, 0
lbl_80244E50:
/* 80244E50 00240AB0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80244E54 00240AB4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80244E58 00240AB8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80244E5C 00240ABC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80244E60 00240AC0  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80244E64 00240AC4  7C 08 03 A6 */	mtlr r0
/* 80244E68 00240AC8  38 21 00 20 */	addi r1, r1, 0x20
/* 80244E6C 00240ACC  4E 80 00 20 */	blr

.global func_80244E70
func_80244E70:
/* 80244E70 00240AD0  4B FF FE 3C */	b lbl_80244CAC

.global func_80244E74
func_80244E74:
/* 80244E74 00240AD4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80244E78 00240AD8  7C 08 02 A6 */	mflr r0
/* 80244E7C 00240ADC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80244E80 00240AE0  48 00 06 CD */	bl func_8024554C
/* 80244E84 00240AE4  2C 03 00 00 */	cmpwi r3, 0
/* 80244E88 00240AE8  40 82 00 0C */	bne lbl_80244E94
/* 80244E8C 00240AEC  38 60 00 00 */	li r3, 0
/* 80244E90 00240AF0  48 00 00 08 */	b lbl_80244E98
lbl_80244E94:
/* 80244E94 00240AF4  4B FF FD D1 */	bl func_80244C64
lbl_80244E98:
/* 80244E98 00240AF8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80244E9C 00240AFC  7C 08 03 A6 */	mtlr r0
/* 80244EA0 00240B00  38 21 00 10 */	addi r1, r1, 0x10
/* 80244EA4 00240B04  4E 80 00 20 */	blr

.global func_80244EA8
func_80244EA8:
/* 80244EA8 00240B08  7C A6 2B 78 */	mr r6, r5
/* 80244EAC 00240B0C  7C 85 23 78 */	mr r5, r4
/* 80244EB0 00240B10  38 80 00 20 */	li r4, 0x20
/* 80244EB4 00240B14  38 E0 00 00 */	li r7, 0
/* 80244EB8 00240B18  4B F9 64 A8 */	b func_801DB360

.global func_80244EBC
func_80244EBC:
/* 80244EBC 00240B1C  38 A0 00 01 */	li r5, 1
/* 80244EC0 00240B20  38 6D A5 00 */	addi r3, r13, lbl_8063F7C0-_SDA_BASE_
/* 80244EC4 00240B24  38 80 00 04 */	li r4, 4
/* 80244EC8 00240B28  38 00 00 00 */	li r0, 0
/* 80244ECC 00240B2C  98 AD A5 00 */	stb r5, lbl_8063F7C0-_SDA_BASE_(r13)
/* 80244ED0 00240B30  B0 83 00 02 */	sth r4, 2(r3)
/* 80244ED4 00240B34  98 03 00 04 */	stb r0, 4(r3)
/* 80244ED8 00240B38  4E 80 00 20 */	blr