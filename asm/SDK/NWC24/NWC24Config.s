.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global NWC24GetMyUserId
NWC24GetMyUserId:
/* 80302B58 002FE7B8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80302B5C 002FE7BC  7C 08 02 A6 */	mflr r0
/* 80302B60 002FE7C0  90 01 00 24 */	stw r0, 0x24(r1)
/* 80302B64 002FE7C4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80302B68 002FE7C8  3B E0 00 00 */	li r31, 0
/* 80302B6C 002FE7CC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80302B70 002FE7D0  7C 7E 1B 78 */	mr r30, r3
/* 80302B74 002FE7D4  48 00 07 71 */	bl NWC24IsMsgLibOpened
/* 80302B78 002FE7D8  2C 03 00 00 */	cmpwi r3, 0
/* 80302B7C 002FE7DC  40 82 00 10 */	bne lbl_80302B8C
/* 80302B80 002FE7E0  48 00 07 79 */	bl NWC24IsMsgLibOpenedByTool
/* 80302B84 002FE7E4  2C 03 00 00 */	cmpwi r3, 0
/* 80302B88 002FE7E8  41 82 00 1C */	beq lbl_80302BA4
lbl_80302B8C:
/* 80302B8C 002FE7EC  80 6D AF 88 */	lwz r3, lbl_80640248-_SDA_BASE_(r13)
/* 80302B90 002FE7F0  80 03 00 08 */	lwz r0, 8(r3)
/* 80302B94 002FE7F4  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80302B98 002FE7F8  90 7E 00 04 */	stw r3, 4(r30)
/* 80302B9C 002FE7FC  90 1E 00 00 */	stw r0, 0(r30)
/* 80302BA0 002FE800  48 00 00 B0 */	b lbl_80302C50
lbl_80302BA4:
/* 80302BA4 002FE804  48 00 0E 51 */	bl func_803039F4
/* 80302BA8 002FE808  2C 03 00 00 */	cmpwi r3, 0
/* 80302BAC 002FE80C  40 80 00 08 */	bge lbl_80302BB4
/* 80302BB0 002FE810  48 00 00 A4 */	b lbl_80302C54
lbl_80302BB4:
/* 80302BB4 002FE814  38 60 00 01 */	li r3, 1
/* 80302BB8 002FE818  48 00 07 55 */	bl NWC24BlockOpenMsgLib
/* 80302BBC 002FE81C  2C 03 00 00 */	cmpwi r3, 0
/* 80302BC0 002FE820  40 80 00 08 */	bge lbl_80302BC8
/* 80302BC4 002FE824  48 00 00 5C */	b lbl_80302C20
lbl_80302BC8:
/* 80302BC8 002FE828  38 00 00 00 */	li r0, 0
/* 80302BCC 002FE82C  2C 1E 00 00 */	cmpwi r30, 0
/* 80302BD0 002FE830  90 01 00 08 */	stw r0, 8(r1)
/* 80302BD4 002FE834  40 82 00 0C */	bne lbl_80302BE0
/* 80302BD8 002FE838  3B E0 FF FD */	li r31, -3
/* 80302BDC 002FE83C  48 00 00 2C */	b lbl_80302C08
lbl_80302BE0:
/* 80302BE0 002FE840  3C 60 6F C1 */	lis r3, 0x6FC0FFFF@ha
/* 80302BE4 002FE844  3C 80 00 24 */	lis r4, 0x002386F2@ha
/* 80302BE8 002FE848  38 A3 FF FF */	addi r5, r3, 0x6FC0FFFF@l
/* 80302BEC 002FE84C  38 04 86 F2 */	addi r0, r4, 0x002386F2@l
/* 80302BF0 002FE850  90 BE 00 04 */	stw r5, 4(r30)
/* 80302BF4 002FE854  7F C3 F3 78 */	mr r3, r30
/* 80302BF8 002FE858  38 81 00 08 */	addi r4, r1, 8
/* 80302BFC 002FE85C  90 1E 00 00 */	stw r0, 0(r30)
/* 80302C00 002FE860  48 00 0F B5 */	bl func_80303BB4
/* 80302C04 002FE864  7C 7F 1B 78 */	mr r31, r3
lbl_80302C08:
/* 80302C08 002FE868  38 60 00 00 */	li r3, 0
/* 80302C0C 002FE86C  48 00 07 01 */	bl NWC24BlockOpenMsgLib
/* 80302C10 002FE870  2C 1F 00 00 */	cmpwi r31, 0
/* 80302C14 002FE874  41 80 00 08 */	blt lbl_80302C1C
/* 80302C18 002FE878  7C 7F 1B 78 */	mr r31, r3
lbl_80302C1C:
/* 80302C1C 002FE87C  7F E3 FB 78 */	mr r3, r31
lbl_80302C20:
/* 80302C20 002FE880  38 03 00 24 */	addi r0, r3, 0x24
/* 80302C24 002FE884  7C 7F 1B 78 */	mr r31, r3
/* 80302C28 002FE888  28 00 00 01 */	cmplwi r0, 1
/* 80302C2C 002FE88C  41 81 00 08 */	bgt lbl_80302C34
/* 80302C30 002FE890  3B E0 00 00 */	li r31, 0
lbl_80302C34:
/* 80302C34 002FE894  48 00 0E 91 */	bl func_80303AC4
/* 80302C38 002FE898  2C 03 00 00 */	cmpwi r3, 0
/* 80302C3C 002FE89C  40 80 00 14 */	bge lbl_80302C50
/* 80302C40 002FE8A0  2C 1F 00 00 */	cmpwi r31, 0
/* 80302C44 002FE8A4  41 82 00 08 */	beq lbl_80302C4C
/* 80302C48 002FE8A8  7F E3 FB 78 */	mr r3, r31
lbl_80302C4C:
/* 80302C4C 002FE8AC  7C 7F 1B 78 */	mr r31, r3
lbl_80302C50:
/* 80302C50 002FE8B0  7F E3 FB 78 */	mr r3, r31
lbl_80302C54:
/* 80302C54 002FE8B4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80302C58 002FE8B8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80302C5C 002FE8BC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80302C60 002FE8C0  7C 08 03 A6 */	mtlr r0
/* 80302C64 002FE8C4  38 21 00 20 */	addi r1, r1, 0x20
/* 80302C68 002FE8C8  4E 80 00 20 */	blr

