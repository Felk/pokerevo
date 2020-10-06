.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global BTA_EnableBluetooth
BTA_EnableBluetooth:
/* 802C002C 002BBC8C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C0030 002BBC90  7C 08 02 A6 */	mflr r0
/* 802C0034 002BBC94  3C 80 80 57 */	lis r4, lbl_80568814@ha
/* 802C0038 002BBC98  38 A0 01 04 */	li r5, 0x104
/* 802C003C 002BBC9C  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0040 002BBCA0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802C0044 002BBCA4  7C 7F 1B 78 */	mr r31, r3
/* 802C0048 002BBCA8  38 64 88 14 */	addi r3, r4, lbl_80568814@l
/* 802C004C 002BBCAC  38 80 00 00 */	li r4, 0
/* 802C0050 002BBCB0  4B D4 40 B5 */	bl memset
/* 802C0054 002BBCB4  4B FF B0 51 */	bl GKI_sched_lock
/* 802C0058 002BBCB8  38 60 00 01 */	li r3, 1
/* 802C005C 002BBCBC  38 82 A4 58 */	addi r4, r2, lbl_80642A58-_SDA2_BASE_
/* 802C0060 002BBCC0  4B FF D9 99 */	bl bta_sys_register
/* 802C0064 002BBCC4  38 60 00 02 */	li r3, 2
/* 802C0068 002BBCC8  38 82 A4 60 */	addi r4, r2, lbl_80642A60-_SDA2_BASE_
/* 802C006C 002BBCCC  4B FF D9 8D */	bl bta_sys_register
/* 802C0070 002BBCD0  4B FF B0 39 */	bl GKI_sched_unlock
/* 802C0074 002BBCD4  38 60 00 0C */	li r3, 0xc
/* 802C0078 002BBCD8  4B FF 9A 35 */	bl GKI_getbuf
/* 802C007C 002BBCDC  2C 03 00 00 */	cmpwi r3, 0
/* 802C0080 002BBCE0  41 82 00 1C */	beq lbl_802C009C
/* 802C0084 002BBCE4  38 00 01 00 */	li r0, 0x100
/* 802C0088 002BBCE8  B0 03 00 00 */	sth r0, 0(r3)
/* 802C008C 002BBCEC  93 E3 00 08 */	stw r31, 8(r3)
/* 802C0090 002BBCF0  4B FF D9 7D */	bl bta_sys_sendmsg
/* 802C0094 002BBCF4  38 60 00 00 */	li r3, 0
/* 802C0098 002BBCF8  48 00 00 08 */	b lbl_802C00A0
lbl_802C009C:
/* 802C009C 002BBCFC  38 60 00 01 */	li r3, 1
lbl_802C00A0:
/* 802C00A0 002BBD00  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C00A4 002BBD04  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802C00A8 002BBD08  7C 08 03 A6 */	mtlr r0
/* 802C00AC 002BBD0C  38 21 00 10 */	addi r1, r1, 0x10
/* 802C00B0 002BBD10  4E 80 00 20 */	blr

.global BTA_DisableBluetooth
BTA_DisableBluetooth:
/* 802C00B4 002BBD14  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C00B8 002BBD18  7C 08 02 A6 */	mflr r0
/* 802C00BC 002BBD1C  38 60 00 08 */	li r3, 8
/* 802C00C0 002BBD20  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C00C4 002BBD24  4B FF 99 E9 */	bl GKI_getbuf
/* 802C00C8 002BBD28  2C 03 00 00 */	cmpwi r3, 0
/* 802C00CC 002BBD2C  41 82 00 10 */	beq lbl_802C00DC
/* 802C00D0 002BBD30  38 00 01 01 */	li r0, 0x101
/* 802C00D4 002BBD34  B0 03 00 00 */	sth r0, 0(r3)
/* 802C00D8 002BBD38  4B FF D9 35 */	bl bta_sys_sendmsg
lbl_802C00DC:
/* 802C00DC 002BBD3C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C00E0 002BBD40  7C 08 03 A6 */	mtlr r0
/* 802C00E4 002BBD44  38 21 00 10 */	addi r1, r1, 0x10
/* 802C00E8 002BBD48  4E 80 00 20 */	blr

