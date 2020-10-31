.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global func_80223C54
func_80223C54:
/* 80223C54 0021F8B4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80223C58 0021F8B8  7C 08 02 A6 */	mflr r0
/* 80223C5C 0021F8BC  90 01 00 24 */	stw r0, 0x24(r1)
/* 80223C60 0021F8C0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80223C64 0021F8C4  3F E0 88 89 */	lis r31, 0x8889
/* 80223C68 0021F8C8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80223C6C 0021F8CC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80223C70 0021F8D0  7C 7D 1B 78 */	mr r29, r3
/* 80223C74 0021F8D4  80 8D A3 2C */	lwz r4, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223C78 0021F8D8  48 00 00 68 */	b lbl_80223CE0
lbl_80223C7C:
/* 80223C7C 0021F8DC  80 04 00 08 */	lwz r0, 8(r4)
/* 80223C80 0021F8E0  83 C4 00 04 */	lwz r30, 4(r4)
/* 80223C84 0021F8E4  7C 00 E8 00 */	cmpw r0, r29
/* 80223C88 0021F8E8  40 82 00 54 */	bne lbl_80223CDC
/* 80223C8C 0021F8EC  88 04 00 11 */	lbz r0, 0x11(r4)
/* 80223C90 0021F8F0  2C 00 00 00 */	cmpwi r0, 0
/* 80223C94 0021F8F4  40 82 00 48 */	bne lbl_80223CDC
/* 80223C98 0021F8F8  88 0D A3 20 */	lbz r0, lbl_8063F5E0-_SDA_BASE_(r13)
/* 80223C9C 0021F8FC  2C 00 00 00 */	cmpwi r0, 0
/* 80223CA0 0021F900  41 82 00 10 */	beq lbl_80223CB0
/* 80223CA4 0021F904  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80223CA8 0021F908  2C 00 00 00 */	cmpwi r0, 0
/* 80223CAC 0021F90C  40 82 00 30 */	bne lbl_80223CDC
lbl_80223CB0:
/* 80223CB0 0021F910  80 0D A3 10 */	lwz r0, lbl_8063F5D0-_SDA_BASE_(r13)
/* 80223CB4 0021F914  38 7F 88 89 */	addi r3, r31, -30583
/* 80223CB8 0021F918  90 8D A3 28 */	stw r4, lbl_8063F5E8-_SDA_BASE_(r13)
/* 80223CBC 0021F91C  7C 00 20 50 */	subf r0, r0, r4
/* 80223CC0 0021F920  7C 03 00 16 */	mulhwu r0, r3, r0
/* 80223CC4 0021F924  81 84 00 38 */	lwz r12, 0x38(r4)
/* 80223CC8 0021F928  80 84 00 34 */	lwz r4, 0x34(r4)
/* 80223CCC 0021F92C  54 03 D9 7E */	srwi r3, r0, 5
/* 80223CD0 0021F930  38 63 00 01 */	addi r3, r3, 1
/* 80223CD4 0021F934  7D 89 03 A6 */	mtctr r12
/* 80223CD8 0021F938  4E 80 04 21 */	bctrl
lbl_80223CDC:
/* 80223CDC 0021F93C  7F C4 F3 78 */	mr r4, r30
lbl_80223CE0:
/* 80223CE0 0021F940  2C 04 00 00 */	cmpwi r4, 0
/* 80223CE4 0021F944  40 82 FF 98 */	bne lbl_80223C7C
/* 80223CE8 0021F948  38 00 00 00 */	li r0, 0
/* 80223CEC 0021F94C  90 0D A3 28 */	stw r0, lbl_8063F5E8-_SDA_BASE_(r13)
/* 80223CF0 0021F950  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80223CF4 0021F954  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80223CF8 0021F958  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80223CFC 0021F95C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80223D00 0021F960  7C 08 03 A6 */	mtlr r0
/* 80223D04 0021F964  38 21 00 20 */	addi r1, r1, 0x20
/* 80223D08 0021F968  4E 80 00 20 */	blr
lbl_80223D0C:
/* 80223D0C 0021F96C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80223D10 0021F970  7C 08 02 A6 */	mflr r0
/* 80223D14 0021F974  90 01 00 14 */	stw r0, 0x14(r1)
/* 80223D18 0021F978  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80223D1C 0021F97C  7C 7F 1B 78 */	mr r31, r3
/* 80223D20 0021F980  38 60 00 03 */	li r3, 3
/* 80223D24 0021F984  4B FF FF 31 */	bl func_80223C54
/* 80223D28 0021F988  81 8D A3 34 */	lwz r12, lbl_8063F5F4-_SDA_BASE_(r13)
/* 80223D2C 0021F98C  2C 0C 00 00 */	cmpwi r12, 0
/* 80223D30 0021F990  41 82 00 10 */	beq lbl_80223D40
/* 80223D34 0021F994  7F E3 FB 78 */	mr r3, r31
/* 80223D38 0021F998  7D 89 03 A6 */	mtctr r12
/* 80223D3C 0021F99C  4E 80 04 21 */	bctrl
lbl_80223D40:
/* 80223D40 0021F9A0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80223D44 0021F9A4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80223D48 0021F9A8  7C 08 03 A6 */	mtlr r0
/* 80223D4C 0021F9AC  38 21 00 10 */	addi r1, r1, 0x10
/* 80223D50 0021F9B0  4E 80 00 20 */	blr
lbl_80223D54:
/* 80223D54 0021F9B4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80223D58 0021F9B8  7C 08 02 A6 */	mflr r0
/* 80223D5C 0021F9BC  90 01 00 24 */	stw r0, 0x24(r1)
/* 80223D60 0021F9C0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80223D64 0021F9C4  3B E0 00 00 */	li r31, 0
/* 80223D68 0021F9C8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80223D6C 0021F9CC  93 A1 00 14 */	stw r29, 0x14(r1)
lbl_80223D70:
/* 80223D70 0021F9D0  38 60 00 02 */	li r3, 2
/* 80223D74 0021F9D4  4B FF FE E1 */	bl func_80223C54
/* 80223D78 0021F9D8  48 04 A9 E5 */	bl OSDisableInterrupts
/* 80223D7C 0021F9DC  80 8D A3 30 */	lwz r4, lbl_8063F5F0-_SDA_BASE_(r13)
/* 80223D80 0021F9E0  7C 7D 1B 78 */	mr r29, r3
/* 80223D84 0021F9E4  48 00 00 14 */	b lbl_80223D98
lbl_80223D88:
/* 80223D88 0021F9E8  83 C4 00 04 */	lwz r30, 4(r4)
/* 80223D8C 0021F9EC  7C 83 23 78 */	mr r3, r4
/* 80223D90 0021F9F0  48 00 00 71 */	bl func_80223E00
/* 80223D94 0021F9F4  7F C4 F3 78 */	mr r4, r30
lbl_80223D98:
/* 80223D98 0021F9F8  2C 04 00 00 */	cmpwi r4, 0
/* 80223D9C 0021F9FC  40 82 FF EC */	bne lbl_80223D88
/* 80223DA0 0021FA00  93 ED A3 30 */	stw r31, lbl_8063F5F0-_SDA_BASE_(r13)
/* 80223DA4 0021FA04  7F A3 EB 78 */	mr r3, r29
/* 80223DA8 0021FA08  48 04 A9 DD */	bl OSRestoreInterrupts
/* 80223DAC 0021FA0C  4B FF FF C4 */	b lbl_80223D70

