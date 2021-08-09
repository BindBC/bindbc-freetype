
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftadvanc;

enum FT_ADVANCE_FLAG_FAST_ONLY = 0x20000000;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.fttypes;

static if(staticBinding) {
	extern(C) @nogc nothrow {
        FT_Error FT_Get_Advance(FT_Face face, FT_UInt gIndex, FT_Int32 load_flags, FT_Fixed* padvance);
        FT_Error FT_Get_Advances(FT_Face face, FT_UInt start, FT_UInt count, FT_Int32 load_flags, FT_Fixed* padvances);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Get_Advance = FT_Error function(FT_Face face, FT_UInt gIndex, FT_Int32 load_flags, FT_Fixed* padvance);
        alias pFT_Get_Advances = FT_Error function(FT_Face face, FT_UInt start, FT_UInt count, FT_Int32 load_flags, FT_Fixed* padvances);
    }

    __gshared {
        pFT_Get_Advance FT_Get_Advance;
        pFT_Get_Advances FT_Get_Advances;
    }
}