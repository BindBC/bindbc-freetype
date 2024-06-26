/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.params;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.types;

enum{
	FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY     = ftMakeTag('i', 'g', 'p', 'f'),
	FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY  = ftMakeTag('i','g','p','s'),
	FT_PARAM_TAG_IGNORE_PREFERRED_FAMILY       = FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY,
	FT_PARAM_TAG_IGNORE_PREFERRED_SUBFAMILY    = FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY,
	
	FT_PARAM_TAG_INCREMENTAL                   = ftMakeTag('i', 'n', 'c', 'r'),
	FT_PARAM_TAG_LCD_FILTER_WEIGHTS            = ftMakeTag('l', 'c', 'd', 'f'),
	FT_PARAM_TAG_RANDOM_SEED                   = ftMakeTag('s', 'e', 'e', 'd'),
	FT_PARAM_TAG_STEM_DARKENING                = ftMakeTag('d', 'a', 'r', 'k'),
	
	// Deprecated
	T_PARAM_TAG_UNPATENTED_HINTING             = ftMakeTag( 'u', 'n', 'p', 'a' ),
}
static if(ftSupport >= FTSupport.v2_12)
enum{
	FT_PARAM_TAG_IGNORE_SBIX 	               = ftMakeTag( 'i', 's', 'b', 'x' ),
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