.global NWC24iConfigOpen
NWC24iConfigOpen:
/* 80302C6C 002FE8CC  80 6D AF 90 */	lwz r3, lbl_80640250-_SDA_BASE_(r13)
/* 80302C70 002FE8D0  38 00 00 00 */	li r0, 0
/* 80302C74 002FE8D4  90 0D AF 8C */	stw r0, lbl_8064024C-_SDA_BASE_(r13)
/* 80302C78 002FE8D8  38 03 0D 00 */	addi r0, r3, 0xd00
/* 80302C7C 002FE8DC  90 0D AF 88 */	stw r0, lbl_80640248-_SDA_BASE_(r13)
/* 80302C80 002FE8E0  48 00 00 04 */	b NWC24iConfigReload

NWC24iConfigReload:
/* 80302C84 002FE8E4  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 80302C88 002FE8E8  7C 08 02 A6 */	mflr r0
/* 80302C8C 002FE8EC  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 80302C90 002FE8F0  93 E1 00 AC */	stw r31, 0xac(r1)
/* 80302C94 002FE8F4  80 0D AF 90 */	lwz r0, lbl_80640250-_SDA_BASE_(r13)
/* 80302C98 002FE8F8  2C 00 00 00 */	cmpwi r0, 0
/* 80302C9C 002FE8FC  40 82 00 0C */	bne lbl_80302CA8
/* 80302CA0 002FE900  38 60 FF F7 */	li r3, -9
/* 80302CA4 002FE904  48 00 00 C0 */	b lbl_80302D64
lbl_80302CA8:
/* 80302CA8 002FE908  80 8D 8C 94 */	lwz r4, lbl_8063DF54-_SDA_BASE_(r13)
/* 80302CAC 002FE90C  38 61 00 08 */	addi r3, r1, 8
/* 80302CB0 002FE910  38 A0 00 02 */	li r5, 2
/* 80302CB4 002FE914  4B FF EE 95 */	bl NWC24FOpen
/* 80302CB8 002FE918  2C 03 00 00 */	cmpwi r3, 0
/* 80302CBC 002FE91C  40 82 00 2C */	bne lbl_80302CE8
/* 80302CC0 002FE920  80 6D AF 88 */	lwz r3, lbl_80640248-_SDA_BASE_(r13)
/* 80302CC4 002FE924  38 A1 00 08 */	addi r5, r1, 8
/* 80302CC8 002FE928  38 80 04 00 */	li r4, 0x400
/* 80302CCC 002FE92C  4B FF F5 4D */	bl NWC24FRead
/* 80302CD0 002FE930  7C 7F 1B 78 */	mr r31, r3
/* 80302CD4 002FE934  38 61 00 08 */	addi r3, r1, 8
/* 80302CD8 002FE938  4B FF F1 C1 */	bl NWC24FClose
/* 80302CDC 002FE93C  2C 1F 00 00 */	cmpwi r31, 0
/* 80302CE0 002FE940  41 82 00 08 */	beq lbl_80302CE8
/* 80302CE4 002FE944  7F E3 FB 78 */	mr r3, r31
lbl_80302CE8:
/* 80302CE8 002FE948  2C 03 00 00 */	cmpwi r3, 0
/* 80302CEC 002FE94C  40 82 00 1C */	bne lbl_80302D08
/* 80302CF0 002FE950  48 00 02 79 */	bl CheckConfig
/* 80302CF4 002FE954  2C 03 00 00 */	cmpwi r3, 0
/* 80302CF8 002FE958  40 82 00 10 */	bne lbl_80302D08
/* 80302CFC 002FE95C  38 00 00 00 */	li r0, 0
/* 80302D00 002FE960  90 0D AF 8C */	stw r0, lbl_8064024C-_SDA_BASE_(r13)
/* 80302D04 002FE964  48 00 00 60 */	b lbl_80302D64
lbl_80302D08:
/* 80302D08 002FE968  80 8D 8C 98 */	lwz r4, lbl_8063DF58-_SDA_BASE_(r13)
/* 80302D0C 002FE96C  38 61 00 08 */	addi r3, r1, 8
/* 80302D10 002FE970  38 A0 00 02 */	li r5, 2
/* 80302D14 002FE974  4B FF EE 35 */	bl NWC24FOpen
/* 80302D18 002FE978  2C 03 00 00 */	cmpwi r3, 0
/* 80302D1C 002FE97C  40 82 00 2C */	bne lbl_80302D48
/* 80302D20 002FE980  80 6D AF 88 */	lwz r3, lbl_80640248-_SDA_BASE_(r13)
/* 80302D24 002FE984  38 A1 00 08 */	addi r5, r1, 8
/* 80302D28 002FE988  38 80 04 00 */	li r4, 0x400
/* 80302D2C 002FE98C  4B FF F4 ED */	bl NWC24FRead
/* 80302D30 002FE990  7C 7F 1B 78 */	mr r31, r3
/* 80302D34 002FE994  38 61 00 08 */	addi r3, r1, 8
/* 80302D38 002FE998  4B FF F1 61 */	bl NWC24FClose
/* 80302D3C 002FE99C  2C 1F 00 00 */	cmpwi r31, 0
/* 80302D40 002FE9A0  41 82 00 08 */	beq lbl_80302D48
/* 80302D44 002FE9A4  7F E3 FB 78 */	mr r3, r31
lbl_80302D48:
/* 80302D48 002FE9A8  2C 03 00 00 */	cmpwi r3, 0
/* 80302D4C 002FE9AC  40 82 00 18 */	bne lbl_80302D64
/* 80302D50 002FE9B0  48 00 02 19 */	bl CheckConfig
/* 80302D54 002FE9B4  2C 03 00 00 */	cmpwi r3, 0
/* 80302D58 002FE9B8  40 82 00 0C */	bne lbl_80302D64
/* 80302D5C 002FE9BC  38 00 00 01 */	li r0, 1
/* 80302D60 002FE9C0  90 0D AF 8C */	stw r0, lbl_8064024C-_SDA_BASE_(r13)
lbl_80302D64:
/* 80302D64 002FE9C4  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 80302D68 002FE9C8  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 80302D6C 002FE9CC  7C 08 03 A6 */	mtlr r0
/* 80302D70 002FE9D0  38 21 00 B0 */	addi r1, r1, 0xb0
/* 80302D74 002FE9D4  4E 80 00 20 */	blr

