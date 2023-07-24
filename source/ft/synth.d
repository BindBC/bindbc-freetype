/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.synth;

import bindbc.freetype.config;

import ft;

static if(staticBinding){
	extern(C) nothrow @nogc{
		void FT_GlyphSlot_Embolden(FT_GlyphSlot slot);
		void FT_GlyphSlot_Oblique(FT_GlyphSlot slot);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_GlyphSlot_Embolden = void function(FT_GlyphSlot slot);
		alias pFT_GlyphSlot_Oblique = void function(FT_GlyphSlot slot);
	}
	
	__gshared{
		pFT_GlyphSlot_Embolden FT_GlyphSlot_Embolden;
		pFT_GlyphSlot_Oblique FT_GlyphSlot_Oblique;
	}
}