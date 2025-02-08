/+
+            Copyright 2023 – 2025 Aya Partridge
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

mixin(makeEnumBind(q{FT_LCDFilter}, aliases: [q{FT_LcdFilter}], members: (){
	EnumMember[] ret = [
		{{q{none},          q{FT_LCD_FILTER_NONE}},       q{0}},
		{{q{default_},      q{FT_LCD_FILTER_DEFAULT}},    q{1}},
		{{q{light},         q{FT_LCD_FILTER_LIGHT}},      q{2}},
		{{q{legacy1},       q{FT_LCD_FILTER_LEGACY1}},    q{3}},
	];
	if(ftSupport >= FTSupport.v2_8){
		EnumMember[] add = [
			{{q{fiveTaps},  q{FT_LCD_FILTER_FIVE_TAPS}},  q{5}},
		];
		ret ~= add;
	}
	{
		EnumMember[] add = [
			{{q{legacy},    q{FT_LCD_FILTER_LEGACY}},     q{16}},
			{{q{max_},      q{FT_LCD_FILTER_MAX}}},
		];
		ret ~= add;
	}
	return ret;
}()));

alias FT_LcdFiveTapFilter = ubyte[FT_LCDFilter.fiveTaps];

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Library_SetLcdFilter}, q{FT_Library library, FT_LCDFilter filter}},
		{q{FT_Error}, q{FT_Library_SetLcdFilterWeights}, q{FT_Library library, ubyte* weights}},
	];
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Library_SetLcdGeometry}, q{FT_Library library, ref FT_Vector[3] sub}},
		];
		ret ~= add;
	}
	return ret;
}()));
