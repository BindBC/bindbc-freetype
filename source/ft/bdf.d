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
import bindbc.freetype.codegen;

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

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_BDF_Charset_ID}, q{FT_Face face, const(char)** acharset_encoding, const(char)** acharset_registry}},
		{q{FT_Error}, q{FT_Get_BDF_Property}, q{FT_Face face, const(char)* prop_name, BDF_PropertyRec* aproperty}},
	];
	return ret;
}()));
