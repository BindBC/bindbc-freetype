/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.otval;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

enum{
	FT_VALIDATE_BASE = 0x0100,
	FT_VALIDATE_GDEF = 0x0200,
	FT_VALIDATE_GPOS = 0x0400,
	FT_VALIDATE_GSUB = 0x0800,
	FT_VALIDATE_JSTF = 0x1000,
	FT_VALIDATE_MATH = 0x2000,
	FT_VALIDATE_OT =
		FT_VALIDATE_BASE | FT_VALIDATE_GDEF |
		FT_VALIDATE_GPOS | FT_VALIDATE_GSUB |
		FT_VALIDATE_JSTF | FT_VALIDATE_MATH,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{da_FT_OpenType_Validate}, q{FT_Face face, uint validation_flags, ubyte** BASE_table, ubyte** GDEF_table, ubyte** GPOS_table, ubyte** GSUB_table, ubyte** JSTF_table}},
		{q{void}, q{da_FT_OpenType_Free}, q{FT_Face face, ubyte* table}},
	];
	return ret;
}()));