.global BTA_DmIsDeviceUp
BTA_DmIsDeviceUp:
/* 802C00EC 002BBD4C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C00F0 002BBD50  7C 08 02 A6 */	mflr r0
/* 802C00F4 002BBD54  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C00F8 002BBD58  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802C00FC 002BBD5C  4B FF AF A9 */	bl GKI_sched_lock
/* 802C0100 002BBD60  48 00 59 D1 */	bl BTM_IsDeviceUp
/* 802C0104 002BBD64  7C 7F 1B 78 */	mr r31, r3
/* 802C0108 002BBD68  4B FF AF A1 */	bl GKI_sched_unlock
/* 802C010C 002BBD6C  7F E3 FB 78 */	mr r3, r31
/* 802C0110 002BBD70  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802C0114 002BBD74  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C0118 002BBD78  7C 08 03 A6 */	mtlr r0
/* 802C011C 002BBD7C  38 21 00 10 */	addi r1, r1, 0x10
/* 802C0120 002BBD80  4E 80 00 20 */	blr

.global BTA_DmSetDeviceName
BTA_DmSetDeviceName:
/* 802C0124 002BBD84  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C0128 002BBD88  7C 08 02 A6 */	mflr r0
/* 802C012C 002BBD8C  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0130 002BBD90  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802C0134 002BBD94  93 C1 00 08 */	stw r30, 8(r1)
/* 802C0138 002BBD98  7C 7E 1B 78 */	mr r30, r3
/* 802C013C 002BBD9C  38 60 00 28 */	li r3, 0x28
/* 802C0140 002BBDA0  4B FF 99 6D */	bl GKI_getbuf
/* 802C0144 002BBDA4  2C 03 00 00 */	cmpwi r3, 0
/* 802C0148 002BBDA8  7C 7F 1B 78 */	mr r31, r3
/* 802C014C 002BBDAC  41 82 00 24 */	beq lbl_802C0170
/* 802C0150 002BBDB0  38 00 01 02 */	li r0, 0x102
/* 802C0154 002BBDB4  7F C4 F3 78 */	mr r4, r30
/* 802C0158 002BBDB8  B0 03 00 00 */	sth r0, 0(r3)
/* 802C015C 002BBDBC  38 A0 00 20 */	li r5, 0x20
/* 802C0160 002BBDC0  38 63 00 08 */	addi r3, r3, 8
/* 802C0164 002BBDC4  4B F0 E2 2D */	bl strncpy
/* 802C0168 002BBDC8  7F E3 FB 78 */	mr r3, r31
/* 802C016C 002BBDCC  4B FF D8 A1 */	bl bta_sys_sendmsg
lbl_802C0170:
/* 802C0170 002BBDD0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C0174 002BBDD4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802C0178 002BBDD8  83 C1 00 08 */	lwz r30, 8(r1)
/* 802C017C 002BBDDC  7C 08 03 A6 */	mtlr r0
/* 802C0180 002BBDE0  38 21 00 10 */	addi r1, r1, 0x10
/* 802C0184 002BBDE4  4E 80 00 20 */	blr

