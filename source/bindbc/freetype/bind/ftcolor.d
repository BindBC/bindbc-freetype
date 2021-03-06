
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftcolor;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.fttypes;

static if(ftSupport >= FTSupport.ft210) {
    import bindbc.freetype.bind.fttypes;

    struct FT_Color {
        FT_Byte blue;
        FT_Byte green;
        FT_Byte red;
        FT_Byte alpha;
    }

    struct FT_Palette_Data {
        FT_UShort num_palettes;
        const(FT_UShort)* palette_name_ids;
        const(FT_UShort)* palette_flags;
        FT_UShort num_palette_entries;
        const(FT_UShort)* palette_entry_name_ids;
    }

    version(BindFT_Static) {
        extern(C) @nogc nothrow {
            FT_Error FT_Palette_Data_Get(FT_Face face, FT_Palette_Data* apalette);
            FT_Error FT_Palette_Select(FT_Face face, FT_UShort palette_index, FT_Color* apalette);
            FT_Error FT_Palette_Set_Foreground_Color(FT_Face face, FT_Color foreground_color);
        }
    }
    else {
        extern(C) @nogc nothrow {
            alias pFT_Palette_Data_Get = FT_Error function(FT_Face face,FT_Palette_Data* apalette);
            alias pFT_Palette_Select = FT_Error function(FT_Face face, FT_UShort palette_index, FT_Color* apalette);
            alias pFT_Palette_Set_Foreground_Color = FT_Error function(FT_Face face, FT_Color foreground_color);
        }

        __gshared {
            pFT_Palette_Data_Get FT_Palette_Data_Get;
            pFT_Palette_Select FT_Palette_Select;
            pFT_Palette_Set_Foreground_Color FT_Palette_Set_Foreground_Color;
        }
    }
}