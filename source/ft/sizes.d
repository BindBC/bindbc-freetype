/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.sizes;

import bindbc.freetype.config;

import ft;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_New_Size(FT_Face face,FT_Size* size);
		FT_Error FT_Done_Size(FT_Size size);
		FT_Error FT_Activate_Size(FT_Size size);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_New_Size = FT_Error function(FT_Face face,FT_Size* size);
		alias pFT_Done_Size = FT_Error function(FT_Size size);
		alias pFT_Activate_Size = FT_Error function(FT_Size size);
	}
	__gshared{
		pFT_New_Size FT_New_Size;
		pFT_Done_Size FT_Done_Size;
		pFT_Activate_Size FT_Activate_Size;
	}
}