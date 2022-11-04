
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.fterrors;

import bindbc.freetype.config;
import bindbc.freetype.bind.fttypes;

static if(staticBinding) {
	extern(C) @nogc nothrow {
        static if(ftSupport >= FTSupport.ft210) {
            const(char)* FT_Error_String(FT_Error error_code);
        }
    }
}
else {
    static if(ftSupport >= FTSupport.ft210) {
        extern(C) @nogc nothrow {
            alias pFT_Error_String = const(char)* function(FT_Error error_code);
        }

        __gshared {
            pFT_Error_String FT_Error_String;
        }
    }
}