.global BTA_DmSetVisibility
BTA_DmSetVisibility:
/* 802C0188 002BBDE8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C018C 002BBDEC  7C 08 02 A6 */	mflr r0
/* 802C0190 002BBDF0  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0194 002BBDF4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802C0198 002BBDF8  7C 9F 23 78 */	mr r31, r4
/* 802C019C 002BBDFC  93 C1 00 08 */	stw r30, 8(r1)
/* 802C01A0 002BBE00  7C 7E 1B 78 */	mr r30, r3
/* 802C01A4 002BBE04  38 60 01 10 */	li r3, 0x110
/* 802C01A8 002BBE08  4B FF 99 05 */	bl GKI_getbuf
/* 802C01AC 002BBE0C  2C 03 00 00 */	cmpwi r3, 0
/* 802C01B0 002BBE10  41 82 00 18 */	beq lbl_802C01C8
/* 802C01B4 002BBE14  38 00 01 03 */	li r0, 0x103
/* 802C01B8 002BBE18  B0 03 00 00 */	sth r0, 0(r3)
/* 802C01BC 002BBE1C  9B C3 00 08 */	stb r30, 8(r3)
/* 802C01C0 002BBE20  9B E3 00 09 */	stb r31, 9(r3)
/* 802C01C4 002BBE24  4B FF D8 49 */	bl bta_sys_sendmsg
lbl_802C01C8:
/* 802C01C8 002BBE28  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C01CC 002BBE2C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802C01D0 002BBE30  83 C1 00 08 */	lwz r30, 8(r1)
/* 802C01D4 002BBE34  7C 08 03 A6 */	mtlr r0
/* 802C01D8 002BBE38  38 21 00 10 */	addi r1, r1, 0x10
/* 802C01DC 002BBE3C  4E 80 00 20 */	blr

.global BTA_DmSearch
BTA_DmSearch:
/* 802C01E0 002BBE40  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802C01E4 002BBE44  7C 08 02 A6 */	mflr r0
/* 802C01E8 002BBE48  90 01 00 24 */	stw r0, 0x24(r1)
/* 802C01EC 002BBE4C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802C01F0 002BBE50  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802C01F4 002BBE54  7C BE 2B 78 */	mr r30, r5
/* 802C01F8 002BBE58  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802C01FC 002BBE5C  7C 9D 23 78 */	mr r29, r4
/* 802C0200 002BBE60  93 81 00 10 */	stw r28, 0x10(r1)
/* 802C0204 002BBE64  7C 7C 1B 78 */	mr r28, r3
/* 802C0208 002BBE68  38 60 00 1C */	li r3, 0x1c
/* 802C020C 002BBE6C  4B FF 98 A1 */	bl GKI_getbuf
/* 802C0210 002BBE70  2C 03 00 00 */	cmpwi r3, 0
/* 802C0214 002BBE74  7C 7F 1B 78 */	mr r31, r3
/* 802C0218 002BBE78  41 82 00 2C */	beq lbl_802C0244
/* 802C021C 002BBE7C  38 00 02 00 */	li r0, 0x200
/* 802C0220 002BBE80  7F 84 E3 78 */	mr r4, r28
/* 802C0224 002BBE84  B0 03 00 00 */	sth r0, 0(r3)
/* 802C0228 002BBE88  38 A0 00 0A */	li r5, 0xa
/* 802C022C 002BBE8C  38 63 00 08 */	addi r3, r3, 8
/* 802C0230 002BBE90  4B D4 3D D1 */	bl memcpy
/* 802C0234 002BBE94  93 BF 00 14 */	stw r29, 0x14(r31)
/* 802C0238 002BBE98  7F E3 FB 78 */	mr r3, r31
/* 802C023C 002BBE9C  93 DF 00 18 */	stw r30, 0x18(r31)
/* 802C0240 002BBEA0  4B FF D7 CD */	bl bta_sys_sendmsg
lbl_802C0244:
/* 802C0244 002BBEA4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802C0248 002BBEA8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802C024C 002BBEAC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802C0250 002BBEB0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802C0254 002BBEB4  83 81 00 10 */	lwz r28, 0x10(r1)
/* 802C0258 002BBEB8  7C 08 03 A6 */	mtlr r0
/* 802C025C 002BBEBC  38 21 00 20 */	addi r1, r1, 0x20
/* 802C0260 002BBEC0  4E 80 00 20 */	blr

