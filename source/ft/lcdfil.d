/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.lcdfil;

import bindbc.freetype.config;

import ft;
import ft.image;
import ft.types;

alias FT_LcdFilter = int;
enum{
	FT_LCD_FILTER_NONE    = 0,
	FT_LCD_FILTER_DEFAULT = 1,
	FT_LCD_FILTER_LIGHT   = 2,
	FT_LCD_FILTER_LEGACY1 = 3,
	FT_LCD_FILTER_LEGACY  = 16,
	FT_LCD_FILTER_MAX
}

// Added in Freetype 2.8
enum FT_LCD_FILTER_FIVE_TAPS = 5;
alias FT_LcdFiveTapFilter = ubyte[FT_LCD_FILTER_FIVE_TAPS];

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Library_SetLcdFilter(FT_Library library, FT_LcdFilter filter);
		FT_Error FT_Library_SetLcdFilterWeights(FT_Library library, ubyte* weights);
		FT_Error FT_Library_SetLcdGeometry(FT_Library library, ref FT_Vector[3] sub);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Library_SetLcdFilter = FT_Error function(FT_Library library, FT_LcdFilter filter);
		alias pFT_Library_SetLcdFilterWeights = FT_Error function(FT_Library library, ubyte* weights);
		alias pFT_Library_SetLcdGeometry = FT_Error function(FT_Library library, ref FT_Vector[3] sub);
	}
	
	__gshared{
		pFT_Library_SetLcdFilter FT_Library_SetLcdFilter;
		pFT_Library_SetLcdFilterWeights FT_Library_SetLcdFilterWeights;
		pFT_Library_SetLcdGeometry FT_Library_SetLcdGeometry;
	}
}