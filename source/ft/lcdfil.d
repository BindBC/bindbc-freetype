/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.lcdfil;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.types;

alias FT_LcdFilter = int;
enum: FT_LcdFilter{
	FT_LCD_FILTER_NONE    = 0,
	FT_LCD_FILTER_DEFAULT = 1,
	FT_LCD_FILTER_LIGHT   = 2,
	FT_LCD_FILTER_LEGACY1 = 3,
	FT_LCD_FILTER_LEGACY  = 16,
	FT_LCD_FILTER_MAX,
}

// Added in Freetype 2.8
enum FT_LcdFilter FT_LCD_FILTER_FIVE_TAPS = 5;
alias FT_LcdFiveTapFilter = ubyte[FT_LCD_FILTER_FIVE_TAPS];

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Library_SetLcdFilter}, q{FT_Library library, FT_LcdFilter filter}},
		{q{FT_Error}, q{FT_Library_SetLcdFilterWeights}, q{FT_Library library, ubyte* weights}},
		{q{FT_Error}, q{FT_Library_SetLcdGeometry}, q{FT_Library library, ref FT_Vector[3] sub}},
	];
	return ret;
}()));