.global func_80223DB0
func_80223DB0:
/* 80223DB0 0021FA10  2C 03 00 02 */	cmpwi r3, 2
/* 80223DB4 0021FA14  40 82 00 1C */	bne lbl_80223DD0
/* 80223DB8 0021FA18  80 0D A3 14 */	lwz r0, lbl_8063F5D4-_SDA_BASE_(r13)
/* 80223DBC 0021FA1C  80 6D A3 10 */	lwz r3, lbl_8063F5D0-_SDA_BASE_(r13)
/* 80223DC0 0021FA20  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 80223DC4 0021FA24  80 8D A3 18 */	lwz r4, lbl_8063F5D8-_SDA_BASE_(r13)
/* 80223DC8 0021FA28  7C 63 02 14 */	add r3, r3, r0
/* 80223DCC 0021FA2C  48 00 00 0C */	b lbl_80223DD8
lbl_80223DD0:
/* 80223DD0 0021FA30  80 6D A3 10 */	lwz r3, lbl_8063F5D0-_SDA_BASE_(r13)
/* 80223DD4 0021FA34  80 8D A3 14 */	lwz r4, lbl_8063F5D4-_SDA_BASE_(r13)
lbl_80223DD8:
/* 80223DD8 0021FA38  7C 89 03 A6 */	mtctr r4
/* 80223DDC 0021FA3C  2C 04 00 00 */	cmpwi r4, 0
/* 80223DE0 0021FA40  41 82 00 18 */	beq lbl_80223DF8
lbl_80223DE4:
/* 80223DE4 0021FA44  80 03 00 08 */	lwz r0, 8(r3)
/* 80223DE8 0021FA48  2C 00 00 00 */	cmpwi r0, 0
/* 80223DEC 0021FA4C  4D 82 00 20 */	beqlr
/* 80223DF0 0021FA50  38 63 00 3C */	addi r3, r3, 0x3c
/* 80223DF4 0021FA54  42 00 FF F0 */	bdnz lbl_80223DE4
lbl_80223DF8:
/* 80223DF8 0021FA58  38 60 00 00 */	li r3, 0
/* 80223DFC 0021FA5C  4E 80 00 20 */	blr

