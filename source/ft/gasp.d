/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.gasp;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

static if(ftSupport >= FTSupport.v2_8){
	enum{
		FT_GASP_NO_TABLE = -1,
		FT_GASP_DO_GRIDFIT = 0x01,
		FT_GASP_DO_GRAY = 0x02,
		FT_GASP_SYMMETRIC_GRIDFIT = 0x04,
		FT_GASP_SYMMETRIC_SMOOTHING = 0x08,
	}
}else{
	enum{
		FT_GASP_NO_TABLE = -1,
		FT_GASP_DO_GRIDFIT = 0x01,
		FT_GASP_DO_GRAY = 0x02,
		FT_GASP_SYMMETRIC_SMOOTHING = 0x08,
		FT_GASP_SYMMETRIC_GRIDFIT = 0x10
	}
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{FT_Get_Gasp}, q{FT_Face face, uint ppem}},
	];
	return ret;
}()));
