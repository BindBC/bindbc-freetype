/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.bdf;

version(linux):
import bindbc.freetype.config;

import ft;
import ft.types;

alias BDF_PropertyType = int;
enum: BDF_PropertyType{
	BDF_PROPERTY_TYPE_NONE      = 0,
	BDF_PROPERTY_TYPE_ATOM      = 1,
	BDF_PROPERTY_TYPE_INTEGER   = 2,
	BDF_PROPERTY_TYPE_CARDINAL  = 3
}

alias BDF_Property = BDF_PropertyRec*;

struct BDF_PropertyRec{
	BDF_PropertyType type;
	union u{
		char* atom;
		int integer;
		uint cardinal;
	}
}

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Get_BDF_Charset_ID(FT_Face face, const(char)** acharset_encoding, const(char)** acharset_registry);
		FT_Error FT_Get_BDF_Property(FT_Face face, const(char)* prop_name, BDF_PropertyRec* aproperty);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_BDF_Charset_ID = FT_Error function(FT_Face face, const(char)** acharset_encoding, const(char)** acharset_registry);
		alias pFT_Get_BDF_Property = FT_Error function(FT_Face face, const(char)* prop_name, BDF_PropertyRec* aproperty);
	}
	__gshared{
		pFT_Get_BDF_Charset_ID FT_Get_BDF_Charset_ID;
		pFT_Get_BDF_Property FT_Get_BDF_Property;
	}
}
