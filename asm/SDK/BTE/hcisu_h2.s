.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

hcisu_h2_usb_cback:
/* 802BB1F8 002B6E58  2C 03 00 04 */	cmpwi r3, 4
/* 802BB1FC 002B6E5C  41 82 00 14 */	beq lbl_802BB210
/* 802BB200 002B6E60  4C 80 00 20 */	bgelr
/* 802BB204 002B6E64  2C 03 00 00 */	cmpwi r3, 0
/* 802BB208 002B6E68  4D 82 00 20 */	beqlr
/* 802BB20C 002B6E6C  4E 80 00 20 */	blr
lbl_802BB210:
/* 802BB210 002B6E70  7C 83 07 74 */	extsb r3, r4
/* 802BB214 002B6E74  48 00 1E CC */	b bta_usb_close_evt
/* 802BB218 002B6E78  4E 80 00 20 */	blr

.global hcisu_h2_receive_msg
hcisu_h2_receive_msg:
/* 802BB21C 002B6E7C  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 802BB220 002B6E80  7C 08 02 A6 */	mflr r0
/* 802BB224 002B6E84  90 01 00 64 */	stw r0, 0x64(r1)
/* 802BB228 002B6E88  39 61 00 60 */	addi r11, r1, 0x60
/* 802BB22C 002B6E8C  4B F0 BE C9 */	bl __save_gpr
/* 802BB230 002B6E90  88 04 00 1E */	lbz r0, 0x1e(r4)
/* 802BB234 002B6E94  7C 8F 23 78 */	mr r15, r4
/* 802BB238 002B6E98  3A 60 00 00 */	li r19, 0
/* 802BB23C 002B6E9C  28 00 00 02 */	cmplwi r0, 2
/* 802BB240 002B6EA0  41 82 00 0C */	beq lbl_802BB24C
/* 802BB244 002B6EA4  38 60 00 00 */	li r3, 0
/* 802BB248 002B6EA8  48 00 03 54 */	b lbl_802BB59C
lbl_802BB24C:
/* 802BB24C 002B6EAC  3A 83 00 01 */	addi r20, r3, 1
/* 802BB250 002B6EB0  54 60 0B FC */	rlwinm r0, r3, 1, 0xf, 0x1e
/* 802BB254 002B6EB4  3F E0 80 56 */	lis r31, lbl_80564DA0@ha
/* 802BB258 002B6EB8  7E C4 1A 14 */	add r22, r4, r3
/* 802BB25C 002B6EBC  56 90 04 3E */	clrlwi r16, r20, 0x10
/* 802BB260 002B6EC0  54 77 13 BA */	rlwinm r23, r3, 2, 0xe, 0x1d
/* 802BB264 002B6EC4  7E A4 02 14 */	add r21, r4, r0
/* 802BB268 002B6EC8  3B FF 4D A0 */	addi r31, r31, lbl_80564DA0@l
/* 802BB26C 002B6ECC  3B A0 00 00 */	li r29, 0
/* 802BB270 002B6ED0  3B C0 00 04 */	li r30, 4
/* 802BB274 002B6ED4  3B 82 A4 38 */	addi r28, r2, lbl_80642A38-_SDA2_BASE_
/* 802BB278 002B6ED8  3B 20 00 03 */	li r25, 3
/* 802BB27C 002B6EDC  3B 00 00 02 */	li r24, 2
/* 802BB280 002B6EE0  3D C0 80 44 */	lis r14, 0x8044
/* 802BB284 002B6EE4  3B 42 A4 40 */	addi r26, r2, lbl_80642A40-_SDA2_BASE_
/* 802BB288 002B6EE8  3B 60 00 01 */	li r27, 1
lbl_802BB28C:
/* 802BB28C 002B6EEC  56 03 06 3E */	clrlwi r3, r16, 0x18
/* 802BB290 002B6EF0  38 81 00 08 */	addi r4, r1, 8
/* 802BB294 002B6EF4  38 A0 00 01 */	li r5, 1
/* 802BB298 002B6EF8  48 00 14 59 */	bl UUSB_Read
/* 802BB29C 002B6EFC  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB2A0 002B6F00  41 82 02 F8 */	beq lbl_802BB598
/* 802BB2A4 002B6F04  88 16 00 1A */	lbz r0, 0x1a(r22)
/* 802BB2A8 002B6F08  3A 20 00 00 */	li r17, 0
/* 802BB2AC 002B6F0C  3A 73 00 01 */	addi r19, r19, 1
/* 802BB2B0 002B6F10  2C 00 00 02 */	cmpwi r0, 2
/* 802BB2B4 002B6F14  41 82 01 C8 */	beq lbl_802BB47C
/* 802BB2B8 002B6F18  40 80 00 14 */	bge lbl_802BB2CC
/* 802BB2BC 002B6F1C  2C 00 00 00 */	cmpwi r0, 0
/* 802BB2C0 002B6F20  41 82 00 1C */	beq lbl_802BB2DC
/* 802BB2C4 002B6F24  40 80 00 C0 */	bge lbl_802BB384
/* 802BB2C8 002B6F28  48 00 02 B0 */	b lbl_802BB578
lbl_802BB2CC:
/* 802BB2CC 002B6F2C  2C 00 00 04 */	cmpwi r0, 4
/* 802BB2D0 002B6F30  41 82 02 90 */	beq lbl_802BB560
/* 802BB2D4 002B6F34  40 80 02 A4 */	bge lbl_802BB578
/* 802BB2D8 002B6F38  48 00 01 F0 */	b lbl_802BB4C8
lbl_802BB2DC:
/* 802BB2DC 002B6F3C  28 10 00 01 */	cmplwi r16, 1
/* 802BB2E0 002B6F40  40 82 00 18 */	bne lbl_802BB2F8
/* 802BB2E4 002B6F44  38 60 00 02 */	li r3, 2
/* 802BB2E8 002B6F48  4B FF E9 65 */	bl GKI_getpoolbuf
/* 802BB2EC 002B6F4C  7C 6F B9 2E */	stwx r3, r15, r23
/* 802BB2F0 002B6F50  9B D6 00 14 */	stb r30, 0x14(r22)
/* 802BB2F4 002B6F54  48 00 00 38 */	b lbl_802BB32C
lbl_802BB2F8:
/* 802BB2F8 002B6F58  28 10 00 02 */	cmplwi r16, 2
/* 802BB2FC 002B6F5C  40 82 00 18 */	bne lbl_802BB314
/* 802BB300 002B6F60  38 60 00 03 */	li r3, 3
/* 802BB304 002B6F64  4B FF E9 49 */	bl GKI_getpoolbuf
/* 802BB308 002B6F68  7C 6F B9 2E */	stwx r3, r15, r23
/* 802BB30C 002B6F6C  9B 16 00 14 */	stb r24, 0x14(r22)
/* 802BB310 002B6F70  48 00 00 1C */	b lbl_802BB32C
lbl_802BB314:
/* 802BB314 002B6F74  28 10 00 03 */	cmplwi r16, 3
/* 802BB318 002B6F78  40 82 02 60 */	bne lbl_802BB578
/* 802BB31C 002B6F7C  38 60 00 01 */	li r3, 1
/* 802BB320 002B6F80  4B FF E9 2D */	bl GKI_getpoolbuf
/* 802BB324 002B6F84  7C 6F B9 2E */	stwx r3, r15, r23
/* 802BB328 002B6F88  9B 36 00 14 */	stb r25, 0x14(r22)
lbl_802BB32C:
/* 802BB32C 002B6F8C  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB330 002B6F90  2C 03 00 00 */	cmpwi r3, 0
/* 802BB334 002B6F94  41 82 00 30 */	beq lbl_802BB364
/* 802BB338 002B6F98  B3 A3 00 02 */	sth r29, 2(r3)
/* 802BB33C 002B6F9C  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB340 002B6FA0  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB344 002B6FA4  54 00 08 3C */	slwi r0, r0, 1
/* 802BB348 002B6FA8  7C 9A 02 14 */	add r4, r26, r0
/* 802BB34C 002B6FAC  A0 04 FF FE */	lhz r0, -2(r4)
/* 802BB350 002B6FB0  B0 03 00 00 */	sth r0, 0(r3)
/* 802BB354 002B6FB4  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB358 002B6FB8  B3 A3 00 04 */	sth r29, 4(r3)
/* 802BB35C 002B6FBC  9B 76 00 1A */	stb r27, 0x1a(r22)
/* 802BB360 002B6FC0  48 00 00 14 */	b lbl_802BB374
lbl_802BB364:
/* 802BB364 002B6FC4  38 8E F2 78 */	addi r4, r14, -3464
/* 802BB368 002B6FC8  3C 60 00 07 */	lis r3, 7
/* 802BB36C 002B6FCC  48 00 1B A5 */	bl LogMsg_0
/* 802BB370 002B6FD0  9B 16 00 1A */	stb r24, 0x1a(r22)
lbl_802BB374:
/* 802BB374 002B6FD4  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB378 002B6FD8  7C 7C 02 14 */	add r3, r28, r0
/* 802BB37C 002B6FDC  88 03 FF FF */	lbz r0, -1(r3)
/* 802BB380 002B6FE0  B0 15 00 0C */	sth r0, 0xc(r21)
lbl_802BB384:
/* 802BB384 002B6FE4  7C CF B8 2E */	lwzx r6, r15, r23
/* 802BB388 002B6FE8  88 A1 00 08 */	lbz r5, 8(r1)
/* 802BB38C 002B6FEC  A0 86 00 02 */	lhz r4, 2(r6)
/* 802BB390 002B6FF0  7C 66 22 14 */	add r3, r6, r4
/* 802BB394 002B6FF4  38 04 00 01 */	addi r0, r4, 1
/* 802BB398 002B6FF8  98 A3 00 08 */	stb r5, 8(r3)
/* 802BB39C 002B6FFC  B0 06 00 02 */	sth r0, 2(r6)
/* 802BB3A0 002B7000  A0 75 00 0C */	lhz r3, 0xc(r21)
/* 802BB3A4 002B7004  38 63 FF FF */	addi r3, r3, -1
/* 802BB3A8 002B7008  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB3AC 002B700C  B0 75 00 0C */	sth r3, 0xc(r21)
/* 802BB3B0 002B7010  40 82 00 C0 */	bne lbl_802BB470
/* 802BB3B4 002B7014  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB3B8 002B7018  8A 41 00 08 */	lbz r18, 8(r1)
/* 802BB3BC 002B701C  28 00 00 02 */	cmplwi r0, 2
/* 802BB3C0 002B7020  40 82 00 44 */	bne lbl_802BB404
/* 802BB3C4 002B7024  88 16 00 17 */	lbz r0, 0x17(r22)
/* 802BB3C8 002B7028  56 44 42 2E */	rlwinm r4, r18, 8, 8, 0x17
/* 802BB3CC 002B702C  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB3D0 002B7030  7C 04 02 14 */	add r0, r4, r0
/* 802BB3D4 002B7034  54 12 04 3E */	clrlwi r18, r0, 0x10
/* 802BB3D8 002B7038  48 01 D2 45 */	bl l2cap_link_chk_pkt_start
/* 802BB3DC 002B703C  2C 03 00 00 */	cmpwi r3, 0
/* 802BB3E0 002B7040  7C 6F B9 2E */	stwx r3, r15, r23
/* 802BB3E4 002B7044  40 82 00 20 */	bne lbl_802BB404
/* 802BB3E8 002B7048  2C 12 00 00 */	cmpwi r18, 0
/* 802BB3EC 002B704C  B2 55 00 0C */	sth r18, 0xc(r21)
/* 802BB3F0 002B7050  40 82 00 0C */	bne lbl_802BB3FC
/* 802BB3F4 002B7054  9B B6 00 1A */	stb r29, 0x1a(r22)
/* 802BB3F8 002B7058  48 00 01 80 */	b lbl_802BB578
lbl_802BB3FC:
/* 802BB3FC 002B705C  9B D6 00 1A */	stb r30, 0x1a(r22)
/* 802BB400 002B7060  48 00 01 78 */	b lbl_802BB578
lbl_802BB404:
/* 802BB404 002B7064  B2 55 00 0C */	sth r18, 0xc(r21)
/* 802BB408 002B7068  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB40C 002B706C  4B FF EA 99 */	bl GKI_get_buf_size
/* 802BB410 002B7070  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB414 002B7074  54 64 04 3E */	clrlwi r4, r3, 0x10
/* 802BB418 002B7078  7C 7C 02 14 */	add r3, r28, r0
/* 802BB41C 002B707C  88 03 FF FF */	lbz r0, -1(r3)
/* 802BB420 002B7080  7C 72 02 14 */	add r3, r18, r0
/* 802BB424 002B7084  38 03 00 08 */	addi r0, r3, 8
/* 802BB428 002B7088  7C 00 20 40 */	cmplw r0, r4
/* 802BB42C 002B708C  40 81 00 28 */	ble lbl_802BB454
/* 802BB430 002B7090  7C 6F B8 2E */	lwzx r3, r15, r23
/* 802BB434 002B7094  4B FF E9 01 */	bl GKI_freebuf
/* 802BB438 002B7098  7F AF B9 2E */	stwx r29, r15, r23
/* 802BB43C 002B709C  3C 60 80 44 */	lis r3, lbl_8043F2B4@ha
/* 802BB440 002B70A0  38 83 F2 B4 */	addi r4, r3, lbl_8043F2B4@l
/* 802BB444 002B70A4  9B D6 00 1A */	stb r30, 0x1a(r22)
/* 802BB448 002B70A8  3C 60 00 07 */	lis r3, 7
/* 802BB44C 002B70AC  48 00 1A C5 */	bl LogMsg_0
/* 802BB450 002B70B0  48 00 01 28 */	b lbl_802BB578
lbl_802BB454:
/* 802BB454 002B70B4  2C 12 00 00 */	cmpwi r18, 0
/* 802BB458 002B70B8  41 82 00 0C */	beq lbl_802BB464
/* 802BB45C 002B70BC  9B 36 00 1A */	stb r25, 0x1a(r22)
/* 802BB460 002B70C0  48 00 01 18 */	b lbl_802BB578
lbl_802BB464:
/* 802BB464 002B70C4  9B B6 00 1A */	stb r29, 0x1a(r22)
/* 802BB468 002B70C8  3A 20 00 01 */	li r17, 1
/* 802BB46C 002B70CC  48 00 01 0C */	b lbl_802BB578
lbl_802BB470:
/* 802BB470 002B70D0  88 01 00 08 */	lbz r0, 8(r1)
/* 802BB474 002B70D4  98 16 00 17 */	stb r0, 0x17(r22)
/* 802BB478 002B70D8  48 00 01 00 */	b lbl_802BB578
lbl_802BB47C:
/* 802BB47C 002B70DC  A0 75 00 0C */	lhz r3, 0xc(r21)
/* 802BB480 002B70E0  38 63 FF FF */	addi r3, r3, -1
/* 802BB484 002B70E4  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB488 002B70E8  B0 75 00 0C */	sth r3, 0xc(r21)
/* 802BB48C 002B70EC  40 82 00 30 */	bne lbl_802BB4BC
/* 802BB490 002B70F0  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB494 002B70F4  88 61 00 08 */	lbz r3, 8(r1)
/* 802BB498 002B70F8  28 00 00 02 */	cmplwi r0, 2
/* 802BB49C 002B70FC  40 82 00 14 */	bne lbl_802BB4B0
/* 802BB4A0 002B7100  88 16 00 17 */	lbz r0, 0x17(r22)
/* 802BB4A4 002B7104  54 63 42 2E */	rlwinm r3, r3, 8, 8, 0x17
/* 802BB4A8 002B7108  7C 03 02 14 */	add r0, r3, r0
/* 802BB4AC 002B710C  54 03 04 3E */	clrlwi r3, r0, 0x10
lbl_802BB4B0:
/* 802BB4B0 002B7110  B0 75 00 0C */	sth r3, 0xc(r21)
/* 802BB4B4 002B7114  9B D6 00 1A */	stb r30, 0x1a(r22)
/* 802BB4B8 002B7118  48 00 00 C0 */	b lbl_802BB578
lbl_802BB4BC:
/* 802BB4BC 002B711C  88 01 00 08 */	lbz r0, 8(r1)
/* 802BB4C0 002B7120  98 16 00 17 */	stb r0, 0x17(r22)
/* 802BB4C4 002B7124  48 00 00 B4 */	b lbl_802BB578
lbl_802BB4C8:
/* 802BB4C8 002B7128  7C EF B8 2E */	lwzx r7, r15, r23
/* 802BB4CC 002B712C  56 83 06 3E */	clrlwi r3, r20, 0x18
/* 802BB4D0 002B7130  88 C1 00 08 */	lbz r6, 8(r1)
/* 802BB4D4 002B7134  A0 A7 00 02 */	lhz r5, 2(r7)
/* 802BB4D8 002B7138  7C 87 2A 14 */	add r4, r7, r5
/* 802BB4DC 002B713C  38 05 00 01 */	addi r0, r5, 1
/* 802BB4E0 002B7140  98 C4 00 08 */	stb r6, 8(r4)
/* 802BB4E4 002B7144  B0 07 00 02 */	sth r0, 2(r7)
/* 802BB4E8 002B7148  A0 95 00 0C */	lhz r4, 0xc(r21)
/* 802BB4EC 002B714C  38 04 FF FF */	addi r0, r4, -1
/* 802BB4F0 002B7150  B0 15 00 0C */	sth r0, 0xc(r21)
/* 802BB4F4 002B7154  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 802BB4F8 002B7158  7C 8F B8 2E */	lwzx r4, r15, r23
/* 802BB4FC 002B715C  A0 04 00 02 */	lhz r0, 2(r4)
/* 802BB500 002B7160  7C 84 02 14 */	add r4, r4, r0
/* 802BB504 002B7164  38 84 00 08 */	addi r4, r4, 8
/* 802BB508 002B7168  48 00 11 E9 */	bl UUSB_Read
/* 802BB50C 002B716C  7C 8F B8 2E */	lwzx r4, r15, r23
/* 802BB510 002B7170  7E 73 1A 14 */	add r19, r19, r3
/* 802BB514 002B7174  A0 04 00 02 */	lhz r0, 2(r4)
/* 802BB518 002B7178  7C 00 1A 14 */	add r0, r0, r3
/* 802BB51C 002B717C  B0 04 00 02 */	sth r0, 2(r4)
/* 802BB520 002B7180  A0 15 00 0C */	lhz r0, 0xc(r21)
/* 802BB524 002B7184  7C 63 00 50 */	subf r3, r3, r0
/* 802BB528 002B7188  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB52C 002B718C  B0 75 00 0C */	sth r3, 0xc(r21)
/* 802BB530 002B7190  40 82 00 48 */	bne lbl_802BB578
/* 802BB534 002B7194  88 16 00 14 */	lbz r0, 0x14(r22)
/* 802BB538 002B7198  28 00 00 02 */	cmplwi r0, 2
/* 802BB53C 002B719C  40 82 00 18 */	bne lbl_802BB554
/* 802BB540 002B71A0  48 01 D2 AD */	bl l2cap_link_chk_pkt_end
/* 802BB544 002B71A4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 802BB548 002B71A8  40 82 00 0C */	bne lbl_802BB554
/* 802BB54C 002B71AC  9B B6 00 1A */	stb r29, 0x1a(r22)
/* 802BB550 002B71B0  48 00 00 28 */	b lbl_802BB578
lbl_802BB554:
/* 802BB554 002B71B4  9B B6 00 1A */	stb r29, 0x1a(r22)
/* 802BB558 002B71B8  3A 20 00 01 */	li r17, 1
/* 802BB55C 002B71BC  48 00 00 1C */	b lbl_802BB578
lbl_802BB560:
/* 802BB560 002B71C0  A0 75 00 0C */	lhz r3, 0xc(r21)
/* 802BB564 002B71C4  38 63 FF FF */	addi r3, r3, -1
/* 802BB568 002B71C8  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB56C 002B71CC  B0 75 00 0C */	sth r3, 0xc(r21)
/* 802BB570 002B71D0  40 82 00 08 */	bne lbl_802BB578
/* 802BB574 002B71D4  9B B6 00 1A */	stb r29, 0x1a(r22)
lbl_802BB578:
/* 802BB578 002B71D8  2C 11 00 00 */	cmpwi r17, 0
/* 802BB57C 002B71DC  41 82 FD 10 */	beq lbl_802BB28C
/* 802BB580 002B71E0  88 7F 00 1F */	lbz r3, 0x1f(r31)
/* 802BB584 002B71E4  38 80 00 00 */	li r4, 0
/* 802BB588 002B71E8  7C AF B8 2E */	lwzx r5, r15, r23
/* 802BB58C 002B71EC  4B FF E9 5D */	bl GKI_send_msg
/* 802BB590 002B71F0  7F AF B9 2E */	stwx r29, r15, r23
/* 802BB594 002B71F4  4B FF FC F8 */	b lbl_802BB28C
lbl_802BB598:
/* 802BB598 002B71F8  7E 63 9B 78 */	mr r3, r19
lbl_802BB59C:
/* 802BB59C 002B71FC  39 61 00 60 */	addi r11, r1, 0x60
/* 802BB5A0 002B7200  4B F0 BB A1 */	bl __restore_gpr
/* 802BB5A4 002B7204  80 01 00 64 */	lwz r0, 0x64(r1)
/* 802BB5A8 002B7208  7C 08 03 A6 */	mtlr r0
/* 802BB5AC 002B720C  38 21 00 60 */	addi r1, r1, 0x60
/* 802BB5B0 002B7210  4E 80 00 20 */	blr

