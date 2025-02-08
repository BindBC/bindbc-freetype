/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.tttags;

import bindbc.freetype.codegen;

import ft.types;

enum{
	TTAG_avar = ftMakeTag( 'a', 'v', 'a', 'r' ),
	TTAG_BASE = ftMakeTag( 'B', 'A', 'S', 'E' ),
	TTAG_bdat = ftMakeTag( 'b', 'd', 'a', 't' ),
	TTAG_BDF  = ftMakeTag( 'B', 'D', 'F', ' ' ),
	TTAG_bhed = ftMakeTag( 'b', 'h', 'e', 'd' ),
	TTAG_bloc = ftMakeTag( 'b', 'l', 'o', 'c' ),
	TTAG_bsln = ftMakeTag( 'b', 's', 'l', 'n' ),
	TTAG_CBDT = ftMakeTag( 'C', 'B', 'D', 'T' ),
	TTAG_CBLC = ftMakeTag( 'C', 'B', 'L', 'C' ),
	TTAG_CFF  = ftMakeTag( 'C', 'F', 'F', ' ' ),
	TTAG_CFF2 = ftMakeTag( 'C', 'F', 'F', '2' ),
	TTAG_CID  = ftMakeTag( 'C', 'I', 'D', ' ' ),
	TTAG_cmap = ftMakeTag( 'c', 'm', 'a', 'p' ),
	TTAG_COLR = ftMakeTag( 'C', 'O', 'L', 'R' ),
	TTAG_CPAL = ftMakeTag( 'C', 'P', 'A', 'L' ),
	TTAG_cvar = ftMakeTag( 'c', 'v', 'a', 'r' ),
	TTAG_cvt  = ftMakeTag( 'c', 'v', 't', ' ' ),
	TTAG_DSIG = ftMakeTag( 'D', 'S', 'I', 'G' ),
	TTAG_EBDT = ftMakeTag( 'E', 'B', 'D', 'T' ),
	TTAG_EBLC = ftMakeTag( 'E', 'B', 'L', 'C' ),
	TTAG_EBSC = ftMakeTag( 'E', 'B', 'S', 'C' ),
	TTAG_feat = ftMakeTag( 'f', 'e', 'a', 't' ),
	TTAG_FOND = ftMakeTag( 'F', 'O', 'N', 'D' ),
	TTAG_fpgm = ftMakeTag( 'f', 'p', 'g', 'm' ),
	TTAG_fvar = ftMakeTag( 'f', 'v', 'a', 'r' ),
	TTAG_gasp = ftMakeTag( 'g', 'a', 's', 'p' ),
	TTAG_GDEF = ftMakeTag( 'G', 'D', 'E', 'F' ),
	TTAG_glyf = ftMakeTag( 'g', 'l', 'y', 'f' ),
	TTAG_GPOS = ftMakeTag( 'G', 'P', 'O', 'S' ),
	TTAG_GSUB = ftMakeTag( 'G', 'S', 'U', 'B' ),
	TTAG_gvar = ftMakeTag( 'g', 'v', 'a', 'r' ),
	TTAG_HVAR = ftMakeTag( 'H', 'V', 'A', 'R' ),
	TTAG_hdmx = ftMakeTag( 'h', 'd', 'm', 'x' ),
	TTAG_head = ftMakeTag( 'h', 'e', 'a', 'd' ),
	TTAG_hhea = ftMakeTag( 'h', 'h', 'e', 'a' ),
	TTAG_hmtx = ftMakeTag( 'h', 'm', 't', 'x' ),
	TTAG_JSTF = ftMakeTag( 'J', 'S', 'T', 'F' ),
	TTAG_just = ftMakeTag( 'j', 'u', 's', 't' ),
	TTAG_kern = ftMakeTag( 'k', 'e', 'r', 'n' ),
	TTAG_lcar = ftMakeTag( 'l', 'c', 'a', 'r' ),
	TTAG_loca = ftMakeTag( 'l', 'o', 'c', 'a' ),
	TTAG_LTSH = ftMakeTag( 'L', 'T', 'S', 'H' ),
	TTAG_LWFN = ftMakeTag( 'L', 'W', 'F', 'N' ),
	TTAG_MATH = ftMakeTag( 'M', 'A', 'T', 'H' ),
	TTAG_maxp = ftMakeTag( 'm', 'a', 'x', 'p' ),
	TTAG_META = ftMakeTag( 'M', 'E', 'T', 'A' ),
	TTAG_MMFX = ftMakeTag( 'M', 'M', 'F', 'X' ),
	TTAG_MMSD = ftMakeTag( 'M', 'M', 'S', 'D' ),
	TTAG_mort = ftMakeTag( 'm', 'o', 'r', 't' ),
	TTAG_morx = ftMakeTag( 'm', 'o', 'r', 'x' ),
	TTAG_MVAR = ftMakeTag( 'M', 'V', 'A', 'R' ),
	TTAG_name = ftMakeTag( 'n', 'a', 'm', 'e' ),
	TTAG_opbd = ftMakeTag( 'o', 'p', 'b', 'd' ),
	TTAG_OS2  = ftMakeTag( 'O', 'S', '/', '2' ),
	TTAG_OTTO = ftMakeTag( 'O', 'T', 'T', 'O' ),
	TTAG_PCLT = ftMakeTag( 'P', 'C', 'L', 'T' ),
	TTAG_POST = ftMakeTag( 'P', 'O', 'S', 'T' ),
	TTAG_post = ftMakeTag( 'p', 'o', 's', 't' ),
	TTAG_prep = ftMakeTag( 'p', 'r', 'e', 'p' ),
	TTAG_prop = ftMakeTag( 'p', 'r', 'o', 'p' ),
	TTAG_sbix = ftMakeTag( 's', 'b', 'i', 'x' ),
	TTAG_sfnt = ftMakeTag( 's', 'f', 'n', 't' ),
	TTAG_SING = ftMakeTag( 'S', 'I', 'N', 'G' ),
	TTAG_trak = ftMakeTag( 't', 'r', 'a', 'k' ),
	TTAG_true = ftMakeTag( 't', 'r', 'u', 'e' ),
	TTAG_ttc  = ftMakeTag( 't', 't', 'c', ' ' ),
	TTAG_ttcf = ftMakeTag( 't', 't', 'c', 'f' ),
	TTAG_TYP1 = ftMakeTag( 'T', 'Y', 'P', '1' ),
	TTAG_typ1 = ftMakeTag( 't', 'y', 'p', '1' ),
	TTAG_VDMX = ftMakeTag( 'V', 'D', 'M', 'X' ),
	TTAG_vhea = ftMakeTag( 'v', 'h', 'e', 'a' ),
	TTAG_vmtx = ftMakeTag( 'v', 'm', 't', 'x' ),
	TTAG_VVAR = ftMakeTag( 'V', 'V', 'A', 'R' ),
	TTAG_wOFF = ftMakeTag( 'w', 'O', 'F', 'F' ),
	TTAG_wOF2 = ftMakeTag( 'w', 'O', 'F', '2' ),
	
	TTAG_0xA5kbd = ftMakeTag( 0xA5, 'k', 'b', 'd' ),
	
	TTAG_0xA5lst = ftMakeTag( 0xA5, 'l', 's', 't' ),
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
