.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global NWC24iRegister
NWC24iRegister:
/* 80303054 002FECB4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80303058 002FECB8  7C 08 02 A6 */	mflr r0
/* 8030305C 002FECBC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80303060 002FECC0  80 0D AF A0 */	lwz r0, lbl_80640260-_SDA_BASE_(r13)
/* 80303064 002FECC4  2C 00 00 00 */	cmpwi r0, 0
/* 80303068 002FECC8  40 82 00 14 */	bne lbl_8030307C
/* 8030306C 002FECCC  80 6D 8C A0 */	lwz r3, lbl_8063DF60-_SDA_BASE_(r13)
/* 80303070 002FECD0  4B F6 65 E1 */	bl OSRegisterVersion
/* 80303074 002FECD4  38 00 00 01 */	li r0, 1
/* 80303078 002FECD8  90 0D AF A0 */	stw r0, lbl_80640260-_SDA_BASE_(r13)
lbl_8030307C:
/* 8030307C 002FECDC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80303080 002FECE0  7C 08 03 A6 */	mtlr r0
/* 80303084 002FECE4  38 21 00 10 */	addi r1, r1, 0x10
/* 80303088 002FECE8  4E 80 00 20 */	blr

.global NWC24OpenLib
NWC24OpenLib:
/* 8030308C 002FECEC  80 0D AF 94 */	lwz r0, lbl_80640254-_SDA_BASE_(r13)
/* 80303090 002FECF0  2C 00 00 02 */	cmpwi r0, 2
/* 80303094 002FECF4  40 82 00 0C */	bne lbl_803030A0
/* 80303098 002FECF8  38 60 FF E6 */	li r3, -26
/* 8030309C 002FECFC  4E 80 00 20 */	blr
lbl_803030A0:
/* 803030A0 002FED00  38 80 00 01 */	li r4, 1
/* 803030A4 002FED04  48 00 00 08 */	b NWC24OpenLibInternal
/* 803030A8 002FED08  4E 80 00 20 */	blr