.global BTA_DmSearchCancel
BTA_DmSearchCancel:
/* 802C0264 002BBEC4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C0268 002BBEC8  7C 08 02 A6 */	mflr r0
/* 802C026C 002BBECC  38 60 00 08 */	li r3, 8
/* 802C0270 002BBED0  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0274 002BBED4  4B FF 98 39 */	bl GKI_getbuf
/* 802C0278 002BBED8  2C 03 00 00 */	cmpwi r3, 0
/* 802C027C 002BBEDC  41 82 00 10 */	beq lbl_802C028C
/* 802C0280 002BBEE0  38 00 02 01 */	li r0, 0x201
/* 802C0284 002BBEE4  B0 03 00 00 */	sth r0, 0(r3)
/* 802C0288 002BBEE8  4B FF D7 85 */	bl bta_sys_sendmsg
lbl_802C028C:
/* 802C028C 002BBEEC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C0290 002BBEF0  7C 08 03 A6 */	mtlr r0
/* 802C0294 002BBEF4  38 21 00 10 */	addi r1, r1, 0x10
/* 802C0298 002BBEF8  4E 80 00 20 */	blr

.global BTA_DmPinReply
BTA_DmPinReply:
/* 802C029C 002BBEFC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802C02A0 002BBF00  7C 08 02 A6 */	mflr r0
/* 802C02A4 002BBF04  90 01 00 24 */	stw r0, 0x24(r1)
/* 802C02A8 002BBF08  39 61 00 20 */	addi r11, r1, 0x20
/* 802C02AC 002BBF0C  4B F0 6E 7D */	bl _savegpr_27
/* 802C02B0 002BBF10  7C 7B 1B 78 */	mr r27, r3
/* 802C02B4 002BBF14  7C 9C 23 78 */	mr r28, r4
/* 802C02B8 002BBF18  7C BD 2B 78 */	mr r29, r5
/* 802C02BC 002BBF1C  7C DE 33 78 */	mr r30, r6
/* 802C02C0 002BBF20  38 60 00 20 */	li r3, 0x20
/* 802C02C4 002BBF24  4B FF 97 E9 */	bl GKI_getbuf
/* 802C02C8 002BBF28  2C 03 00 00 */	cmpwi r3, 0
/* 802C02CC 002BBF2C  7C 7F 1B 78 */	mr r31, r3
/* 802C02D0 002BBF30  41 82 00 40 */	beq lbl_802C0310
/* 802C02D4 002BBF34  38 00 01 07 */	li r0, 0x107
/* 802C02D8 002BBF38  7F 64 DB 78 */	mr r4, r27
/* 802C02DC 002BBF3C  B0 03 00 00 */	sth r0, 0(r3)
/* 802C02E0 002BBF40  38 63 00 08 */	addi r3, r3, 8
/* 802C02E4 002BBF44  4B FF D2 7D */	bl bdcpy
/* 802C02E8 002BBF48  2C 1C 00 00 */	cmpwi r28, 0
/* 802C02EC 002BBF4C  9B 9F 00 0E */	stb r28, 0xe(r31)
/* 802C02F0 002BBF50  41 82 00 18 */	beq lbl_802C0308
/* 802C02F4 002BBF54  9B BF 00 0F */	stb r29, 0xf(r31)
/* 802C02F8 002BBF58  7F C4 F3 78 */	mr r4, r30
/* 802C02FC 002BBF5C  7F A5 EB 78 */	mr r5, r29
/* 802C0300 002BBF60  38 7F 00 10 */	addi r3, r31, 0x10
/* 802C0304 002BBF64  4B D4 3C FD */	bl memcpy
lbl_802C0308:
/* 802C0308 002BBF68  7F E3 FB 78 */	mr r3, r31
/* 802C030C 002BBF6C  4B FF D7 01 */	bl bta_sys_sendmsg
lbl_802C0310:
/* 802C0310 002BBF70  39 61 00 20 */	addi r11, r1, 0x20
/* 802C0314 002BBF74  4B F0 6E 61 */	bl _restgpr_27
/* 802C0318 002BBF78  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802C031C 002BBF7C  7C 08 03 A6 */	mtlr r0
/* 802C0320 002BBF80  38 21 00 20 */	addi r1, r1, 0x20
/* 802C0324 002BBF84  4E 80 00 20 */	blr