.global NWC24iConfigFlush
NWC24iConfigFlush:
/* 80302D78 002FE9D8  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 80302D7C 002FE9DC  7C 08 02 A6 */	mflr r0
/* 80302D80 002FE9E0  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 80302D84 002FE9E4  93 E1 00 AC */	stw r31, 0xac(r1)
/* 80302D88 002FE9E8  80 0D AF 90 */	lwz r0, lbl_80640250-_SDA_BASE_(r13)
/* 80302D8C 002FE9EC  2C 00 00 00 */	cmpwi r0, 0
/* 80302D90 002FE9F0  40 82 00 0C */	bne lbl_80302D9C
/* 80302D94 002FE9F4  38 60 FF F7 */	li r3, -9
/* 80302D98 002FE9F8  48 00 01 4C */	b lbl_80302EE4
lbl_80302D9C:
/* 80302D9C 002FE9FC  80 0D AF 8C */	lwz r0, lbl_8064024C-_SDA_BASE_(r13)
/* 80302DA0 002FEA00  2C 00 00 00 */	cmpwi r0, 0
/* 80302DA4 002FEA04  40 82 00 0C */	bne lbl_80302DB0
/* 80302DA8 002FEA08  38 60 00 00 */	li r3, 0
/* 80302DAC 002FEA0C  48 00 01 38 */	b lbl_80302EE4
lbl_80302DB0:
/* 80302DB0 002FEA10  81 0D AF 88 */	lwz r8, lbl_80640248-_SDA_BASE_(r13)
/* 80302DB4 002FEA14  38 00 00 1F */	li r0, 0x1f
/* 80302DB8 002FEA18  38 E0 00 00 */	li r7, 0
/* 80302DBC 002FEA1C  7D 06 43 78 */	mr r6, r8
/* 80302DC0 002FEA20  7C 09 03 A6 */	mtctr r0
lbl_80302DC4:
/* 80302DC4 002FEA24  80 66 00 00 */	lwz r3, 0(r6)
/* 80302DC8 002FEA28  80 06 00 04 */	lwz r0, 4(r6)
/* 80302DCC 002FEA2C  7C E7 1A 14 */	add r7, r7, r3
/* 80302DD0 002FEA30  80 66 00 08 */	lwz r3, 8(r6)
/* 80302DD4 002FEA34  7C E7 02 14 */	add r7, r7, r0
/* 80302DD8 002FEA38  80 06 00 0C */	lwz r0, 0xc(r6)
/* 80302DDC 002FEA3C  7C E7 1A 14 */	add r7, r7, r3
/* 80302DE0 002FEA40  80 66 00 10 */	lwz r3, 0x10(r6)
/* 80302DE4 002FEA44  7C E7 02 14 */	add r7, r7, r0
/* 80302DE8 002FEA48  80 06 00 14 */	lwz r0, 0x14(r6)
/* 80302DEC 002FEA4C  7C E7 1A 14 */	add r7, r7, r3
/* 80302DF0 002FEA50  80 66 00 18 */	lwz r3, 0x18(r6)
/* 80302DF4 002FEA54  7C E7 02 14 */	add r7, r7, r0
/* 80302DF8 002FEA58  80 06 00 1C */	lwz r0, 0x1c(r6)
/* 80302DFC 002FEA5C  7C E7 1A 14 */	add r7, r7, r3
/* 80302E00 002FEA60  38 C6 00 20 */	addi r6, r6, 0x20
/* 80302E04 002FEA64  7C E7 02 14 */	add r7, r7, r0
/* 80302E08 002FEA68  42 00 FF BC */	bdnz lbl_80302DC4
/* 80302E0C 002FEA6C  80 06 00 00 */	lwz r0, 0(r6)
/* 80302E10 002FEA70  38 61 00 08 */	addi r3, r1, 8
/* 80302E14 002FEA74  80 86 00 04 */	lwz r4, 4(r6)
/* 80302E18 002FEA78  38 A0 00 01 */	li r5, 1
/* 80302E1C 002FEA7C  7C E7 02 14 */	add r7, r7, r0
/* 80302E20 002FEA80  80 06 00 08 */	lwz r0, 8(r6)
/* 80302E24 002FEA84  7C E7 22 14 */	add r7, r7, r4
/* 80302E28 002FEA88  80 86 00 0C */	lwz r4, 0xc(r6)
/* 80302E2C 002FEA8C  7C E7 02 14 */	add r7, r7, r0
/* 80302E30 002FEA90  80 06 00 10 */	lwz r0, 0x10(r6)
/* 80302E34 002FEA94  7C E7 22 14 */	add r7, r7, r4
/* 80302E38 002FEA98  80 86 00 14 */	lwz r4, 0x14(r6)
/* 80302E3C 002FEA9C  7C E7 02 14 */	add r7, r7, r0
/* 80302E40 002FEAA0  80 06 00 18 */	lwz r0, 0x18(r6)
/* 80302E44 002FEAA4  7C E7 22 14 */	add r7, r7, r4
/* 80302E48 002FEAA8  7C E7 02 14 */	add r7, r7, r0
/* 80302E4C 002FEAAC  90 E8 03 FC */	stw r7, 0x3fc(r8)
/* 80302E50 002FEAB0  80 8D 8C 94 */	lwz r4, lbl_8063DF54-_SDA_BASE_(r13)
/* 80302E54 002FEAB4  4B FF EC F5 */	bl NWC24FOpen
/* 80302E58 002FEAB8  2C 03 00 00 */	cmpwi r3, 0
/* 80302E5C 002FEABC  40 82 00 34 */	bne lbl_80302E90
/* 80302E60 002FEAC0  80 6D AF 88 */	lwz r3, lbl_80640248-_SDA_BASE_(r13)
/* 80302E64 002FEAC4  38 A1 00 08 */	addi r5, r1, 8
/* 80302E68 002FEAC8  38 80 04 00 */	li r4, 0x400
/* 80302E6C 002FEACC  4B FF F5 79 */	bl NWC24FWrite
/* 80302E70 002FEAD0  7C 7F 1B 78 */	mr r31, r3
/* 80302E74 002FEAD4  38 61 00 08 */	addi r3, r1, 8
/* 80302E78 002FEAD8  4B FF F0 21 */	bl NWC24FClose
/* 80302E7C 002FEADC  2C 1F 00 00 */	cmpwi r31, 0
/* 80302E80 002FEAE0  41 82 00 08 */	beq lbl_80302E88
/* 80302E84 002FEAE4  7F E3 FB 78 */	mr r3, r31
lbl_80302E88:
/* 80302E88 002FEAE8  38 00 00 00 */	li r0, 0
/* 80302E8C 002FEAEC  90 0D AF 8C */	stw r0, lbl_8064024C-_SDA_BASE_(r13)
lbl_80302E90:
/* 80302E90 002FEAF0  2C 03 00 00 */	cmpwi r3, 0
/* 80302E94 002FEAF4  41 82 00 08 */	beq lbl_80302E9C
/* 80302E98 002FEAF8  48 00 00 4C */	b lbl_80302EE4
lbl_80302E9C:
/* 80302E9C 002FEAFC  80 8D 8C 98 */	lwz r4, lbl_8063DF58-_SDA_BASE_(r13)
/* 80302EA0 002FEB00  38 61 00 08 */	addi r3, r1, 8
/* 80302EA4 002FEB04  38 A0 00 01 */	li r5, 1
/* 80302EA8 002FEB08  4B FF EC A1 */	bl NWC24FOpen
/* 80302EAC 002FEB0C  2C 03 00 00 */	cmpwi r3, 0
/* 80302EB0 002FEB10  40 82 00 34 */	bne lbl_80302EE4
/* 80302EB4 002FEB14  80 6D AF 88 */	lwz r3, lbl_80640248-_SDA_BASE_(r13)
/* 80302EB8 002FEB18  38 A1 00 08 */	addi r5, r1, 8
/* 80302EBC 002FEB1C  38 80 04 00 */	li r4, 0x400
/* 80302EC0 002FEB20  4B FF F5 25 */	bl NWC24FWrite
/* 80302EC4 002FEB24  7C 7F 1B 78 */	mr r31, r3
/* 80302EC8 002FEB28  38 61 00 08 */	addi r3, r1, 8
/* 80302ECC 002FEB2C  4B FF EF CD */	bl NWC24FClose
/* 80302ED0 002FEB30  2C 1F 00 00 */	cmpwi r31, 0
/* 80302ED4 002FEB34  41 82 00 08 */	beq lbl_80302EDC
/* 80302ED8 002FEB38  7F E3 FB 78 */	mr r3, r31
lbl_80302EDC:
/* 80302EDC 002FEB3C  38 00 00 00 */	li r0, 0
/* 80302EE0 002FEB40  90 0D AF 8C */	stw r0, lbl_8064024C-_SDA_BASE_(r13)
lbl_80302EE4:
/* 80302EE4 002FEB44  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 80302EE8 002FEB48  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 80302EEC 002FEB4C  7C 08 03 A6 */	mtlr r0
/* 80302EF0 002FEB50  38 21 00 B0 */	addi r1, r1, 0xb0
/* 80302EF4 002FEB54  4E 80 00 20 */	blr