.global hcisu_h2_send_msg_now
hcisu_h2_send_msg_now:
/* 802BB5B4 002B7214  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802BB5B8 002B7218  7C 08 02 A6 */	mflr r0
/* 802BB5BC 002B721C  90 01 00 24 */	stw r0, 0x24(r1)
/* 802BB5C0 002B7220  39 61 00 20 */	addi r11, r1, 0x20
/* 802BB5C4 002B7224  4B F0 BB 65 */	bl _savegpr_27
/* 802BB5C8 002B7228  A0 A4 00 00 */	lhz r5, 0(r4)
/* 802BB5CC 002B722C  7C 9B 23 78 */	mr r27, r4
/* 802BB5D0 002B7230  A0 04 00 04 */	lhz r0, 4(r4)
/* 802BB5D4 002B7234  28 05 21 00 */	cmplwi r5, 0x2100
/* 802BB5D8 002B7238  7C 64 02 14 */	add r3, r4, r0
/* 802BB5DC 002B723C  38 C3 00 08 */	addi r6, r3, 8
/* 802BB5E0 002B7240  40 82 00 0C */	bne lbl_802BB5EC
/* 802BB5E4 002B7244  3B 80 00 02 */	li r28, 2
/* 802BB5E8 002B7248  48 00 00 20 */	b lbl_802BB608
lbl_802BB5EC:
/* 802BB5EC 002B724C  28 05 22 00 */	cmplwi r5, 0x2200
/* 802BB5F0 002B7250  40 82 00 0C */	bne lbl_802BB5FC
/* 802BB5F4 002B7254  3B 80 00 03 */	li r28, 3
/* 802BB5F8 002B7258  48 00 00 10 */	b lbl_802BB608
lbl_802BB5FC:
/* 802BB5FC 002B725C  28 05 20 00 */	cmplwi r5, 0x2000
/* 802BB600 002B7260  40 82 00 08 */	bne lbl_802BB608
/* 802BB604 002B7264  3B 80 00 00 */	li r28, 0
lbl_802BB608:
/* 802BB608 002B7268  28 05 21 00 */	cmplwi r5, 0x2100
/* 802BB60C 002B726C  40 82 01 20 */	bne lbl_802BB72C
/* 802BB610 002B7270  3C 60 80 57 */	lis r3, lbl_80568650@ha
/* 802BB614 002B7274  A0 84 00 02 */	lhz r4, 2(r4)
/* 802BB618 002B7278  3B C3 86 50 */	addi r30, r3, lbl_80568650@l
/* 802BB61C 002B727C  A0 1E 00 7E */	lhz r0, 0x7e(r30)
/* 802BB620 002B7280  7C 04 00 40 */	cmplw r4, r0
/* 802BB624 002B7284  40 81 01 08 */	ble lbl_802BB72C
/* 802BB628 002B7288  88 06 00 01 */	lbz r0, 1(r6)
/* 802BB62C 002B728C  88 66 00 00 */	lbz r3, 0(r6)
/* 802BB630 002B7290  38 C6 00 02 */	addi r6, r6, 2
/* 802BB634 002B7294  54 00 44 2E */	rlwinm r0, r0, 8, 0x10, 0x17
/* 802BB638 002B7298  7C 03 02 14 */	add r0, r3, r0
/* 802BB63C 002B729C  54 00 04 3E */	clrlwi r0, r0, 0x10
/* 802BB640 002B72A0  70 00 CF FF */	andi. r0, r0, 0xcfff
/* 802BB644 002B72A4  60 1F 10 00 */	ori r31, r0, 0x1000
/* 802BB648 002B72A8  7F FD 46 70 */	srawi r29, r31, 8
/* 802BB64C 002B72AC  48 00 00 D0 */	b lbl_802BB71C
lbl_802BB650:
/* 802BB650 002B72B0  7C C4 33 78 */	mr r4, r6
/* 802BB654 002B72B4  7F 83 E3 78 */	mr r3, r28
/* 802BB658 002B72B8  7F 66 DB 78 */	mr r6, r27
/* 802BB65C 002B72BC  48 00 10 9D */	bl UUSB_Write
/* 802BB660 002B72C0  A0 7B 00 04 */	lhz r3, 4(r27)
/* 802BB664 002B72C4  A0 1E 00 7C */	lhz r0, 0x7c(r30)
/* 802BB668 002B72C8  A0 9B 00 02 */	lhz r4, 2(r27)
/* 802BB66C 002B72CC  7C 03 02 14 */	add r0, r3, r0
/* 802BB670 002B72D0  B0 1B 00 04 */	sth r0, 4(r27)
/* 802BB674 002B72D4  54 00 04 3E */	clrlwi r0, r0, 0x10
/* 802BB678 002B72D8  7C 7B 02 14 */	add r3, r27, r0
/* 802BB67C 002B72DC  A0 1E 00 7C */	lhz r0, 0x7c(r30)
/* 802BB680 002B72E0  38 C3 00 0A */	addi r6, r3, 0xa
/* 802BB684 002B72E4  7C 00 20 50 */	subf r0, r0, r4
/* 802BB688 002B72E8  B0 1B 00 02 */	sth r0, 2(r27)
/* 802BB68C 002B72EC  9B E3 00 08 */	stb r31, 8(r3)
/* 802BB690 002B72F0  9B A3 00 09 */	stb r29, 9(r3)
/* 802BB694 002B72F4  A0 7B 00 02 */	lhz r3, 2(r27)
/* 802BB698 002B72F8  A0 1E 00 7E */	lhz r0, 0x7e(r30)
/* 802BB69C 002B72FC  7C 03 00 40 */	cmplw r3, r0
/* 802BB6A0 002B7300  40 81 00 20 */	ble lbl_802BB6C0
/* 802BB6A4 002B7304  A0 1E 00 7C */	lhz r0, 0x7c(r30)
/* 802BB6A8 002B7308  98 06 00 00 */	stb r0, 0(r6)
/* 802BB6AC 002B730C  A0 1E 00 7C */	lhz r0, 0x7c(r30)
/* 802BB6B0 002B7310  7C 00 46 70 */	srawi r0, r0, 8
/* 802BB6B4 002B7314  98 06 00 01 */	stb r0, 1(r6)
/* 802BB6B8 002B7318  38 C6 00 02 */	addi r6, r6, 2
/* 802BB6BC 002B731C  48 00 00 20 */	b lbl_802BB6DC
lbl_802BB6C0:
/* 802BB6C0 002B7320  38 03 FF FC */	addi r0, r3, -4
/* 802BB6C4 002B7324  98 06 00 00 */	stb r0, 0(r6)
/* 802BB6C8 002B7328  A0 7B 00 02 */	lhz r3, 2(r27)
/* 802BB6CC 002B732C  38 03 FF FC */	addi r0, r3, -4
/* 802BB6D0 002B7330  7C 00 46 70 */	srawi r0, r0, 8
/* 802BB6D4 002B7334  98 06 00 01 */	stb r0, 1(r6)
/* 802BB6D8 002B7338  38 C6 00 02 */	addi r6, r6, 2
lbl_802BB6DC:
/* 802BB6DC 002B733C  A0 7B 00 06 */	lhz r3, 6(r27)
/* 802BB6E0 002B7340  2C 03 00 00 */	cmpwi r3, 0
/* 802BB6E4 002B7344  41 82 00 38 */	beq lbl_802BB71C
/* 802BB6E8 002B7348  38 63 FF FF */	addi r3, r3, -1
/* 802BB6EC 002B734C  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 802BB6F0 002B7350  B0 7B 00 06 */	sth r3, 6(r27)
/* 802BB6F4 002B7354  40 82 00 28 */	bne lbl_802BB71C
/* 802BB6F8 002B7358  38 00 19 00 */	li r0, 0x1900
/* 802BB6FC 002B735C  3C 60 80 56 */	lis r3, lbl_80564DA0@ha
/* 802BB700 002B7360  B0 1B 00 00 */	sth r0, 0(r27)
/* 802BB704 002B7364  38 63 4D A0 */	addi r3, r3, lbl_80564DA0@l
/* 802BB708 002B7368  7F 65 DB 78 */	mr r5, r27
/* 802BB70C 002B736C  38 80 00 00 */	li r4, 0
/* 802BB710 002B7370  88 63 00 1F */	lbz r3, 0x1f(r3)
/* 802BB714 002B7374  4B FF E7 D5 */	bl GKI_send_msg
/* 802BB718 002B7378  48 00 00 30 */	b lbl_802BB748
lbl_802BB71C:
/* 802BB71C 002B737C  A0 BE 00 7E */	lhz r5, 0x7e(r30)
/* 802BB720 002B7380  A0 1B 00 02 */	lhz r0, 2(r27)
/* 802BB724 002B7384  7C 00 28 40 */	cmplw r0, r5
/* 802BB728 002B7388  41 81 FF 28 */	bgt lbl_802BB650
lbl_802BB72C:
/* 802BB72C 002B738C  A0 BB 00 02 */	lhz r5, 2(r27)
/* 802BB730 002B7390  7C C4 33 78 */	mr r4, r6
/* 802BB734 002B7394  7F 83 E3 78 */	mr r3, r28
/* 802BB738 002B7398  7F 66 DB 78 */	mr r6, r27
/* 802BB73C 002B739C  48 00 0F BD */	bl UUSB_Write
/* 802BB740 002B73A0  7F 63 DB 78 */	mr r3, r27
/* 802BB744 002B73A4  4B FF E5 F1 */	bl GKI_freebuf
lbl_802BB748:
/* 802BB748 002B73A8  39 61 00 20 */	addi r11, r1, 0x20
/* 802BB74C 002B73AC  4B F0 BA 29 */	bl _restgpr_27
/* 802BB750 002B73B0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802BB754 002B73B4  7C 08 03 A6 */	mtlr r0
/* 802BB758 002B73B8  38 21 00 20 */	addi r1, r1, 0x20
/* 802BB75C 002B73BC  4E 80 00 20 */	blr

