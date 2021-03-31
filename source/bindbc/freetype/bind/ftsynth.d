
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftsynth;

import bindbc.freetype.bind.freetype;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        void FT_GlyphSlot_Embolden(FT_GlyphSlot slot);
        void FT_GlyphSlot_Oblique(FT_GlyphSlot slot);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_GlyphSlot_Embolden = void function(FT_GlyphSlot slot);
        alias pFT_GlyphSlot_Oblique = void function(FT_GlyphSlot slot);
    }

    __gshared {
        pFT_GlyphSlot_Embolden FT_GlyphSlot_Embolden;
        pFT_GlyphSlot_Oblique FT_GlyphSlot_Oblique;
    }
}