.global NWC24GetMBoxDir
NWC24GetMBoxDir:
/* 80302EF8 002FEB58  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80302EFC 002FEB5C  7C 08 02 A6 */	mflr r0
/* 80302F00 002FEB60  90 01 00 14 */	stw r0, 0x14(r1)
/* 80302F04 002FEB64  38 61 00 08 */	addi r3, r1, 8
/* 80302F08 002FEB68  4B F6 55 B9 */	bl __OSGetIOSRev
/* 80302F0C 002FEB6C  88 01 00 09 */	lbz r0, 9(r1)
/* 80302F10 002FEB70  2C 00 00 00 */	cmpwi r0, 0
/* 80302F14 002FEB74  40 82 00 40 */	bne lbl_80302F54
/* 80302F18 002FEB78  88 61 00 0A */	lbz r3, 0xa(r1)
/* 80302F1C 002FEB7C  28 03 00 07 */	cmplwi r3, 7
/* 80302F20 002FEB80  40 82 00 10 */	bne lbl_80302F30
/* 80302F24 002FEB84  88 01 00 0B */	lbz r0, 0xb(r1)
/* 80302F28 002FEB88  2C 00 00 00 */	cmpwi r0, 0
/* 80302F2C 002FEB8C  41 82 00 0C */	beq lbl_80302F38
lbl_80302F30:
/* 80302F30 002FEB90  28 03 00 07 */	cmplwi r3, 7
/* 80302F34 002FEB94  40 80 00 20 */	bge lbl_80302F54
lbl_80302F38:
/* 80302F38 002FEB98  3C 60 80 44 */	lis r3, lbl_80446354@ha
/* 80302F3C 002FEB9C  3C A0 80 44 */	lis r5, lbl_80446364@ha
/* 80302F40 002FEBA0  38 63 63 54 */	addi r3, r3, lbl_80446354@l
/* 80302F44 002FEBA4  38 80 02 9A */	li r4, 0x29a
/* 80302F48 002FEBA8  38 A5 63 64 */	addi r5, r5, lbl_80446364@l
/* 80302F4C 002FEBAC  4C C6 31 82 */	crclr 6
/* 80302F50 002FEBB0  4B F6 85 4D */	bl OSPanic
lbl_80302F54:
/* 80302F54 002FEBB4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80302F58 002FEBB8  80 6D 8C 90 */	lwz r3, lbl_8063DF50-_SDA_BASE_(r13)
/* 80302F5C 002FEBBC  7C 08 03 A6 */	mtlr r0
/* 80302F60 002FEBC0  38 21 00 10 */	addi r1, r1, 0x10
/* 80302F64 002FEBC4  4E 80 00 20 */	blr

