/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.cid;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_CID_Registry_Ordering_Supplement}, q{FT_Face face, const(char)** registry, const(char)** ordering, int* supplement}},
		{q{FT_Error}, q{FT_Get_CID_Is_Internally_CID_Keyed}, q{FT_Face face, FT_Bool* is_cid}},
		{q{FT_Error}, q{FT_Get_CID_From_Glyph_Index}, q{FT_Face face, uint glyph_index, uint* cid}},
	];
	return ret;
}()));