NWC24OpenLibInternal:
/* 803030AC 002FED0C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 803030B0 002FED10  7C 08 02 A6 */	mflr r0
/* 803030B4 002FED14  90 01 00 24 */	stw r0, 0x24(r1)
/* 803030B8 002FED18  38 00 00 00 */	li r0, 0
/* 803030BC 002FED1C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 803030C0 002FED20  93 C1 00 18 */	stw r30, 0x18(r1)
/* 803030C4 002FED24  7C 7E 1B 78 */	mr r30, r3
/* 803030C8 002FED28  93 A1 00 14 */	stw r29, 0x14(r1)
/* 803030CC 002FED2C  7C 9D 23 78 */	mr r29, r4
/* 803030D0 002FED30  90 0D AF 9C */	stw r0, lbl_8064025C-_SDA_BASE_(r13)
/* 803030D4 002FED34  48 01 73 CD */	bl VFIsAvailable
/* 803030D8 002FED38  2C 03 00 00 */	cmpwi r3, 0
/* 803030DC 002FED3C  40 82 00 0C */	bne lbl_803030E8
/* 803030E0 002FED40  38 60 FF FF */	li r3, -1
/* 803030E4 002FED44  48 00 01 78 */	b lbl_8030325C
lbl_803030E8:
/* 803030E8 002FED48  80 0D AF 94 */	lwz r0, lbl_80640254-_SDA_BASE_(r13)
/* 803030EC 002FED4C  2C 00 00 01 */	cmpwi r0, 1
/* 803030F0 002FED50  40 82 00 0C */	bne lbl_803030FC
/* 803030F4 002FED54  38 60 FF F6 */	li r3, -10
/* 803030F8 002FED58  48 00 01 64 */	b lbl_8030325C
lbl_803030FC:
/* 803030FC 002FED5C  2C 00 00 03 */	cmpwi r0, 3
/* 80303100 002FED60  40 82 00 0C */	bne lbl_8030310C
/* 80303104 002FED64  38 60 FF E6 */	li r3, -26
/* 80303108 002FED68  48 00 01 54 */	b lbl_8030325C
lbl_8030310C:
/* 8030310C 002FED6C  2C 1E 00 00 */	cmpwi r30, 0
/* 80303110 002FED70  40 82 00 0C */	bne lbl_8030311C
/* 80303114 002FED74  38 60 FF FB */	li r3, -5
/* 80303118 002FED78  48 00 01 44 */	b lbl_8030325C
lbl_8030311C:
/* 8030311C 002FED7C  57 C0 06 FF */	clrlwi. r0, r30, 0x1b
/* 80303120 002FED80  41 82 00 0C */	beq lbl_8030312C
/* 80303124 002FED84  38 60 FF E9 */	li r3, -23
/* 80303128 002FED88  48 00 01 34 */	b lbl_8030325C
lbl_8030312C:
/* 8030312C 002FED8C  48 00 0C 85 */	bl func_80303DB0
/* 80303130 002FED90  2C 03 00 00 */	cmpwi r3, 0
/* 80303134 002FED94  40 82 00 F8 */	bne lbl_8030322C
/* 80303138 002FED98  80 0D AF A0 */	lwz r0, lbl_80640260-_SDA_BASE_(r13)
/* 8030313C 002FED9C  2C 00 00 00 */	cmpwi r0, 0
/* 80303140 002FEDA0  40 82 00 14 */	bne lbl_80303154
/* 80303144 002FEDA4  80 6D 8C A0 */	lwz r3, lbl_8063DF60-_SDA_BASE_(r13)
/* 80303148 002FEDA8  4B F6 65 09 */	bl OSRegisterVersion
/* 8030314C 002FEDAC  38 00 00 01 */	li r0, 1
/* 80303150 002FEDB0  90 0D AF A0 */	stw r0, lbl_80640260-_SDA_BASE_(r13)
lbl_80303154:
/* 80303154 002FEDB4  80 0D AF 98 */	lwz r0, lbl_80640258-_SDA_BASE_(r13)
/* 80303158 002FEDB8  38 7E 13 00 */	addi r3, r30, 0x1300
/* 8030315C 002FEDBC  93 CD AF 90 */	stw r30, lbl_80640250-_SDA_BASE_(r13)
/* 80303160 002FEDC0  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 80303164 002FEDC4  90 0D AF 98 */	stw r0, lbl_80640258-_SDA_BASE_(r13)
/* 80303168 002FEDC8  48 00 05 AD */	bl func_80303714
/* 8030316C 002FEDCC  3B C0 00 00 */	li r30, 0
/* 80303170 002FEDD0  3B E0 00 00 */	li r31, 0
/* 80303174 002FEDD4  4B FF FA F9 */	bl NWC24iConfigOpen
/* 80303178 002FEDD8  2C 03 00 00 */	cmpwi r3, 0
/* 8030317C 002FEDDC  41 82 00 0C */	beq lbl_80303188
/* 80303180 002FEDE0  7C 7F 1B 78 */	mr r31, r3
/* 80303184 002FEDE4  63 DE 00 04 */	ori r30, r30, 4
lbl_80303188:
/* 80303188 002FEDE8  48 00 02 25 */	bl NWC24iOpenMBox
/* 8030318C 002FEDEC  2C 03 00 00 */	cmpwi r3, 0
/* 80303190 002FEDF0  41 82 00 0C */	beq lbl_8030319C
/* 80303194 002FEDF4  7C 7F 1B 78 */	mr r31, r3
/* 80303198 002FEDF8  63 DE 00 04 */	ori r30, r30, 4
lbl_8030319C:
/* 8030319C 002FEDFC  48 00 10 CD */	bl func_80304268
/* 803031A0 002FEE00  2C 03 00 00 */	cmpwi r3, 0
/* 803031A4 002FEE04  41 82 00 0C */	beq lbl_803031B0
/* 803031A8 002FEE08  7C 7F 1B 78 */	mr r31, r3
/* 803031AC 002FEE0C  63 DE 00 04 */	ori r30, r30, 4
lbl_803031B0:
/* 803031B0 002FEE10  48 00 11 D5 */	bl func_80304384
/* 803031B4 002FEE14  2C 03 00 00 */	cmpwi r3, 0
/* 803031B8 002FEE18  41 82 00 1C */	beq lbl_803031D4
/* 803031BC 002FEE1C  2C 03 FF EC */	cmpwi r3, -20
/* 803031C0 002FEE20  7C 7F 1B 78 */	mr r31, r3
/* 803031C4 002FEE24  63 C0 00 01 */	ori r0, r30, 1
/* 803031C8 002FEE28  40 82 00 08 */	bne lbl_803031D0
/* 803031CC 002FEE2C  63 C0 00 04 */	ori r0, r30, 4
lbl_803031D0:
/* 803031D0 002FEE30  7C 1E 03 78 */	mr r30, r0
lbl_803031D4:
/* 803031D4 002FEE34  48 00 16 1D */	bl func_803047F0
/* 803031D8 002FEE38  2C 03 00 00 */	cmpwi r3, 0
/* 803031DC 002FEE3C  40 80 00 1C */	bge lbl_803031F8
/* 803031E0 002FEE40  2C 03 FF EC */	cmpwi r3, -20
/* 803031E4 002FEE44  7C 7F 1B 78 */	mr r31, r3
/* 803031E8 002FEE48  63 C0 00 02 */	ori r0, r30, 2
/* 803031EC 002FEE4C  40 82 00 08 */	bne lbl_803031F4
/* 803031F0 002FEE50  63 C0 00 04 */	ori r0, r30, 4
lbl_803031F4:
/* 803031F4 002FEE54  7C 1E 03 78 */	mr r30, r0
lbl_803031F8:
/* 803031F8 002FEE58  28 1E 00 03 */	cmplwi r30, 3
/* 803031FC 002FEE5C  40 82 00 08 */	bne lbl_80303204
/* 80303200 002FEE60  3B E0 FF CF */	li r31, -49
lbl_80303204:
/* 80303204 002FEE64  2C 1E 00 00 */	cmpwi r30, 0
/* 80303208 002FEE68  41 82 00 18 */	beq lbl_80303220
/* 8030320C 002FEE6C  38 00 00 00 */	li r0, 0
/* 80303210 002FEE70  90 0D AF 90 */	stw r0, lbl_80640250-_SDA_BASE_(r13)
/* 80303214 002FEE74  48 00 0C 7D */	bl func_80303E90
/* 80303218 002FEE78  7F E3 FB 78 */	mr r3, r31
/* 8030321C 002FEE7C  48 00 00 10 */	b lbl_8030322C
lbl_80303220:
/* 80303220 002FEE80  93 AD AF 94 */	stw r29, lbl_80640254-_SDA_BASE_(r13)
/* 80303224 002FEE84  38 60 00 00 */	li r3, 0
/* 80303228 002FEE88  48 00 00 34 */	b lbl_8030325C
lbl_8030322C:
/* 8030322C 002FEE8C  38 03 00 31 */	addi r0, r3, 0x31
/* 80303230 002FEE90  28 00 00 30 */	cmplwi r0, 0x30
/* 80303234 002FEE94  41 81 00 28 */	bgt lbl_8030325C
/* 80303238 002FEE98  3C 80 80 44 */	lis r4, lbl_804463BC@ha
/* 8030323C 002FEE9C  54 00 10 3A */	slwi r0, r0, 2
/* 80303240 002FEEA0  38 84 63 BC */	addi r4, r4, lbl_804463BC@l
/* 80303244 002FEEA4  7C 84 00 2E */	lwzx r4, r4, r0
/* 80303248 002FEEA8  7C 89 03 A6 */	mtctr r4
/* 8030324C 002FEEAC  4E 80 04 20 */	bctr
/* 80303250 002FEEB0  3C 83 FF FE */	addis r4, r3, 0xfffe
/* 80303254 002FEEB4  38 04 56 38 */	addi r0, r4, 0x5638
/* 80303258 002FEEB8  90 0D AF 9C */	stw r0, lbl_8064025C-_SDA_BASE_(r13)
lbl_8030325C:
/* 8030325C 002FEEBC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80303260 002FEEC0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80303264 002FEEC4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80303268 002FEEC8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8030326C 002FEECC  7C 08 03 A6 */	mtlr r0
/* 80303270 002FEED0  38 21 00 20 */	addi r1, r1, 0x20
/* 80303274 002FEED4  4E 80 00 20 */	blr