.global func_80223E00
func_80223E00:
/* 80223E00 0021FA60  80 CD A3 2C */	lwz r6, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223E04 0021FA64  48 00 00 08 */	b lbl_80223E0C
lbl_80223E08:
/* 80223E08 0021FA68  7C A6 2B 78 */	mr r6, r5
lbl_80223E0C:
/* 80223E0C 0021FA6C  80 A6 00 04 */	lwz r5, 4(r6)
/* 80223E10 0021FA70  2C 05 00 00 */	cmpwi r5, 0
/* 80223E14 0021FA74  41 82 00 14 */	beq lbl_80223E28
/* 80223E18 0021FA78  88 86 00 10 */	lbz r4, 0x10(r6)
/* 80223E1C 0021FA7C  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80223E20 0021FA80  7C 04 00 40 */	cmplw r4, r0
/* 80223E24 0021FA84  41 80 FF E4 */	blt lbl_80223E08
lbl_80223E28:
/* 80223E28 0021FA88  2C 05 00 00 */	cmpwi r5, 0
/* 80223E2C 0021FA8C  40 82 00 28 */	bne lbl_80223E54
/* 80223E30 0021FA90  88 86 00 10 */	lbz r4, 0x10(r6)
/* 80223E34 0021FA94  88 03 00 10 */	lbz r0, 0x10(r3)
/* 80223E38 0021FA98  7C 04 00 40 */	cmplw r4, r0
/* 80223E3C 0021FA9C  40 80 00 18 */	bge lbl_80223E54
/* 80223E40 0021FAA0  38 00 00 00 */	li r0, 0
/* 80223E44 0021FAA4  90 C3 00 00 */	stw r6, 0(r3)
/* 80223E48 0021FAA8  90 03 00 04 */	stw r0, 4(r3)
/* 80223E4C 0021FAAC  90 66 00 04 */	stw r3, 4(r6)
/* 80223E50 0021FAB0  4E 80 00 20 */	blr
lbl_80223E54:
/* 80223E54 0021FAB4  80 86 00 00 */	lwz r4, 0(r6)
/* 80223E58 0021FAB8  2C 04 00 00 */	cmpwi r4, 0
/* 80223E5C 0021FABC  41 82 00 08 */	beq lbl_80223E64
/* 80223E60 0021FAC0  90 64 00 04 */	stw r3, 4(r4)
lbl_80223E64:
/* 80223E64 0021FAC4  80 06 00 00 */	lwz r0, 0(r6)
/* 80223E68 0021FAC8  90 03 00 00 */	stw r0, 0(r3)
/* 80223E6C 0021FACC  90 C3 00 04 */	stw r6, 4(r3)
/* 80223E70 0021FAD0  90 66 00 00 */	stw r3, 0(r6)
/* 80223E74 0021FAD4  80 0D A3 2C */	lwz r0, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223E78 0021FAD8  7C 00 30 40 */	cmplw r0, r6
/* 80223E7C 0021FADC  4C 82 00 20 */	bnelr
/* 80223E80 0021FAE0  90 6D A3 2C */	stw r3, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223E84 0021FAE4  4E 80 00 20 */	blr

