.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global ghiCallCompletedCallback
ghiCallCompletedCallback:
/* 803511C4 0034CE24  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 803511C8 0034CE28  7C 08 02 A6 */	mflr r0
/* 803511CC 0034CE2C  90 01 00 14 */	stw r0, 0x14(r1)
/* 803511D0 0034CE30  93 E1 00 0C */	stw r31, 0xc(r1)
/* 803511D4 0034CE34  93 C1 00 08 */	stw r30, 8(r1)
/* 803511D8 0034CE38  7C 7E 1B 78 */	mr r30, r3
/* 803511DC 0034CE3C  81 83 00 44 */	lwz r12, 0x44(r3)
/* 803511E0 0034CE40  2C 0C 00 00 */	cmpwi r12, 0
/* 803511E4 0034CE44  41 82 00 50 */	beq lbl_80351234
/* 803511E8 0034CE48  80 03 00 0C */	lwz r0, 0xc(r3)
/* 803511EC 0034CE4C  2C 00 00 00 */	cmpwi r0, 0
/* 803511F0 0034CE50  40 82 00 0C */	bne lbl_803511FC
/* 803511F4 0034CE54  83 E3 00 E8 */	lwz r31, 0xe8(r3)
/* 803511F8 0034CE58  48 00 00 08 */	b lbl_80351200
lbl_803511FC:
/* 803511FC 0034CE5C  3B E0 00 00 */	li r31, 0
lbl_80351200:
/* 80351200 0034CE60  7F E5 FB 78 */	mr r5, r31
/* 80351204 0034CE64  80 63 00 04 */	lwz r3, 4(r3)
/* 80351208 0034CE68  80 9E 00 3C */	lwz r4, 0x3c(r30)
/* 8035120C 0034CE6C  80 DE 01 24 */	lwz r6, 0x124(r30)
/* 80351210 0034CE70  80 FE 00 48 */	lwz r7, 0x48(r30)
/* 80351214 0034CE74  7D 89 03 A6 */	mtctr r12
/* 80351218 0034CE78  4E 80 04 21 */	bctrl
/* 8035121C 0034CE7C  2C 1F 00 00 */	cmpwi r31, 0
/* 80351220 0034CE80  41 82 00 14 */	beq lbl_80351234
/* 80351224 0034CE84  2C 03 00 00 */	cmpwi r3, 0
/* 80351228 0034CE88  40 82 00 0C */	bne lbl_80351234
/* 8035122C 0034CE8C  38 00 00 01 */	li r0, 1
/* 80351230 0034CE90  90 1E 01 00 */	stw r0, 0x100(r30)
lbl_80351234:
/* 80351234 0034CE94  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80351238 0034CE98  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8035123C 0034CE9C  83 C1 00 08 */	lwz r30, 8(r1)
/* 80351240 0034CEA0  7C 08 03 A6 */	mtlr r0
/* 80351244 0034CEA4  38 21 00 10 */	addi r1, r1, 0x10
/* 80351248 0034CEA8  4E 80 00 20 */	blr

.global ghiCallProgressCallback
ghiCallProgressCallback:
/* 8035124C 0034CEAC  81 83 00 40 */	lwz r12, 0x40(r3)
/* 80351250 0034CEB0  7C 69 1B 78 */	mr r9, r3
/* 80351254 0034CEB4  7C A6 2B 78 */	mr r6, r5
/* 80351258 0034CEB8  2C 0C 00 00 */	cmpwi r12, 0
/* 8035125C 0034CEBC  4D 82 00 20 */	beqlr
/* 80351260 0034CEC0  7C 85 23 78 */	mr r5, r4
/* 80351264 0034CEC4  80 63 00 04 */	lwz r3, 4(r3)
/* 80351268 0034CEC8  80 89 00 10 */	lwz r4, 0x10(r9)
/* 8035126C 0034CECC  80 E9 01 24 */	lwz r7, 0x124(r9)
/* 80351270 0034CED0  81 09 01 28 */	lwz r8, 0x128(r9)
/* 80351274 0034CED4  81 29 00 48 */	lwz r9, 0x48(r9)
/* 80351278 0034CED8  7D 89 03 A6 */	mtctr r12
/* 8035127C 0034CEDC  4E 80 04 20 */	bctr
/* 80351280 0034CEE0  4E 80 00 20 */	blr

.global ghiCallPostCallback
ghiCallPostCallback:
/* 80351284 0034CEE4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80351288 0034CEE8  7C 08 02 A6 */	mflr r0
/* 8035128C 0034CEEC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80351290 0034CEF0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80351294 0034CEF4  7C 7F 1B 78 */	mr r31, r3
/* 80351298 0034CEF8  80 03 01 74 */	lwz r0, 0x174(r3)
/* 8035129C 0034CEFC  2C 00 00 00 */	cmpwi r0, 0
/* 803512A0 0034CF00  41 82 00 30 */	beq lbl_803512D0
/* 803512A4 0034CF04  80 63 01 64 */	lwz r3, 0x164(r3)
/* 803512A8 0034CF08  4B FE 4C 41 */	bl ArrayLength
/* 803512AC 0034CF0C  81 9F 01 74 */	lwz r12, 0x174(r31)
/* 803512B0 0034CF10  7C 67 1B 78 */	mr r7, r3
/* 803512B4 0034CF14  80 7F 00 04 */	lwz r3, 4(r31)
/* 803512B8 0034CF18  80 9F 01 6C */	lwz r4, 0x16c(r31)
/* 803512BC 0034CF1C  80 BF 01 70 */	lwz r5, 0x170(r31)
/* 803512C0 0034CF20  80 DF 01 68 */	lwz r6, 0x168(r31)
/* 803512C4 0034CF24  81 1F 00 48 */	lwz r8, 0x48(r31)
/* 803512C8 0034CF28  7D 89 03 A6 */	mtctr r12
/* 803512CC 0034CF2C  4E 80 04 21 */	bctrl
lbl_803512D0:
/* 803512D0 0034CF30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 803512D4 0034CF34  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 803512D8 0034CF38  7C 08 03 A6 */	mtlr r0
/* 803512DC 0034CF3C  38 21 00 10 */	addi r1, r1, 0x10
/* 803512E0 0034CF40  4E 80 00 20 */	blr
