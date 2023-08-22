/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.pfr;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.types;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_PFR_Metrics}, q{FT_Face face, uint* aoutline_resolution, uint* ametrics_resolution, FT_Fixed* ametrics_x_scale, FT_Fixed* ametrics_y_scale}},
		{q{FT_Error}, q{FT_Get_PFR_Kerning}, q{FT_Face face, uint left, uint right, FT_Vector* avector}},
		{q{FT_Error}, q{FT_Get_PFR_Advance}, q{FT_Face face, uint gindex, FT_Pos* aadvance}},
	];
	return ret;
}()));