hcisu_h2_init:
/* 802BB760 002B73C0  3C C0 80 56 */	lis r6, lbl_80564DA0@ha
/* 802BB764 002B73C4  38 00 00 00 */	li r0, 0
/* 802BB768 002B73C8  38 C6 4D A0 */	addi r6, r6, lbl_80564DA0@l
/* 802BB76C 002B73CC  98 06 00 1E */	stb r0, 0x1e(r6)
/* 802BB770 002B73D0  98 06 00 1A */	stb r0, 0x1a(r6)
/* 802BB774 002B73D4  98 06 00 1B */	stb r0, 0x1b(r6)
/* 802BB778 002B73D8  98 06 00 1C */	stb r0, 0x1c(r6)
/* 802BB77C 002B73DC  98 66 00 1F */	stb r3, 0x1f(r6)
/* 802BB780 002B73E0  98 86 00 20 */	stb r4, 0x20(r6)
/* 802BB784 002B73E4  B0 A6 00 12 */	sth r5, 0x12(r6)
/* 802BB788 002B73E8  4E 80 00 20 */	blr

hcisu_h2_open:
/* 802BB78C 002B73EC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802BB790 002B73F0  7C 08 02 A6 */	mflr r0
/* 802BB794 002B73F4  3C A0 80 56 */	lis r5, lbl_80564DA0@ha
/* 802BB798 002B73F8  90 01 00 24 */	stw r0, 0x24(r1)
/* 802BB79C 002B73FC  38 00 00 00 */	li r0, 0
/* 802BB7A0 002B7400  38 A5 4D A0 */	addi r5, r5, lbl_80564DA0@l
/* 802BB7A4 002B7404  98 01 00 13 */	stb r0, 0x13(r1)
/* 802BB7A8 002B7408  38 00 00 02 */	li r0, 2
/* 802BB7AC 002B740C  88 85 00 1F */	lbz r4, 0x1f(r5)
/* 802BB7B0 002B7410  A0 C3 00 00 */	lhz r6, 0(r3)
/* 802BB7B4 002B7414  B0 C1 00 0C */	sth r6, 0xc(r1)
/* 802BB7B8 002B7418  A0 C3 00 02 */	lhz r6, 2(r3)
/* 802BB7BC 002B741C  38 61 00 08 */	addi r3, r1, 8
/* 802BB7C0 002B7420  B0 C1 00 0E */	sth r6, 0xe(r1)
/* 802BB7C4 002B7424  B0 81 00 10 */	sth r4, 0x10(r1)
/* 802BB7C8 002B7428  98 05 00 1E */	stb r0, 0x1e(r5)
/* 802BB7CC 002B742C  48 00 0B A1 */	bl UUSB_Register
/* 802BB7D0 002B7430  3C 80 80 2C */	lis r4, hcisu_h2_usb_cback@ha
/* 802BB7D4 002B7434  38 61 00 08 */	addi r3, r1, 8
/* 802BB7D8 002B7438  38 84 B1 F8 */	addi r4, r4, hcisu_h2_usb_cback@l
/* 802BB7DC 002B743C  48 00 0D FD */	bl UUSB_Open
/* 802BB7E0 002B7440  80 01 00 24 */	lwz r0, 0x24(r1)
/* 802BB7E4 002B7444  38 60 00 01 */	li r3, 1
/* 802BB7E8 002B7448  7C 08 03 A6 */	mtlr r0
/* 802BB7EC 002B744C  38 21 00 20 */	addi r1, r1, 0x20
/* 802BB7F0 002B7450  4E 80 00 20 */	blr