.global func_80223E88
func_80223E88:
/* 80223E88 0021FAE8  80 0D A3 30 */	lwz r0, lbl_8063F5F0-_SDA_BASE_(r13)
/* 80223E8C 0021FAEC  90 03 00 04 */	stw r0, 4(r3)
/* 80223E90 0021FAF0  90 6D A3 30 */	stw r3, lbl_8063F5F0-_SDA_BASE_(r13)
/* 80223E94 0021FAF4  4E 80 00 20 */	blr

.global func_80223E98
func_80223E98:
/* 80223E98 0021FAF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80223E9C 0021FAFC  7C 08 02 A6 */	mflr r0
/* 80223EA0 0021FB00  90 01 00 14 */	stw r0, 0x14(r1)
/* 80223EA4 0021FB04  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80223EA8 0021FB08  93 C1 00 08 */	stw r30, 8(r1)
/* 80223EAC 0021FB0C  7C 7E 1B 78 */	mr r30, r3
/* 80223EB0 0021FB10  80 0D A3 2C */	lwz r0, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223EB4 0021FB14  2C 00 00 00 */	cmpwi r0, 0
/* 80223EB8 0021FB18  40 82 00 0C */	bne lbl_80223EC4
/* 80223EBC 0021FB1C  90 6D A3 2C */	stw r3, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80223EC0 0021FB20  48 00 00 34 */	b lbl_80223EF4
lbl_80223EC4:
/* 80223EC4 0021FB24  48 04 A8 99 */	bl OSDisableInterrupts
/* 80223EC8 0021FB28  80 1E 00 08 */	lwz r0, 8(r30)
/* 80223ECC 0021FB2C  7C 7F 1B 78 */	mr r31, r3
/* 80223ED0 0021FB30  2C 00 00 02 */	cmpwi r0, 2
/* 80223ED4 0021FB34  40 82 00 10 */	bne lbl_80223EE4
/* 80223ED8 0021FB38  7F C3 F3 78 */	mr r3, r30
/* 80223EDC 0021FB3C  4B FF FF AD */	bl func_80223E88
/* 80223EE0 0021FB40  48 00 00 0C */	b lbl_80223EEC
lbl_80223EE4:
/* 80223EE4 0021FB44  7F C3 F3 78 */	mr r3, r30
/* 80223EE8 0021FB48  4B FF FF 19 */	bl func_80223E00
lbl_80223EEC:
/* 80223EEC 0021FB4C  7F E3 FB 78 */	mr r3, r31
/* 80223EF0 0021FB50  48 04 A8 95 */	bl OSRestoreInterrupts
lbl_80223EF4:
/* 80223EF4 0021FB54  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80223EF8 0021FB58  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80223EFC 0021FB5C  83 C1 00 08 */	lwz r30, 8(r1)
/* 80223F00 0021FB60  7C 08 03 A6 */	mtlr r0
/* 80223F04 0021FB64  38 21 00 10 */	addi r1, r1, 0x10
/* 80223F08 0021FB68  4E 80 00 20 */	blr

