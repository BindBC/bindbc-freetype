/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.advanc;

import bindbc.freetype.config;

import ft;
import ft.types;

enum FT_ADVANCE_FLAG_FAST_ONLY = 0x20000000;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Get_Advance(FT_Face face, uint gIndex, int load_flags, FT_Fixed* padvance);
		FT_Error FT_Get_Advances(FT_Face face, uint start, uint count, int load_flags, FT_Fixed* padvances);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_Advance = FT_Error function(FT_Face face, uint gIndex, int load_flags, FT_Fixed* padvance);
		alias pFT_Get_Advances = FT_Error function(FT_Face face, uint start, uint count, int load_flags, FT_Fixed* padvances);
	}
	__gshared{
		pFT_Get_Advance FT_Get_Advance;
		pFT_Get_Advances FT_Get_Advances;
	}
}
