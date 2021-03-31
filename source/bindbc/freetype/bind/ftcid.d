
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftcid;

import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.fttypes;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
		FT_Error FT_Get_CID_Registry_Ordering_Supplement(FT_Face face, const(char)** registry, const(char)** ordering, FT_Int* supplement);
		FT_Error FT_Get_CID_Is_Internally_CID_Keyed(FT_Face face, FT_Bool* is_cid);
		FT_Error FT_Get_CID_From_Glyph_Index(FT_Face face, FT_UInt glyph_index, FT_UInt* cid);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Get_CID_Registry_Ordering_Supplement = FT_Error function(FT_Face face, const(char)** registry, const(char)** ordering, FT_Int* supplement);
        alias pFT_Get_CID_Is_Internally_CID_Keyed = FT_Error function(FT_Face face, FT_Bool* is_cid);
        alias pFT_Get_CID_From_Glyph_Index = FT_Error function(FT_Face face, FT_UInt glyph_index, FT_UInt* cid);
    }

    __gshared {
        pFT_Get_CID_Registry_Ordering_Supplement FT_Get_CID_Registry_Ordering_Supplement;
        pFT_Get_CID_Is_Internally_CID_Keyed FT_Get_CID_Is_Internally_CID_Keyed;
        pFT_Get_CID_From_Glyph_Index FT_Get_CID_From_Glyph_Index;
    }
}