
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftfntfmt;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype;

static if(staticBinding) {
	extern(C) @nogc nothrow {
        const(char)* FT_Get_Font_Format(FT_Face face);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Get_Font_Format = const(char)* function(FT_Face face);
    }

    __gshared {
        pFT_Get_Font_Format FT_Get_Font_Format;
    }
}