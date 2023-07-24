/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.gzip;

import bindbc.freetype.config;

import ft.system;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Stream_OpenGzip(FT_Stream stream, FT_Stream source);
		FT_Error FT_Gzip_Uncompress(FT_Memory memory, ubyte* output, FT_ULong* output_len, const(ubyte)* input, FT_ULong input_len);
	}
}else{
	extern(C) nothrow @nogc{
		alias da_FT_Stream_OpenGzip = FT_Error function(FT_Stream stream, FT_Stream source);
		alias da_FT_Gzip_Uncompress = FT_Error function(FT_Memory memory, ubyte* output, FT_ULong* output_len, const(ubyte)* input, FT_ULong input_len);
	}
	__gshared{
		da_FT_Stream_OpenGzip FT_Stream_OpenGzip;
		da_FT_Gzip_Uncompress FT_Gzip_Uncompress;
	}
}