hcisu_h2_close:
/* 802BB7F4 002B7454  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802BB7F8 002B7458  7C 08 02 A6 */	mflr r0
/* 802BB7FC 002B745C  3C 60 80 56 */	lis r3, lbl_80564DA0@ha
/* 802BB800 002B7460  90 01 00 14 */	stw r0, 0x14(r1)
/* 802BB804 002B7464  38 00 00 00 */	li r0, 0
/* 802BB808 002B7468  38 63 4D A0 */	addi r3, r3, lbl_80564DA0@l
/* 802BB80C 002B746C  98 03 00 1E */	stb r0, 0x1e(r3)
/* 802BB810 002B7470  48 00 14 71 */	bl UUSB_Close
/* 802BB814 002B7474  48 00 15 19 */	bl UUSB_Unregister
/* 802BB818 002B7478  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802BB81C 002B747C  7C 08 03 A6 */	mtlr r0
/* 802BB820 002B7480  38 21 00 10 */	addi r1, r1, 0x10
/* 802BB824 002B7484  4E 80 00 20 */	blr

hcisu_h2_send:
/* 802BB828 002B7488  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802BB82C 002B748C  7C 08 02 A6 */	mflr r0
/* 802BB830 002B7490  3C A0 80 56 */	lis r5, lbl_80564DA0@ha
/* 802BB834 002B7494  7C 64 1B 78 */	mr r4, r3
/* 802BB838 002B7498  90 01 00 14 */	stw r0, 0x14(r1)
/* 802BB83C 002B749C  38 65 4D A0 */	addi r3, r5, lbl_80564DA0@l
/* 802BB840 002B74A0  4B FF FD 75 */	bl hcisu_h2_send_msg_now
/* 802BB844 002B74A4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802BB848 002B74A8  38 60 00 01 */	li r3, 1
/* 802BB84C 002B74AC  7C 08 03 A6 */	mtlr r0
/* 802BB850 002B74B0  38 21 00 10 */	addi r1, r1, 0x10
/* 802BB854 002B74B4  4E 80 00 20 */	blr