.global NWC24CloseLib
NWC24CloseLib:
/* 80303278 002FEED8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8030327C 002FEEDC  7C 08 02 A6 */	mflr r0
/* 80303280 002FEEE0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80303284 002FEEE4  80 0D AF 94 */	lwz r0, lbl_80640254-_SDA_BASE_(r13)
/* 80303288 002FEEE8  2C 00 00 01 */	cmpwi r0, 1
/* 8030328C 002FEEEC  41 82 00 0C */	beq lbl_80303298
/* 80303290 002FEEF0  38 60 FF F7 */	li r3, -9
/* 80303294 002FEEF4  48 00 00 40 */	b lbl_803032D4
lbl_80303298:
/* 80303298 002FEEF8  4B FF FA E1 */	bl NWC24iConfigFlush
/* 8030329C 002FEEFC  2C 03 00 00 */	cmpwi r3, 0
/* 803032A0 002FEF00  41 82 00 08 */	beq lbl_803032A8
/* 803032A4 002FEF04  48 00 00 30 */	b lbl_803032D4
lbl_803032A8:
/* 803032A8 002FEF08  48 00 15 95 */	bl func_8030483C
/* 803032AC 002FEF0C  2C 03 00 00 */	cmpwi r3, 0
/* 803032B0 002FEF10  40 80 00 08 */	bge lbl_803032B8
/* 803032B4 002FEF14  48 00 00 20 */	b lbl_803032D4
lbl_803032B8:
/* 803032B8 002FEF18  48 00 0B D9 */	bl func_80303E90
/* 803032BC 002FEF1C  2C 03 00 00 */	cmpwi r3, 0
/* 803032C0 002FEF20  41 82 00 08 */	beq lbl_803032C8
/* 803032C4 002FEF24  48 00 00 10 */	b lbl_803032D4
lbl_803032C8:
/* 803032C8 002FEF28  38 00 00 00 */	li r0, 0
/* 803032CC 002FEF2C  90 0D AF 90 */	stw r0, lbl_80640250-_SDA_BASE_(r13)
/* 803032D0 002FEF30  90 0D AF 94 */	stw r0, lbl_80640254-_SDA_BASE_(r13)
lbl_803032D4:
/* 803032D4 002FEF34  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803032D8 002FEF38  7C 08 03 A6 */	mtlr r0
/* 803032DC 002FEF3C  38 21 00 10 */	addi r1, r1, 0x10
/* 803032E0 002FEF40  4E 80 00 20 */	blr

