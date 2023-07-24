/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.bbox;

import bindbc.freetype.config;

import ft.image;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Outline_Get_BBox(FT_Outline* outline, FT_BBox* abbox);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Outline_Get_BBox = FT_Error function(FT_Outline* outline, FT_BBox* abbox);
	}
	__gshared{
		pFT_Outline_Get_BBox FT_Outline_Get_BBox;
	}
}
