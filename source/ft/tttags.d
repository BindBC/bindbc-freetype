/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.tttags;

import bindbc.freetype.codegen;

import ft.types;

enum{
	TTAG_avar = FT_MAKE_TAG( 'a', 'v', 'a', 'r' ),
	TTAG_BASE = FT_MAKE_TAG( 'B', 'A', 'S', 'E' ),
	TTAG_bdat = FT_MAKE_TAG( 'b', 'd', 'a', 't' ),
	TTAG_BDF  = FT_MAKE_TAG( 'B', 'D', 'F', ' ' ),
	TTAG_bhed = FT_MAKE_TAG( 'b', 'h', 'e', 'd' ),
	TTAG_bloc = FT_MAKE_TAG( 'b', 'l', 'o', 'c' ),
	TTAG_bsln = FT_MAKE_TAG( 'b', 's', 'l', 'n' ),
	TTAG_CBDT = FT_MAKE_TAG( 'C', 'B', 'D', 'T' ),
	TTAG_CBLC = FT_MAKE_TAG( 'C', 'B', 'L', 'C' ),
	TTAG_CFF  = FT_MAKE_TAG( 'C', 'F', 'F', ' ' ),
	TTAG_CFF2 = FT_MAKE_TAG( 'C', 'F', 'F', '2' ),
	TTAG_CID  = FT_MAKE_TAG( 'C', 'I', 'D', ' ' ),
	TTAG_cmap = FT_MAKE_TAG( 'c', 'm', 'a', 'p' ),
	TTAG_COLR = FT_MAKE_TAG( 'C', 'O', 'L', 'R' ),
	TTAG_CPAL = FT_MAKE_TAG( 'C', 'P', 'A', 'L' ),
	TTAG_cvar = FT_MAKE_TAG( 'c', 'v', 'a', 'r' ),
	TTAG_cvt  = FT_MAKE_TAG( 'c', 'v', 't', ' ' ),
	TTAG_DSIG = FT_MAKE_TAG( 'D', 'S', 'I', 'G' ),
	TTAG_EBDT = FT_MAKE_TAG( 'E', 'B', 'D', 'T' ),
	TTAG_EBLC = FT_MAKE_TAG( 'E', 'B', 'L', 'C' ),
	TTAG_EBSC = FT_MAKE_TAG( 'E', 'B', 'S', 'C' ),
	TTAG_feat = FT_MAKE_TAG( 'f', 'e', 'a', 't' ),
	TTAG_FOND = FT_MAKE_TAG( 'F', 'O', 'N', 'D' ),
	TTAG_fpgm = FT_MAKE_TAG( 'f', 'p', 'g', 'm' ),
	TTAG_fvar = FT_MAKE_TAG( 'f', 'v', 'a', 'r' ),
	TTAG_gasp = FT_MAKE_TAG( 'g', 'a', 's', 'p' ),
	TTAG_GDEF = FT_MAKE_TAG( 'G', 'D', 'E', 'F' ),
	TTAG_glyf = FT_MAKE_TAG( 'g', 'l', 'y', 'f' ),
	TTAG_GPOS = FT_MAKE_TAG( 'G', 'P', 'O', 'S' ),
	TTAG_GSUB = FT_MAKE_TAG( 'G', 'S', 'U', 'B' ),
	TTAG_gvar = FT_MAKE_TAG( 'g', 'v', 'a', 'r' ),
	TTAG_HVAR = FT_MAKE_TAG( 'H', 'V', 'A', 'R' ),
	TTAG_hdmx = FT_MAKE_TAG( 'h', 'd', 'm', 'x' ),
	TTAG_head = FT_MAKE_TAG( 'h', 'e', 'a', 'd' ),
	TTAG_hhea = FT_MAKE_TAG( 'h', 'h', 'e', 'a' ),
	TTAG_hmtx = FT_MAKE_TAG( 'h', 'm', 't', 'x' ),
	TTAG_JSTF = FT_MAKE_TAG( 'J', 'S', 'T', 'F' ),
	TTAG_just = FT_MAKE_TAG( 'j', 'u', 's', 't' ),
	TTAG_kern = FT_MAKE_TAG( 'k', 'e', 'r', 'n' ),
	TTAG_lcar = FT_MAKE_TAG( 'l', 'c', 'a', 'r' ),
	TTAG_loca = FT_MAKE_TAG( 'l', 'o', 'c', 'a' ),
	TTAG_LTSH = FT_MAKE_TAG( 'L', 'T', 'S', 'H' ),
	TTAG_LWFN = FT_MAKE_TAG( 'L', 'W', 'F', 'N' ),
	TTAG_MATH = FT_MAKE_TAG( 'M', 'A', 'T', 'H' ),
	TTAG_maxp = FT_MAKE_TAG( 'm', 'a', 'x', 'p' ),
	TTAG_META = FT_MAKE_TAG( 'M', 'E', 'T', 'A' ),
	TTAG_MMFX = FT_MAKE_TAG( 'M', 'M', 'F', 'X' ),
	TTAG_MMSD = FT_MAKE_TAG( 'M', 'M', 'S', 'D' ),
	TTAG_mort = FT_MAKE_TAG( 'm', 'o', 'r', 't' ),
	TTAG_morx = FT_MAKE_TAG( 'm', 'o', 'r', 'x' ),
	TTAG_MVAR = FT_MAKE_TAG( 'M', 'V', 'A', 'R' ),
	TTAG_name = FT_MAKE_TAG( 'n', 'a', 'm', 'e' ),
	TTAG_opbd = FT_MAKE_TAG( 'o', 'p', 'b', 'd' ),
	TTAG_OS2  = FT_MAKE_TAG( 'O', 'S', '/', '2' ),
	TTAG_OTTO = FT_MAKE_TAG( 'O', 'T', 'T', 'O' ),
	TTAG_PCLT = FT_MAKE_TAG( 'P', 'C', 'L', 'T' ),
	TTAG_POST = FT_MAKE_TAG( 'P', 'O', 'S', 'T' ),
	TTAG_post = FT_MAKE_TAG( 'p', 'o', 's', 't' ),
	TTAG_prep = FT_MAKE_TAG( 'p', 'r', 'e', 'p' ),
	TTAG_prop = FT_MAKE_TAG( 'p', 'r', 'o', 'p' ),
	TTAG_sbix = FT_MAKE_TAG( 's', 'b', 'i', 'x' ),
	TTAG_sfnt = FT_MAKE_TAG( 's', 'f', 'n', 't' ),
	TTAG_SING = FT_MAKE_TAG( 'S', 'I', 'N', 'G' ),
	TTAG_trak = FT_MAKE_TAG( 't', 'r', 'a', 'k' ),
	TTAG_true = FT_MAKE_TAG( 't', 'r', 'u', 'e' ),
	TTAG_ttc  = FT_MAKE_TAG( 't', 't', 'c', ' ' ),
	TTAG_ttcf = FT_MAKE_TAG( 't', 't', 'c', 'f' ),
	TTAG_TYP1 = FT_MAKE_TAG( 'T', 'Y', 'P', '1' ),
	TTAG_typ1 = FT_MAKE_TAG( 't', 'y', 'p', '1' ),
	TTAG_VDMX = FT_MAKE_TAG( 'V', 'D', 'M', 'X' ),
	TTAG_vhea = FT_MAKE_TAG( 'v', 'h', 'e', 'a' ),
	TTAG_vmtx = FT_MAKE_TAG( 'v', 'm', 't', 'x' ),
	TTAG_VVAR = FT_MAKE_TAG( 'V', 'V', 'A', 'R' ),
	TTAG_wOFF = FT_MAKE_TAG( 'w', 'O', 'F', 'F' ),
	TTAG_wOF2 = FT_MAKE_TAG( 'w', 'O', 'F', '2' ),
	
	TTAG_0xA5kbd = FT_MAKE_TAG( 0xA5, 'k', 'b', 'd' ),
	
	TTAG_0xA5lst = FT_MAKE_TAG( 0xA5, 'l', 's', 't' ),
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
