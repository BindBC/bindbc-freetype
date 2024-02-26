/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.advanc;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

enum FT_ADVANCE_FLAG_FAST_ONLY = 0x20000000;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_Advance}, q{FT_Face face, uint gIndex, int loadFlags, FT_Fixed* pAdvance}},
		{q{FT_Error}, q{FT_Get_Advances}, q{FT_Face face, uint start, uint count, int loadFlags, FT_Fixed* pAdvances}},
	];
	return ret;
}()));
