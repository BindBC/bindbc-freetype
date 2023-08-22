/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.snames;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

struct FT_SfntName{
	ushort platform_id;
	ushort encoding_id;
	ushort language_id;
	ushort name_id;
	ubyte* string;
	uint string_len;
}

struct FT_SfntLangTag{
	ubyte* string_;
	uint string_len;
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{uint}, q{FT_Get_Sfnt_Name_Count}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Get_Sfnt_Name}, q{FT_Face face, uint idx, FT_SfntName* aname}},
		
	];
	if(ftSupport >= FTSupport.v2_8){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_Sfnt_LangTag}, q{FT_Face face, uint langID, FT_SfntLangTag* alangTag}},
		];
		ret ~= add;
	}
	return ret;
}()));