hcisu_h2_handle_event:
/* 802BB858 002B74B8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802BB85C 002B74BC  7C 08 02 A6 */	mflr r0
/* 802BB860 002B74C0  3C 80 80 56 */	lis r4, lbl_80564DA0@ha
/* 802BB864 002B74C4  90 01 00 14 */	stw r0, 0x14(r1)
/* 802BB868 002B74C8  38 84 4D A0 */	addi r4, r4, lbl_80564DA0@l
/* 802BB86C 002B74CC  38 03 FF F8 */	addi r0, r3, -8
/* 802BB870 002B74D0  A0 64 00 12 */	lhz r3, 0x12(r4)
/* 802BB874 002B74D4  7C 03 00 50 */	subf r0, r3, r0
/* 802BB878 002B74D8  54 03 04 3E */	clrlwi r3, r0, 0x10
/* 802BB87C 002B74DC  4B FF F9 A1 */	bl hcisu_h2_receive_msg
/* 802BB880 002B74E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802BB884 002B74E4  38 60 00 00 */	li r3, 0
/* 802BB888 002B74E8  7C 08 03 A6 */	mtlr r0
/* 802BB88C 002B74EC  38 21 00 10 */	addi r1, r1, 0x10
/* 802BB890 002B74F0  4E 80 00 20 */	blr
