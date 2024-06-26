/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.bdf;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

version(linux){
	import ft;
	import ft.types;
	
	mixin(makeEnumBind(q{BDF_PropertyType}, members: (){
		EnumMember[] ret = [
			{{q{none},      q{BDF_PROPERTY_TYPE_NONE}},      q{0}},
			{{q{atom},      q{BDF_PROPERTY_TYPE_ATOM}},      q{1}},
			{{q{integer},   q{BDF_PROPERTY_TYPE_INTEGER}},   q{2}},
			{{q{cardinal},  q{BDF_PROPERTY_TYPE_CARDINAL}},  q{3}},
		];
		return ret;
	}()));
	
	alias BDF_Property = BDF_PropertyRec*;
	
	struct BDF_PropertyRec{
		BDF_PropertyType type;
		union{
			char* atom;
			int integer;
			uint cardinal;
		}
	}
}

mixin(joinFnBinds((){
	FnBind[] ret;
	version(linux){{
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_BDF_Charset_ID}, q{FT_Face face, const(char)** aCharsetEncoding, const(char)** aCharsetRegistry}},
			{q{FT_Error}, q{FT_Get_BDF_Property}, q{FT_Face face, const(char)* propName, BDF_PropertyRec* aProperty}},
		];
		ret ~= add;
	}}
	return ret;
}()));
