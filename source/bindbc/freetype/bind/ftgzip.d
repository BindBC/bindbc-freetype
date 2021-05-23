
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftgzip;

import bindbc.freetype.bind.ftsystem,
       bindbc.freetype.bind.fttypes;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_Error FT_Stream_OpenGzip(FT_Stream stream, FT_Stream source);
        FT_Error FT_Gzip_Uncompress(FT_Memory memory, FT_Byte* output, FT_ULong* output_len, const(FT_Byte)* input, FT_ULong input_len);
    }
}
else {
    extern(C) @nogc nothrow {
        alias da_FT_Stream_OpenGzip = FT_Error function(FT_Stream stream, FT_Stream source);
        alias da_FT_Gzip_Uncompress = FT_Error function(FT_Memory memory, FT_Byte* output, FT_ULong* output_len, const(FT_Byte)* input, FT_ULong input_len);
    }

    __gshared {
        da_FT_Stream_OpenGzip FT_Stream_OpenGzip;
        da_FT_Gzip_Uncompress FT_Gzip_Uncompress;
    }
}