.global func_80223F0C
func_80223F0C:
/* 80223F0C 0021FB6C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80223F10 0021FB70  7C 08 02 A6 */	mflr r0
/* 80223F14 0021FB74  90 01 00 14 */	stw r0, 0x14(r1)
/* 80223F18 0021FB78  7C 03 22 14 */	add r0, r3, r4
/* 80223F1C 0021FB7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80223F20 0021FB80  3B E0 00 00 */	li r31, 0
/* 80223F24 0021FB84  90 6D A3 14 */	stw r3, lbl_8063F5D4-_SDA_BASE_(r13)
/* 80223F28 0021FB88  1C 60 00 3C */	mulli r3, r0, 0x3c
/* 80223F2C 0021FB8C  90 8D A3 18 */	stw r4, lbl_8063F5D8-_SDA_BASE_(r13)
/* 80223F30 0021FB90  90 0D A3 1C */	stw r0, lbl_8063F5DC-_SDA_BASE_(r13)
/* 80223F34 0021FB94  93 ED A3 28 */	stw r31, lbl_8063F5E8-_SDA_BASE_(r13)
/* 80223F38 0021FB98  4B FB 6E 2D */	bl func_801DAD64
/* 80223F3C 0021FB9C  2C 03 00 00 */	cmpwi r3, 0
/* 80223F40 0021FBA0  90 6D A3 10 */	stw r3, lbl_8063F5D0-_SDA_BASE_(r13)
/* 80223F44 0021FBA4  41 82 00 78 */	beq lbl_80223FBC
/* 80223F48 0021FBA8  38 A0 00 00 */	li r5, 0
/* 80223F4C 0021FBAC  38 80 00 00 */	li r4, 0
/* 80223F50 0021FBB0  48 00 00 18 */	b lbl_80223F68
lbl_80223F54:
/* 80223F54 0021FBB4  80 0D A3 10 */	lwz r0, lbl_8063F5D0-_SDA_BASE_(r13)
/* 80223F58 0021FBB8  38 A5 00 01 */	addi r5, r5, 1
/* 80223F5C 0021FBBC  7C 60 22 14 */	add r3, r0, r4
/* 80223F60 0021FBC0  38 84 00 3C */	addi r4, r4, 0x3c
/* 80223F64 0021FBC4  93 E3 00 08 */	stw r31, 8(r3)
lbl_80223F68:
/* 80223F68 0021FBC8  80 0D A3 1C */	lwz r0, lbl_8063F5DC-_SDA_BASE_(r13)
/* 80223F6C 0021FBCC  7C 05 00 40 */	cmplw r5, r0
/* 80223F70 0021FBD0  41 80 FF E4 */	blt lbl_80223F54
/* 80223F74 0021FBD4  38 60 20 00 */	li r3, 0x2000
/* 80223F78 0021FBD8  4B FB 6D ED */	bl func_801DAD64
/* 80223F7C 0021FBDC  7C 65 1B 78 */	mr r5, r3
/* 80223F80 0021FBE0  90 6D A3 24 */	stw r3, lbl_8063F5E4-_SDA_BASE_(r13)
/* 80223F84 0021FBE4  3C 60 80 22 */	lis r3, lbl_80223D54@ha
/* 80223F88 0021FBE8  38 80 00 00 */	li r4, 0
/* 80223F8C 0021FBEC  38 63 3D 54 */	addi r3, r3, lbl_80223D54@l
/* 80223F90 0021FBF0  38 A5 1F FC */	addi r5, r5, 0x1ffc
/* 80223F94 0021FBF4  38 C0 1F FC */	li r6, 0x1ffc
/* 80223F98 0021FBF8  48 04 E6 B1 */	bl OSSetIdleFunction
/* 80223F9C 0021FBFC  80 8D A4 C8 */	lwz r4, lbl_8063F788-_SDA_BASE_(r13)
/* 80223FA0 0021FC00  2C 04 00 00 */	cmpwi r4, 0
/* 80223FA4 0021FC04  41 82 00 18 */	beq lbl_80223FBC
/* 80223FA8 0021FC08  3C 60 80 22 */	lis r3, lbl_80223D0C@ha
/* 80223FAC 0021FC0C  80 04 00 74 */	lwz r0, 0x74(r4)
/* 80223FB0 0021FC10  38 63 3D 0C */	addi r3, r3, lbl_80223D0C@l
/* 80223FB4 0021FC14  90 64 00 74 */	stw r3, 0x74(r4)
/* 80223FB8 0021FC18  90 0D A3 34 */	stw r0, lbl_8063F5F4-_SDA_BASE_(r13)
lbl_80223FBC:
/* 80223FBC 0021FC1C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80223FC0 0021FC20  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80223FC4 0021FC24  7C 08 03 A6 */	mtlr r0
/* 80223FC8 0021FC28  38 21 00 10 */	addi r1, r1, 0x10
/* 80223FCC 0021FC2C  4E 80 00 20 */	blr

