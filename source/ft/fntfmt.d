/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.fntfmt;

import bindbc.freetype.config;

import ft;

static if(staticBinding){
	extern(C) nothrow @nogc{
		const(char)* FT_Get_Font_Format(FT_Face face);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_Font_Format = const(char)* function(FT_Face face);
	}
	
	__gshared{
		pFT_Get_Font_Format FT_Get_Font_Format;
	}
}