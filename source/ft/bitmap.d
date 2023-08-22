/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.bitmap;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.modapi;
import ft.types;
static if(ftSupport >= FTSupport.v2_10){
	import ft.color;
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{void}, q{FT_Bitmap_Init}, q{FT_Bitmap* abitmap}},
		{q{FT_Error}, q{FT_Bitmap_Copy}, q{FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target}},
		{q{FT_Error}, q{FT_Bitmap_Embolden}, q{FT_Library library, FT_Bitmap* bitmap, FT_Pos xStrength, FT_Pos yStrength}},
		{q{FT_Error}, q{FT_Bitmap_Convert}, q{FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target, int alignment}},
		{q{FT_Error}, q{FT_GlyphSlot_Own_Bitmap}, q{FT_GlyphSlot slot}},
		{q{FT_Error}, q{FT_Bitmap_Done}, q{FT_Library library, FT_Bitmap* bitmap}},
	];
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
		{q{FT_Error}, q{FT_Bitmap_Blend}, q{FT_Library library, const(FT_Bitmap)* source, const(FT_Vector) source_offset, FT_Bitmap* target, FT_Vector* atarget_offset, FT_Color color}},
		];
		ret ~= add;
	}
	return ret;
}()));
