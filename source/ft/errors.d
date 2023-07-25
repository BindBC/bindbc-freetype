/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.errors;

import bindbc.freetype.config;

import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		static if(ftSupport >= FTSupport.v2_10){
			const(char)* FT_Error_String(FT_Error error_code);
		}
	}
}else{
	static if(ftSupport >= FTSupport.v2_10){
		extern(C) nothrow @nogc{
			alias pFT_Error_String = const(char)* function(FT_Error error_code);
		}
		__gshared{
			pFT_Error_String FT_Error_String;
		}
	}
}