.global NWC24IsMsgLibOpened
NWC24IsMsgLibOpened:
/* 803032E4 002FEF44  80 6D AF 94 */	lwz r3, lbl_80640254-_SDA_BASE_(r13)
/* 803032E8 002FEF48  38 03 FF FF */	addi r0, r3, -1
/* 803032EC 002FEF4C  7C 00 00 34 */	cntlzw r0, r0
/* 803032F0 002FEF50  54 03 D9 7E */	srwi r3, r0, 5
/* 803032F4 002FEF54  4E 80 00 20 */	blr

.global NWC24IsMsgLibOpenedByTool
NWC24IsMsgLibOpenedByTool:
/* 803032F8 002FEF58  80 6D AF 94 */	lwz r3, lbl_80640254-_SDA_BASE_(r13)
/* 803032FC 002FEF5C  38 03 FF FE */	addi r0, r3, -2
/* 80303300 002FEF60  7C 00 00 34 */	cntlzw r0, r0
/* 80303304 002FEF64  54 03 D9 7E */	srwi r3, r0, 5
/* 80303308 002FEF68  4E 80 00 20 */	blr

.global NWC24BlockOpenMsgLib
NWC24BlockOpenMsgLib:
/* 8030330C 002FEF6C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80303310 002FEF70  7C 08 02 A6 */	mflr r0
/* 80303314 002FEF74  90 01 00 14 */	stw r0, 0x14(r1)
/* 80303318 002FEF78  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8030331C 002FEF7C  3B E0 00 00 */	li r31, 0
/* 80303320 002FEF80  93 C1 00 08 */	stw r30, 8(r1)
/* 80303324 002FEF84  7C 7E 1B 78 */	mr r30, r3
/* 80303328 002FEF88  4B F6 B4 35 */	bl OSDisableInterrupts
/* 8030332C 002FEF8C  2C 1E 00 00 */	cmpwi r30, 0
/* 80303330 002FEF90  41 82 00 34 */	beq lbl_80303364
/* 80303334 002FEF94  80 0D AF 94 */	lwz r0, lbl_80640254-_SDA_BASE_(r13)
/* 80303338 002FEF98  2C 00 00 00 */	cmpwi r0, 0
/* 8030333C 002FEF9C  40 82 00 10 */	bne lbl_8030334C
/* 80303340 002FEFA0  38 00 00 03 */	li r0, 3
/* 80303344 002FEFA4  90 0D AF 94 */	stw r0, lbl_80640254-_SDA_BASE_(r13)
/* 80303348 002FEFA8  48 00 00 44 */	b lbl_8030338C
lbl_8030334C:
/* 8030334C 002FEFAC  2C 00 00 01 */	cmpwi r0, 1
/* 80303350 002FEFB0  40 82 00 0C */	bne lbl_8030335C
/* 80303354 002FEFB4  3B E0 FF F6 */	li r31, -10
/* 80303358 002FEFB8  48 00 00 34 */	b lbl_8030338C
lbl_8030335C:
/* 8030335C 002FEFBC  3B E0 FF E6 */	li r31, -26
/* 80303360 002FEFC0  48 00 00 2C */	b lbl_8030338C
lbl_80303364:
/* 80303364 002FEFC4  80 8D AF 94 */	lwz r4, lbl_80640254-_SDA_BASE_(r13)
/* 80303368 002FEFC8  38 04 FF FD */	addi r0, r4, -3
/* 8030336C 002FEFCC  7C 00 00 34 */	cntlzw r0, r0
/* 80303370 002FEFD0  54 04 D9 7F */	rlwinm. r4, r0, 0x1b, 5, 0x1f
/* 80303374 002FEFD4  41 82 00 0C */	beq lbl_80303380
/* 80303378 002FEFD8  38 00 00 00 */	li r0, 0
/* 8030337C 002FEFDC  90 0D AF 94 */	stw r0, lbl_80640254-_SDA_BASE_(r13)
lbl_80303380:
/* 80303380 002FEFE0  2C 04 00 00 */	cmpwi r4, 0
/* 80303384 002FEFE4  40 82 00 08 */	bne lbl_8030338C
/* 80303388 002FEFE8  3B E0 FF F7 */	li r31, -9
lbl_8030338C:
/* 8030338C 002FEFEC  4B F6 B3 F9 */	bl OSRestoreInterrupts
/* 80303390 002FEFF0  7F E3 FB 78 */	mr r3, r31
/* 80303394 002FEFF4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80303398 002FEFF8  83 C1 00 08 */	lwz r30, 8(r1)
/* 8030339C 002FEFFC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803033A0 002FF000  7C 08 03 A6 */	mtlr r0
/* 803033A4 002FF004  38 21 00 10 */	addi r1, r1, 0x10
/* 803033A8 002FF008  4E 80 00 20 */	blr
