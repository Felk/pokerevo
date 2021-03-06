.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global __ieee754_sqrt
__ieee754_sqrt:
/* 801D45E8 001D0248  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801D45EC 001D024C  D8 21 00 08 */	stfd f1, 8(r1)
/* 801D45F0 001D0250  80 C1 00 08 */	lwz r6, 8(r1)
/* 801D45F4 001D0254  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801D45F8 001D0258  54 C3 00 56 */	rlwinm r3, r6, 0, 1, 0xb
/* 801D45FC 001D025C  3C 63 80 10 */	addis r3, r3, 0x8010
/* 801D4600 001D0260  28 03 00 00 */	cmplwi r3, 0
/* 801D4604 001D0264  40 82 00 18 */	bne lbl_801D461C
/* 801D4608 001D0268  FC 01 00 72 */	fmul f0, f1, f1
/* 801D460C 001D026C  38 00 00 21 */	li r0, 0x21
/* 801D4610 001D0270  90 0D 9F C8 */	stw r0, lbl_8063F288-_SDA_BASE_(r13)
/* 801D4614 001D0274  FC 21 00 2A */	fadd f1, f1, f0
/* 801D4618 001D0278  48 00 02 10 */	b lbl_801D4828
lbl_801D461C:
/* 801D461C 001D027C  2C 86 00 00 */	cmpwi cr1, r6, 0
/* 801D4620 001D0280  41 85 00 2C */	bgt cr1, lbl_801D464C
/* 801D4624 001D0284  54 C3 00 7E */	clrlwi r3, r6, 1
/* 801D4628 001D0288  7C 03 1B 79 */	or. r3, r0, r3
/* 801D462C 001D028C  40 82 00 08 */	bne lbl_801D4634
/* 801D4630 001D0290  48 00 01 F8 */	b lbl_801D4828
lbl_801D4634:
/* 801D4634 001D0294  40 84 00 18 */	bge cr1, lbl_801D464C
/* 801D4638 001D0298  38 00 00 21 */	li r0, 0x21
/* 801D463C 001D029C  3C 60 80 64 */	lis r3, lbl_8063D6B8@ha
/* 801D4640 001D02A0  90 0D 9F C8 */	stw r0, lbl_8063F288-_SDA_BASE_(r13)
/* 801D4644 001D02A4  C0 23 D6 B8 */	lfs f1, lbl_8063D6B8@l(r3)
/* 801D4648 001D02A8  48 00 01 E0 */	b lbl_801D4828
lbl_801D464C:
/* 801D464C 001D02AC  7C C3 A6 71 */	srawi. r3, r6, 0x14
/* 801D4650 001D02B0  40 82 00 50 */	bne lbl_801D46A0
/* 801D4654 001D02B4  48 00 00 14 */	b lbl_801D4668
lbl_801D4658:
/* 801D4658 001D02B8  54 04 AA FE */	srwi r4, r0, 0xb
/* 801D465C 001D02BC  54 00 A8 14 */	slwi r0, r0, 0x15
/* 801D4660 001D02C0  7C C6 23 78 */	or r6, r6, r4
/* 801D4664 001D02C4  38 63 FF EB */	addi r3, r3, -21
lbl_801D4668:
/* 801D4668 001D02C8  2C 06 00 00 */	cmpwi r6, 0
/* 801D466C 001D02CC  41 82 FF EC */	beq lbl_801D4658
/* 801D4670 001D02D0  38 E0 00 00 */	li r7, 0
/* 801D4674 001D02D4  48 00 00 0C */	b lbl_801D4680
lbl_801D4678:
/* 801D4678 001D02D8  54 C6 08 3C */	slwi r6, r6, 1
/* 801D467C 001D02DC  38 E7 00 01 */	addi r7, r7, 1
lbl_801D4680:
/* 801D4680 001D02E0  54 C4 02 D7 */	rlwinm. r4, r6, 0, 0xb, 0xb
/* 801D4684 001D02E4  41 82 FF F4 */	beq lbl_801D4678
/* 801D4688 001D02E8  20 87 00 20 */	subfic r4, r7, 0x20
/* 801D468C 001D02EC  38 A7 FF FF */	addi r5, r7, -1
/* 801D4690 001D02F0  7C 04 24 30 */	srw r4, r0, r4
/* 801D4694 001D02F4  7C 00 38 30 */	slw r0, r0, r7
/* 801D4698 001D02F8  7C 65 18 50 */	subf r3, r5, r3
/* 801D469C 001D02FC  7C C6 23 78 */	or r6, r6, r4
lbl_801D46A0:
/* 801D46A0 001D0300  38 83 FC 01 */	addi r4, r3, -1023
/* 801D46A4 001D0304  54 C5 03 3E */	clrlwi r5, r6, 0xc
/* 801D46A8 001D0308  54 84 07 FF */	clrlwi. r4, r4, 0x1f
/* 801D46AC 001D030C  64 A6 00 10 */	oris r6, r5, 0x10
/* 801D46B0 001D0310  41 82 00 14 */	beq lbl_801D46C4
/* 801D46B4 001D0314  54 05 0F FE */	srwi r5, r0, 0x1f
/* 801D46B8 001D0318  7C 86 32 14 */	add r4, r6, r6
/* 801D46BC 001D031C  7C C5 22 14 */	add r6, r5, r4
/* 801D46C0 001D0320  7C 00 02 14 */	add r0, r0, r0
lbl_801D46C4:
/* 801D46C4 001D0324  54 05 0F FE */	srwi r5, r0, 0x1f
/* 801D46C8 001D0328  7C 86 32 14 */	add r4, r6, r6
/* 801D46CC 001D032C  7C C5 22 14 */	add r6, r5, r4
/* 801D46D0 001D0330  7C 00 02 14 */	add r0, r0, r0
/* 801D46D4 001D0334  39 20 00 00 */	li r9, 0
/* 801D46D8 001D0338  39 60 00 00 */	li r11, 0
/* 801D46DC 001D033C  39 40 00 00 */	li r10, 0
/* 801D46E0 001D0340  39 80 00 00 */	li r12, 0
/* 801D46E4 001D0344  3C E0 00 20 */	lis r7, 0x20
/* 801D46E8 001D0348  48 00 00 30 */	b lbl_801D4718
lbl_801D46EC:
/* 801D46EC 001D034C  7C 8B 3A 14 */	add r4, r11, r7
/* 801D46F0 001D0350  7C 04 30 00 */	cmpw r4, r6
/* 801D46F4 001D0354  41 81 00 10 */	bgt lbl_801D4704
/* 801D46F8 001D0358  7D 64 3A 14 */	add r11, r4, r7
/* 801D46FC 001D035C  7C C4 30 50 */	subf r6, r4, r6
/* 801D4700 001D0360  7D 8C 3A 14 */	add r12, r12, r7
lbl_801D4704:
/* 801D4704 001D0364  54 05 0F FE */	srwi r5, r0, 0x1f
/* 801D4708 001D0368  7C 86 32 14 */	add r4, r6, r6
/* 801D470C 001D036C  7C C5 22 14 */	add r6, r5, r4
/* 801D4710 001D0370  7C 00 02 14 */	add r0, r0, r0
/* 801D4714 001D0374  54 E7 F8 7E */	srwi r7, r7, 1
lbl_801D4718:
/* 801D4718 001D0378  2C 07 00 00 */	cmpwi r7, 0
/* 801D471C 001D037C  40 82 FF D0 */	bne lbl_801D46EC
/* 801D4720 001D0380  3C E0 80 00 */	lis r7, 0x8000
/* 801D4724 001D0384  48 00 00 6C */	b lbl_801D4790
lbl_801D4728:
/* 801D4728 001D0388  7C 0B 30 00 */	cmpw r11, r6
/* 801D472C 001D038C  7D 65 5B 78 */	mr r5, r11
/* 801D4730 001D0390  7D 09 3A 14 */	add r8, r9, r7
/* 801D4734 001D0394  41 80 00 10 */	blt lbl_801D4744
/* 801D4738 001D0398  40 82 00 44 */	bne lbl_801D477C
/* 801D473C 001D039C  7C 08 00 40 */	cmplw r8, r0
/* 801D4740 001D03A0  41 81 00 3C */	bgt lbl_801D477C
lbl_801D4744:
/* 801D4744 001D03A4  55 04 00 00 */	rlwinm r4, r8, 0, 0, 0
/* 801D4748 001D03A8  7D 28 3A 14 */	add r9, r8, r7
/* 801D474C 001D03AC  3C 84 80 00 */	addis r4, r4, 0x8000
/* 801D4750 001D03B0  28 04 00 00 */	cmplwi r4, 0
/* 801D4754 001D03B4  40 82 00 10 */	bne lbl_801D4764
/* 801D4758 001D03B8  55 24 00 01 */	rlwinm. r4, r9, 0, 0, 0
/* 801D475C 001D03BC  40 82 00 08 */	bne lbl_801D4764
/* 801D4760 001D03C0  39 6B 00 01 */	addi r11, r11, 1
lbl_801D4764:
/* 801D4764 001D03C4  7C 00 40 40 */	cmplw r0, r8
/* 801D4768 001D03C8  7C C5 30 50 */	subf r6, r5, r6
/* 801D476C 001D03CC  40 80 00 08 */	bge lbl_801D4774
/* 801D4770 001D03D0  38 C6 FF FF */	addi r6, r6, -1
lbl_801D4774:
/* 801D4774 001D03D4  7C 08 00 50 */	subf r0, r8, r0
/* 801D4778 001D03D8  7D 4A 3A 14 */	add r10, r10, r7
lbl_801D477C:
/* 801D477C 001D03DC  54 05 0F FE */	srwi r5, r0, 0x1f
/* 801D4780 001D03E0  7C 86 32 14 */	add r4, r6, r6
/* 801D4784 001D03E4  7C C5 22 14 */	add r6, r5, r4
/* 801D4788 001D03E8  7C 00 02 14 */	add r0, r0, r0
/* 801D478C 001D03EC  54 E7 F8 7E */	srwi r7, r7, 1
lbl_801D4790:
/* 801D4790 001D03F0  2C 07 00 00 */	cmpwi r7, 0
/* 801D4794 001D03F4  40 82 FF 94 */	bne lbl_801D4728
/* 801D4798 001D03F8  7C C0 03 79 */	or. r0, r6, r0
/* 801D479C 001D03FC  41 82 00 58 */	beq lbl_801D47F4
/* 801D47A0 001D0400  C8 02 95 D8 */	lfd f0, lbl_80641BD8-_SDA2_BASE_(r2)
/* 801D47A4 001D0404  FC 00 00 40 */	fcmpo cr0, f0, f0
/* 801D47A8 001D0408  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 801D47AC 001D040C  4C 41 13 82 */	cror 2, 1, 2
/* 801D47B0 001D0410  40 82 00 44 */	bne lbl_801D47F4
/* 801D47B4 001D0414  3C 0A 00 01 */	addis r0, r10, 1
/* 801D47B8 001D0418  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 801D47BC 001D041C  28 00 FF FF */	cmplwi r0, 0xffff
/* 801D47C0 001D0420  40 82 00 10 */	bne lbl_801D47D0
/* 801D47C4 001D0424  39 40 00 00 */	li r10, 0
/* 801D47C8 001D0428  39 8C 00 01 */	addi r12, r12, 1
/* 801D47CC 001D042C  48 00 00 28 */	b lbl_801D47F4
lbl_801D47D0:
/* 801D47D0 001D0430  FC 00 00 40 */	fcmpo cr0, f0, f0
/* 801D47D4 001D0434  40 81 00 18 */	ble lbl_801D47EC
/* 801D47D8 001D0438  28 00 FF FE */	cmplwi r0, 0xfffe
/* 801D47DC 001D043C  40 82 00 08 */	bne lbl_801D47E4
/* 801D47E0 001D0440  39 8C 00 01 */	addi r12, r12, 1
lbl_801D47E4:
/* 801D47E4 001D0444  39 4A 00 02 */	addi r10, r10, 2
/* 801D47E8 001D0448  48 00 00 0C */	b lbl_801D47F4
lbl_801D47EC:
/* 801D47EC 001D044C  55 40 07 FE */	clrlwi r0, r10, 0x1f
/* 801D47F0 001D0450  7D 4A 02 14 */	add r10, r10, r0
lbl_801D47F4:
/* 801D47F4 001D0454  55 80 07 FE */	clrlwi r0, r12, 0x1f
/* 801D47F8 001D0458  7D 84 0E 70 */	srawi r4, r12, 1
/* 801D47FC 001D045C  2C 00 00 01 */	cmpwi r0, 1
/* 801D4800 001D0460  55 45 F8 7E */	srwi r5, r10, 1
/* 801D4804 001D0464  3C 84 3F E0 */	addis r4, r4, 0x3fe0
/* 801D4808 001D0468  40 82 00 08 */	bne lbl_801D4810
/* 801D480C 001D046C  64 A5 80 00 */	oris r5, r5, 0x8000
lbl_801D4810:
/* 801D4810 001D0470  38 03 FC 01 */	addi r0, r3, -1023
/* 801D4814 001D0474  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801D4818 001D0478  54 00 98 16 */	rlwinm r0, r0, 0x13, 0, 0xb
/* 801D481C 001D047C  7C 84 02 14 */	add r4, r4, r0
/* 801D4820 001D0480  90 81 00 10 */	stw r4, 0x10(r1)
/* 801D4824 001D0484  C8 21 00 10 */	lfd f1, 0x10(r1)
lbl_801D4828:
/* 801D4828 001D0488  38 21 00 20 */	addi r1, r1, 0x20
/* 801D482C 001D048C  4E 80 00 20 */	blr