.global BTA_DmAddDevice
BTA_DmAddDevice:
/* 802C0328 002BBF88  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 802C032C 002BBF8C  7C 08 02 A6 */	mflr r0
/* 802C0330 002BBF90  90 01 00 34 */	stw r0, 0x34(r1)
/* 802C0334 002BBF94  39 61 00 30 */	addi r11, r1, 0x30
/* 802C0338 002BBF98  4B F0 6D F1 */	bl _savegpr_27
/* 802C033C 002BBF9C  7C 7C 1B 78 */	mr r28, r3
/* 802C0340 002BBFA0  7C 9D 23 78 */	mr r29, r4
/* 802C0344 002BBFA4  7C BE 2B 78 */	mr r30, r5
/* 802C0348 002BBFA8  7C DB 33 78 */	mr r27, r6
/* 802C034C 002BBFAC  38 61 00 08 */	addi r3, r1, 8
/* 802C0350 002BBFB0  3B E0 00 00 */	li r31, 0
/* 802C0354 002BBFB4  38 80 00 00 */	li r4, 0
/* 802C0358 002BBFB8  38 A0 00 08 */	li r5, 8
/* 802C035C 002BBFBC  4B D4 3D A9 */	bl memset
/* 802C0360 002BBFC0  2C 1B 00 00 */	cmpwi r27, 0
/* 802C0364 002BBFC4  41 82 00 68 */	beq lbl_802C03CC
/* 802C0368 002BBFC8  3C E0 80 40 */	lis r7, lbl_803FDB90@ha
/* 802C036C 002BBFCC  38 A1 00 08 */	addi r5, r1, 8
/* 802C0370 002BBFD0  38 E7 DB 90 */	addi r7, r7, lbl_803FDB90@l
/* 802C0374 002BBFD4  38 60 00 01 */	li r3, 1
/* 802C0378 002BBFD8  48 00 00 40 */	b lbl_802C03B8
lbl_802C037C:
/* 802C037C 002BBFDC  57 E0 06 3E */	clrlwi r0, r31, 0x18
/* 802C0380 002BBFE0  7C 64 00 30 */	slw r4, r3, r0
/* 802C0384 002BBFE4  7F C0 20 39 */	and. r0, r30, r4
/* 802C0388 002BBFE8  41 82 00 2C */	beq lbl_802C03B4
/* 802C038C 002BBFEC  57 E0 15 BA */	rlwinm r0, r31, 2, 0x16, 0x1d
/* 802C0390 002BBFF0  7F DE 20 78 */	andc r30, r30, r4
/* 802C0394 002BBFF4  7C 87 00 2E */	lwzx r4, r7, r0
/* 802C0398 002BBFF8  54 80 04 F4 */	rlwinm r0, r4, 0, 0x13, 0x1a
/* 802C039C 002BBFFC  54 86 ED BA */	rlwinm r6, r4, 0x1d, 0x16, 0x1d
/* 802C03A0 002BC000  7C 00 20 50 */	subf r0, r0, r4
/* 802C03A4 002BC004  7C 85 30 2E */	lwzx r4, r5, r6
/* 802C03A8 002BC008  7C 60 00 30 */	slw r0, r3, r0
/* 802C03AC 002BC00C  7C 80 03 78 */	or r0, r4, r0
/* 802C03B0 002BC010  7C 05 31 2E */	stwx r0, r5, r6
lbl_802C03B4:
/* 802C03B4 002BC014  3B FF 00 01 */	addi r31, r31, 1
lbl_802C03B8:
/* 802C03B8 002BC018  2C 1E 00 00 */	cmpwi r30, 0
/* 802C03BC 002BC01C  41 82 00 10 */	beq lbl_802C03CC
/* 802C03C0 002BC020  57 E0 06 3E */	clrlwi r0, r31, 0x18
/* 802C03C4 002BC024  28 00 00 17 */	cmplwi r0, 0x17
/* 802C03C8 002BC028  41 80 FF B4 */	blt lbl_802C037C
lbl_802C03CC:
/* 802C03CC 002BC02C  4B FF AC D9 */	bl GKI_sched_lock
/* 802C03D0 002BC030  7F 83 E3 78 */	mr r3, r28
/* 802C03D4 002BC034  7F A8 EB 78 */	mr r8, r29
/* 802C03D8 002BC038  38 E1 00 08 */	addi r7, r1, 8
/* 802C03DC 002BC03C  38 80 00 00 */	li r4, 0
/* 802C03E0 002BC040  38 A0 00 00 */	li r5, 0
/* 802C03E4 002BC044  38 C0 00 00 */	li r6, 0
/* 802C03E8 002BC048  48 00 4D 89 */	bl BTM_SecAddDevice
/* 802C03EC 002BC04C  7C 7C 1B 78 */	mr r28, r3
/* 802C03F0 002BC050  4B FF AC B9 */	bl GKI_sched_unlock
/* 802C03F4 002BC054  57 80 06 3E */	clrlwi r0, r28, 0x18
/* 802C03F8 002BC058  39 61 00 30 */	addi r11, r1, 0x30
/* 802C03FC 002BC05C  7C 00 00 34 */	cntlzw r0, r0
/* 802C0400 002BC060  54 03 DE 3E */	rlwinm r3, r0, 0x1b, 0x18, 0x1f
/* 802C0404 002BC064  4B F0 6D 71 */	bl _restgpr_27
/* 802C0408 002BC068  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802C040C 002BC06C  7C 08 03 A6 */	mtlr r0
/* 802C0410 002BC070  38 21 00 30 */	addi r1, r1, 0x30
/* 802C0414 002BC074  4E 80 00 20 */	blr