.global func_80223FD0
func_80223FD0:
/* 80223FD0 0021FC30  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80223FD4 0021FC34  7C 08 02 A6 */	mflr r0
/* 80223FD8 0021FC38  90 01 00 24 */	stw r0, 0x24(r1)
/* 80223FDC 0021FC3C  39 61 00 20 */	addi r11, r1, 0x20
/* 80223FE0 0021FC40  4B FA 31 49 */	bl _savegpr_27
/* 80223FE4 0021FC44  7C 7B 1B 78 */	mr r27, r3
/* 80223FE8 0021FC48  7C 9C 23 78 */	mr r28, r4
/* 80223FEC 0021FC4C  7C BD 2B 78 */	mr r29, r5
/* 80223FF0 0021FC50  7C DE 33 78 */	mr r30, r6
/* 80223FF4 0021FC54  4B FF FD BD */	bl func_80223DB0
/* 80223FF8 0021FC58  2C 03 00 00 */	cmpwi r3, 0
/* 80223FFC 0021FC5C  7C 7F 1B 78 */	mr r31, r3
/* 80224000 0021FC60  40 82 00 0C */	bne lbl_8022400C
/* 80224004 0021FC64  38 60 00 00 */	li r3, 0
/* 80224008 0021FC68  48 00 00 4C */	b lbl_80224054
lbl_8022400C:
/* 8022400C 0021FC6C  38 00 00 00 */	li r0, 0
/* 80224010 0021FC70  90 03 00 00 */	stw r0, 0(r3)
/* 80224014 0021FC74  90 03 00 04 */	stw r0, 4(r3)
/* 80224018 0021FC78  93 63 00 08 */	stw r27, 8(r3)
/* 8022401C 0021FC7C  9B 83 00 10 */	stb r28, 0x10(r3)
/* 80224020 0021FC80  98 03 00 11 */	stb r0, 0x11(r3)
/* 80224024 0021FC84  93 A3 00 34 */	stw r29, 0x34(r3)
/* 80224028 0021FC88  93 C3 00 38 */	stw r30, 0x38(r3)
/* 8022402C 0021FC8C  90 03 00 0C */	stw r0, 0xc(r3)
/* 80224030 0021FC90  98 03 00 14 */	stb r0, 0x14(r3)
/* 80224034 0021FC94  4B FF FE 65 */	bl func_80223E98
/* 80224038 0021FC98  80 0D A3 10 */	lwz r0, lbl_8063F5D0-_SDA_BASE_(r13)
/* 8022403C 0021FC9C  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 80224040 0021FCA0  38 63 88 89 */	addi r3, r3, 0x88888889@l
/* 80224044 0021FCA4  7C 00 F8 50 */	subf r0, r0, r31
/* 80224048 0021FCA8  7C 03 00 16 */	mulhwu r0, r3, r0
/* 8022404C 0021FCAC  54 03 D9 7E */	srwi r3, r0, 5
/* 80224050 0021FCB0  38 63 00 01 */	addi r3, r3, 1
lbl_80224054:
/* 80224054 0021FCB4  39 61 00 20 */	addi r11, r1, 0x20
/* 80224058 0021FCB8  4B FA 31 1D */	bl _restgpr_27
/* 8022405C 0021FCBC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80224060 0021FCC0  7C 08 03 A6 */	mtlr r0
/* 80224064 0021FCC4  38 21 00 20 */	addi r1, r1, 0x20
/* 80224068 0021FCC8  4E 80 00 20 */	blr

