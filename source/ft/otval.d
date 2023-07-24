/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.otval;

import bindbc.freetype.config;

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

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error da_FT_OpenType_Validate(FT_Face face, uint validation_flags, ubyte** BASE_table, ubyte** GDEF_table, ubyte** GPOS_table, ubyte** GSUB_table, ubyte** JSTF_table);
		void da_FT_OpenType_Free(FT_Face face, ubyte* table);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_OpenType_Validate = FT_Error function(FT_Face face, uint validation_flags, ubyte** BASE_table, ubyte** GDEF_table, ubyte** GPOS_table, ubyte** GSUB_table, ubyte** JSTF_table);
		alias pFT_OpenType_Free = void function (FT_Face face, ubyte* table);
	}
	__gshared{
		pFT_OpenType_Validate FT_OpenType_Validate;
		pFT_OpenType_Free FT_OpenType_Free;
	}
}