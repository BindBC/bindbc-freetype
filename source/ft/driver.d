/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.driver;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

enum{
	FT_CFF_HINTING_FREETYPE  = 0,
	FT_CFF_HINTING_ADOBE     = 1,
}

enum{
	TT_INTERPRETER_VERSION_35  = 35,
	TT_INTERPRETER_VERSION_38  = 38,
	TT_INTERPRETER_VERSION_40  = 40,
}

enum{
	FT_AUTOHINTER_SCRIPT_NONE   = 0,
	FT_AUTOHINTER_SCRIPT_LATIN  = 1,
	FT_AUTOHINTER_SCRIPT_CJK    = 2,
	FT_AUTOHINTER_SCRIPT_INDIC  = 3,
}

struct FT_Prop_GlyphToScriptMap{
	FT_Face face;
	ushort* map;
}

struct FT_Prop_IncreaseXHeight{
	FT_Face face;
	uint limit;
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
