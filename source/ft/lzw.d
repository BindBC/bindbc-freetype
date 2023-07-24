/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.lzw;

import bindbc.freetype.config;

import ft.system;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Stream_OpenLZW(FT_Stream stream, FT_Stream source);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Stream_OpenLZW = FT_Error function(FT_Stream stream, FT_Stream source);
	}
	
	__gshared{
		pFT_Stream_OpenLZW FT_Stream_OpenLZW;
	}
}