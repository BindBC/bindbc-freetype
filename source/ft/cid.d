/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.cid;

import bindbc.freetype.config;

import ft;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Get_CID_Registry_Ordering_Supplement(FT_Face face, const(char)** registry, const(char)** ordering, int* supplement);
		FT_Error FT_Get_CID_Is_Internally_CID_Keyed(FT_Face face, FT_Bool* is_cid);
		FT_Error FT_Get_CID_From_Glyph_Index(FT_Face face, uint glyph_index, uint* cid);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_CID_Registry_Ordering_Supplement = FT_Error function(FT_Face face, const(char)** registry, const(char)** ordering, int* supplement);
		alias pFT_Get_CID_Is_Internally_CID_Keyed = FT_Error function(FT_Face face, FT_Bool* is_cid);
		alias pFT_Get_CID_From_Glyph_Index = FT_Error function(FT_Face face, uint glyph_index, uint* cid);
	}
	__gshared{
		pFT_Get_CID_Registry_Ordering_Supplement FT_Get_CID_Registry_Ordering_Supplement;
		pFT_Get_CID_Is_Internally_CID_Keyed FT_Get_CID_Is_Internally_CID_Keyed;
		pFT_Get_CID_From_Glyph_Index FT_Get_CID_From_Glyph_Index;
	}
}
