
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftpfr;

import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.ftimage,
       bindbc.freetype.bind.fttypes;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_Error FT_Get_PFR_Metrics(FT_Face face, FT_UInt* aoutline_resolution, FT_UInt* ametrics_resolution,FT_Fixed* ametrics_x_scale,FT_Fixed* ametrics_y_scale);
        FT_Error FT_Get_PFR_Kerning(FT_Face face, FT_UInt left, FT_UInt right, FT_Vector* avector);
        FT_Error FT_Get_PFR_Advance(FT_Face face, FT_UInt gindex, FT_Pos* aadvance);
    }
}
else {
    extern(C) @nogc nothrow {
        alias da_FT_Get_PFR_Metrics = FT_Error function(FT_Face face, FT_UInt* aoutline_resolution, FT_UInt* ametrics_resolution,FT_Fixed* ametrics_x_scale,FT_Fixed* ametrics_y_scale);
        alias da_FT_Get_PFR_Kerning = FT_Error function(FT_Face face, FT_UInt left, FT_UInt right, FT_Vector* avector);
        alias da_FT_Get_PFR_Advance = FT_Error function(FT_Face face, FT_UInt gindex, FT_Pos* aadvance);
    }

    __gshared {
        da_FT_Get_PFR_Metrics FT_Get_PFR_Metrics;
        da_FT_Get_PFR_Kerning FT_Get_PFR_Kerning;
        da_FT_Get_PFR_Advance FT_Get_PFR_Advance;
    }
}