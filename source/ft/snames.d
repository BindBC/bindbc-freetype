/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.snames;

import bindbc.freetype.config;

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

static if(staticBinding){
	extern(C) nothrow @nogc{
		uint FT_Get_Sfnt_Name_Count(FT_Face face);
		FT_Error FT_Get_Sfnt_Name(FT_Face face, uint idx, FT_SfntName* aname);
		
		static if(ftSupport >= FTSupport.v2_8){
			FT_Error FT_Get_Sfnt_LangTag(FT_Face face, uint langID, FT_SfntLangTag* alangTag);
		}
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_Sfnt_Name_Count = uint function(FT_Face face);
		alias pFT_Get_Sfnt_Name = FT_Error function(FT_Face face, uint idx, FT_SfntName* aname);
		
		static if(ftSupport >= FTSupport.v2_8){
			alias pFT_Get_Sfnt_LangTag = FT_Error function(FT_Face face, uint langID, FT_SfntLangTag* alangTag);
		}
	}
	__gshared{
		pFT_Get_Sfnt_Name_Count FT_Get_Sfnt_Name_Count;
		pFT_Get_Sfnt_Name FT_Get_Sfnt_Name;
		
		static if(ftSupport >= FTSupport.v2_8){
			pFT_Get_Sfnt_LangTag FT_Get_Sfnt_LangTag;
		}
	}
}