.global CheckConfig
CheckConfig:
/* 80302F68 002FEBC8  80 CD AF 88 */	lwz r6, lbl_80640248-_SDA_BASE_(r13)
/* 80302F6C 002FEBCC  80 66 00 00 */	lwz r3, 0(r6)
/* 80302F70 002FEBD0  3C 03 A8 9D */	addis r0, r3, 0xa89d
/* 80302F74 002FEBD4  28 00 43 66 */	cmplwi r0, 0x4366
/* 80302F78 002FEBD8  41 82 00 0C */	beq lbl_80302F84
/* 80302F7C 002FEBDC  38 60 FF F2 */	li r3, -14
/* 80302F80 002FEBE0  4E 80 00 20 */	blr
lbl_80302F84:
/* 80302F84 002FEBE4  38 00 00 1F */	li r0, 0x1f
/* 80302F88 002FEBE8  7C C4 33 78 */	mr r4, r6
/* 80302F8C 002FEBEC  38 A0 00 00 */	li r5, 0
/* 80302F90 002FEBF0  7C 09 03 A6 */	mtctr r0
lbl_80302F94:
/* 80302F94 002FEBF4  80 64 00 00 */	lwz r3, 0(r4)
/* 80302F98 002FEBF8  80 04 00 04 */	lwz r0, 4(r4)
/* 80302F9C 002FEBFC  7C A5 1A 14 */	add r5, r5, r3
/* 80302FA0 002FEC00  80 64 00 08 */	lwz r3, 8(r4)
/* 80302FA4 002FEC04  7C A5 02 14 */	add r5, r5, r0
/* 80302FA8 002FEC08  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80302FAC 002FEC0C  7C A5 1A 14 */	add r5, r5, r3
/* 80302FB0 002FEC10  80 64 00 10 */	lwz r3, 0x10(r4)
/* 80302FB4 002FEC14  7C A5 02 14 */	add r5, r5, r0
/* 80302FB8 002FEC18  80 04 00 14 */	lwz r0, 0x14(r4)
/* 80302FBC 002FEC1C  7C A5 1A 14 */	add r5, r5, r3
/* 80302FC0 002FEC20  80 64 00 18 */	lwz r3, 0x18(r4)
/* 80302FC4 002FEC24  7C A5 02 14 */	add r5, r5, r0
/* 80302FC8 002FEC28  80 04 00 1C */	lwz r0, 0x1c(r4)
/* 80302FCC 002FEC2C  7C A5 1A 14 */	add r5, r5, r3
/* 80302FD0 002FEC30  38 84 00 20 */	addi r4, r4, 0x20
/* 80302FD4 002FEC34  7C A5 02 14 */	add r5, r5, r0
/* 80302FD8 002FEC38  42 00 FF BC */	bdnz lbl_80302F94
/* 80302FDC 002FEC3C  80 64 00 00 */	lwz r3, 0(r4)
/* 80302FE0 002FEC40  80 04 00 04 */	lwz r0, 4(r4)
/* 80302FE4 002FEC44  7C A5 1A 14 */	add r5, r5, r3
/* 80302FE8 002FEC48  80 64 00 08 */	lwz r3, 8(r4)
/* 80302FEC 002FEC4C  7C A5 02 14 */	add r5, r5, r0
/* 80302FF0 002FEC50  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80302FF4 002FEC54  7C A5 1A 14 */	add r5, r5, r3
/* 80302FF8 002FEC58  80 64 00 10 */	lwz r3, 0x10(r4)
/* 80302FFC 002FEC5C  7C A5 02 14 */	add r5, r5, r0
/* 80303000 002FEC60  80 04 00 14 */	lwz r0, 0x14(r4)
/* 80303004 002FEC64  7C A5 1A 14 */	add r5, r5, r3
/* 80303008 002FEC68  80 64 00 18 */	lwz r3, 0x18(r4)
/* 8030300C 002FEC6C  7C A5 02 14 */	add r5, r5, r0
/* 80303010 002FEC70  80 06 03 FC */	lwz r0, 0x3fc(r6)
/* 80303014 002FEC74  7C A5 1A 14 */	add r5, r5, r3
/* 80303018 002FEC78  7C 00 28 40 */	cmplw r0, r5
/* 8030301C 002FEC7C  41 82 00 0C */	beq lbl_80303028
/* 80303020 002FEC80  38 60 FF F2 */	li r3, -14
/* 80303024 002FEC84  4E 80 00 20 */	blr
lbl_80303028:
/* 80303028 002FEC88  80 06 00 10 */	lwz r0, 0x10(r6)
/* 8030302C 002FEC8C  28 00 00 20 */	cmplwi r0, 0x20
/* 80303030 002FEC90  41 80 00 0C */	blt lbl_8030303C
/* 80303034 002FEC94  38 60 FF F2 */	li r3, -14
/* 80303038 002FEC98  4E 80 00 20 */	blr
lbl_8030303C:
/* 8030303C 002FEC9C  80 06 00 04 */	lwz r0, 4(r6)
/* 80303040 002FECA0  38 60 00 00 */	li r3, 0
/* 80303044 002FECA4  28 00 00 08 */	cmplwi r0, 8
/* 80303048 002FECA8  4D 82 00 20 */	beqlr
/* 8030304C 002FECAC  38 60 FF E5 */	li r3, -27
/* 80303050 002FECB0  4E 80 00 20 */	blr