.global BTA_DmRemoveDevice
BTA_DmRemoveDevice:
/* 802C0418 002BC078  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C041C 002BC07C  7C 08 02 A6 */	mflr r0
/* 802C0420 002BC080  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0424 002BC084  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802C0428 002BC088  7C 7F 1B 78 */	mr r31, r3
/* 802C042C 002BC08C  4B FF AC 79 */	bl GKI_sched_lock
/* 802C0430 002BC090  7F E3 FB 78 */	mr r3, r31
/* 802C0434 002BC094  48 00 4E C5 */	bl BTM_SecDeleteDevice
/* 802C0438 002BC098  7C 7F 1B 78 */	mr r31, r3
/* 802C043C 002BC09C  4B FF AC 6D */	bl GKI_sched_unlock
/* 802C0440 002BC0A0  57 E0 06 3E */	clrlwi r0, r31, 0x18
/* 802C0444 002BC0A4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 802C0448 002BC0A8  7C 00 00 34 */	cntlzw r0, r0
/* 802C044C 002BC0AC  54 03 DE 3E */	rlwinm r3, r0, 0x1b, 0x18, 0x1f
/* 802C0450 002BC0B0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C0454 002BC0B4  7C 08 03 A6 */	mtlr r0
/* 802C0458 002BC0B8  38 21 00 10 */	addi r1, r1, 0x10
/* 802C045C 002BC0BC  4E 80 00 20 */	blr

.global BTA_DmSendHciReset
BTA_DmSendHciReset:
/* 802C0460 002BC0C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802C0464 002BC0C4  7C 08 02 A6 */	mflr r0
/* 802C0468 002BC0C8  38 60 00 08 */	li r3, 8
/* 802C046C 002BC0CC  90 01 00 14 */	stw r0, 0x14(r1)
/* 802C0470 002BC0D0  4B FF 96 3D */	bl GKI_getbuf
/* 802C0474 002BC0D4  2C 03 00 00 */	cmpwi r3, 0
/* 802C0478 002BC0D8  41 82 00 10 */	beq lbl_802C0488
/* 802C047C 002BC0DC  38 00 01 0C */	li r0, 0x10c
/* 802C0480 002BC0E0  B0 03 00 00 */	sth r0, 0(r3)
/* 802C0484 002BC0E4  4B FF D5 89 */	bl bta_sys_sendmsg
lbl_802C0488:
/* 802C0488 002BC0E8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802C048C 002BC0EC  7C 08 03 A6 */	mtlr r0
/* 802C0490 002BC0F0  38 21 00 10 */	addi r1, r1, 0x10
/* 802C0494 002BC0F4  4E 80 00 20 */	blr