
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ttags;

import bindbc.freetype.bind.fttypes;

enum TTAG_avar = FT_MAKE_TAG( 'a', 'v', 'a', 'r' );
enum TTAG_BASE = FT_MAKE_TAG( 'B', 'A', 'S', 'E' );
enum TTAG_bdat = FT_MAKE_TAG( 'b', 'd', 'a', 't' );
enum TTAG_BDF  = FT_MAKE_TAG( 'B', 'D', 'F', ' ' );
enum TTAG_bhed = FT_MAKE_TAG( 'b', 'h', 'e', 'd' );
enum TTAG_bloc = FT_MAKE_TAG( 'b', 'l', 'o', 'c' );
enum TTAG_bsln = FT_MAKE_TAG( 'b', 's', 'l', 'n' );
enum TTAG_CBDT = FT_MAKE_TAG( 'C', 'B', 'D', 'T' );
enum TTAG_CBLC = FT_MAKE_TAG( 'C', 'B', 'L', 'C' );
enum TTAG_CFF  = FT_MAKE_TAG( 'C', 'F', 'F', ' ' );
enum TTAG_CFF2 = FT_MAKE_TAG( 'C', 'F', 'F', '2' );
enum TTAG_CID  = FT_MAKE_TAG( 'C', 'I', 'D', ' ' );
enum TTAG_cmap = FT_MAKE_TAG( 'c', 'm', 'a', 'p' );
enum TTAG_COLR = FT_MAKE_TAG( 'C', 'O', 'L', 'R' );
enum TTAG_CPAL = FT_MAKE_TAG( 'C', 'P', 'A', 'L' );
enum TTAG_cvar = FT_MAKE_TAG( 'c', 'v', 'a', 'r' );
enum TTAG_cvt  = FT_MAKE_TAG( 'c', 'v', 't', ' ' );
enum TTAG_DSIG = FT_MAKE_TAG( 'D', 'S', 'I', 'G' );
enum TTAG_EBDT = FT_MAKE_TAG( 'E', 'B', 'D', 'T' );
enum TTAG_EBLC = FT_MAKE_TAG( 'E', 'B', 'L', 'C' );
enum TTAG_EBSC = FT_MAKE_TAG( 'E', 'B', 'S', 'C' );
enum TTAG_feat = FT_MAKE_TAG( 'f', 'e', 'a', 't' );
enum TTAG_FOND = FT_MAKE_TAG( 'F', 'O', 'N', 'D' );
enum TTAG_fpgm = FT_MAKE_TAG( 'f', 'p', 'g', 'm' );
enum TTAG_fvar = FT_MAKE_TAG( 'f', 'v', 'a', 'r' );
enum TTAG_gasp = FT_MAKE_TAG( 'g', 'a', 's', 'p' );
enum TTAG_GDEF = FT_MAKE_TAG( 'G', 'D', 'E', 'F' );
enum TTAG_glyf = FT_MAKE_TAG( 'g', 'l', 'y', 'f' );
enum TTAG_GPOS = FT_MAKE_TAG( 'G', 'P', 'O', 'S' );
enum TTAG_GSUB = FT_MAKE_TAG( 'G', 'S', 'U', 'B' );
enum TTAG_gvar = FT_MAKE_TAG( 'g', 'v', 'a', 'r' );
enum TTAG_HVAR = FT_MAKE_TAG( 'H', 'V', 'A', 'R' );
enum TTAG_hdmx = FT_MAKE_TAG( 'h', 'd', 'm', 'x' );
enum TTAG_head = FT_MAKE_TAG( 'h', 'e', 'a', 'd' );
enum TTAG_hhea = FT_MAKE_TAG( 'h', 'h', 'e', 'a' );
enum TTAG_hmtx = FT_MAKE_TAG( 'h', 'm', 't', 'x' );
enum TTAG_JSTF = FT_MAKE_TAG( 'J', 'S', 'T', 'F' );
enum TTAG_just = FT_MAKE_TAG( 'j', 'u', 's', 't' );
enum TTAG_kern = FT_MAKE_TAG( 'k', 'e', 'r', 'n' );
enum TTAG_lcar = FT_MAKE_TAG( 'l', 'c', 'a', 'r' );
enum TTAG_loca = FT_MAKE_TAG( 'l', 'o', 'c', 'a' );
enum TTAG_LTSH = FT_MAKE_TAG( 'L', 'T', 'S', 'H' );
enum TTAG_LWFN = FT_MAKE_TAG( 'L', 'W', 'F', 'N' );
enum TTAG_MATH = FT_MAKE_TAG( 'M', 'A', 'T', 'H' );
enum TTAG_maxp = FT_MAKE_TAG( 'm', 'a', 'x', 'p' );
enum TTAG_META = FT_MAKE_TAG( 'M', 'E', 'T', 'A' );
enum TTAG_MMFX = FT_MAKE_TAG( 'M', 'M', 'F', 'X' );
enum TTAG_MMSD = FT_MAKE_TAG( 'M', 'M', 'S', 'D' );
enum TTAG_mort = FT_MAKE_TAG( 'm', 'o', 'r', 't' );
enum TTAG_morx = FT_MAKE_TAG( 'm', 'o', 'r', 'x' );
enum TTAG_MVAR = FT_MAKE_TAG( 'M', 'V', 'A', 'R' );
enum TTAG_name = FT_MAKE_TAG( 'n', 'a', 'm', 'e' );
enum TTAG_opbd = FT_MAKE_TAG( 'o', 'p', 'b', 'd' );
enum TTAG_OS2  = FT_MAKE_TAG( 'O', 'S', '/', '2' );
enum TTAG_OTTO = FT_MAKE_TAG( 'O', 'T', 'T', 'O' );
enum TTAG_PCLT = FT_MAKE_TAG( 'P', 'C', 'L', 'T' );
enum TTAG_POST = FT_MAKE_TAG( 'P', 'O', 'S', 'T' );
enum TTAG_post = FT_MAKE_TAG( 'p', 'o', 's', 't' );
enum TTAG_prep = FT_MAKE_TAG( 'p', 'r', 'e', 'p' );
enum TTAG_prop = FT_MAKE_TAG( 'p', 'r', 'o', 'p' );
enum TTAG_sbix = FT_MAKE_TAG( 's', 'b', 'i', 'x' );
enum TTAG_sfnt = FT_MAKE_TAG( 's', 'f', 'n', 't' );
enum TTAG_SING = FT_MAKE_TAG( 'S', 'I', 'N', 'G' );
enum TTAG_trak = FT_MAKE_TAG( 't', 'r', 'a', 'k' );
enum TTAG_true = FT_MAKE_TAG( 't', 'r', 'u', 'e' );
enum TTAG_ttc  = FT_MAKE_TAG( 't', 't', 'c', ' ' );
enum TTAG_ttcf = FT_MAKE_TAG( 't', 't', 'c', 'f' );
enum TTAG_TYP1 = FT_MAKE_TAG( 'T', 'Y', 'P', '1' );
enum TTAG_typ1 = FT_MAKE_TAG( 't', 'y', 'p', '1' );
enum TTAG_VDMX = FT_MAKE_TAG( 'V', 'D', 'M', 'X' );
enum TTAG_vhea = FT_MAKE_TAG( 'v', 'h', 'e', 'a' );
enum TTAG_vmtx = FT_MAKE_TAG( 'v', 'm', 't', 'x' );
enum TTAG_VVAR = FT_MAKE_TAG( 'V', 'V', 'A', 'R' );
enum TTAG_wOFF = FT_MAKE_TAG( 'w', 'O', 'F', 'F' );
enum TTAG_wOF2 = FT_MAKE_TAG( 'w', 'O', 'F', '2' );

enum TTAG_0xA5kbd = FT_MAKE_TAG( 0xA5, 'k', 'b', 'd' );

enum TTAG_0xA5lst = FT_MAKE_TAG( 0xA5, 'l', 's', 't' );