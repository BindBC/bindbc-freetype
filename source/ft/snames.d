/+
+            Copyright 2023 – 2024 Aya Partridge
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
	ushort platformID;
	ushort encodingID;
	ushort languageID;
	ushort nameID;
	alias platform_id = platformID;
	alias encoding_id = encodingID;
	alias language_id = languageID;
	alias name_id = nameID;
	ubyte* string;
	uint stringLen;
	alias string_len = stringLen;
}

struct FT_SfntLangTag{
	ubyte* string;
	alias string_ = FT_SfntLangTag.string;
	uint stringLen;
	alias string_len = stringLen;
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{uint}, q{FT_Get_Sfnt_Name_Count}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Get_Sfnt_Name}, q{FT_Face face, uint idx, FT_SfntName* aName}},
		
	];
	if(ftSupport >= FTSupport.v2_8){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_Sfnt_LangTag}, q{FT_Face face, uint langID, FT_SfntLangTag* aLangTag}},
		];
		ret ~= add;
	}
	return ret;
}()));