.global func_8022406C
func_8022406C:
/* 8022406C 0021FCCC  38 60 00 01 */	li r3, 1
/* 80224070 0021FCD0  4B FF FB E4 */	b func_80223C54

.global func_80224074
func_80224074:
/* 80224074 0021FCD4  80 6D A3 2C */	lwz r3, lbl_8063F5EC-_SDA_BASE_(r13)
/* 80224078 0021FCD8  48 00 00 08 */	b lbl_80224080
lbl_8022407C:
/* 8022407C 0021FCDC  80 63 00 04 */	lwz r3, 4(r3)
lbl_80224080:
/* 80224080 0021FCE0  2C 03 00 00 */	cmpwi r3, 0
/* 80224084 0021FCE4  40 82 FF F8 */	bne lbl_8022407C
/* 80224088 0021FCE8  4E 80 00 20 */	blr

.global func_8022408C
func_8022408C:
/* 8022408C 0021FCEC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80224090 0021FCF0  7C 08 02 A6 */	mflr r0
/* 80224094 0021FCF4  2C 04 00 00 */	cmpwi r4, 0
/* 80224098 0021FCF8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8022409C 0021FCFC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802240A0 0021FD00  41 82 00 30 */	beq lbl_802240D0
/* 802240A4 0021FD04  2C 03 00 00 */	cmpwi r3, 0
/* 802240A8 0021FD08  41 82 00 28 */	beq lbl_802240D0
/* 802240AC 0021FD0C  38 03 FF FF */	addi r0, r3, -1
/* 802240B0 0021FD10  80 6D A3 10 */	lwz r3, lbl_8063F5D0-_SDA_BASE_(r13)
/* 802240B4 0021FD14  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 802240B8 0021FD18  38 A0 00 1F */	li r5, 0x1f
/* 802240BC 0021FD1C  7F E3 02 14 */	add r31, r3, r0
/* 802240C0 0021FD20  38 7F 00 14 */	addi r3, r31, 0x14
/* 802240C4 0021FD24  4B DD FF 3D */	bl memcpy
/* 802240C8 0021FD28  38 00 00 00 */	li r0, 0
/* 802240CC 0021FD2C  98 1F 00 33 */	stb r0, 0x33(r31)
lbl_802240D0:
/* 802240D0 0021FD30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802240D4 0021FD34  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802240D8 0021FD38  7C 08 03 A6 */	mtlr r0
/* 802240DC 0021FD3C  38 21 00 10 */	addi r1, r1, 0x10
/* 802240E0 0021FD40  4E 80 00 20 */	blr

.global func_802240E4
func_802240E4:
/* 802240E4 0021FD44  38 A0 00 01 */	li r5, 1
/* 802240E8 0021FD48  38 6D A3 08 */	addi r3, r13, lbl_8063F5C8-_SDA_BASE_
/* 802240EC 0021FD4C  38 80 00 04 */	li r4, 4
/* 802240F0 0021FD50  38 00 00 00 */	li r0, 0
/* 802240F4 0021FD54  98 AD A3 08 */	stb r5, lbl_8063F5C8-_SDA_BASE_(r13)
/* 802240F8 0021FD58  B0 83 00 02 */	sth r4, 2(r3)
/* 802240FC 0021FD5C  98 03 00 04 */	stb r0, 4(r3)
/* 80224100 0021FD60  4E 80 00 20 */	blr