/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.synth;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{void}, q{FT_GlyphSlot_Embolden}, q{FT_GlyphSlot slot}},
		{q{void}, q{FT_GlyphSlot_Oblique}, q{FT_GlyphSlot slot}},
	];
	if(ftSupport >= FTSupport.v2_13){
		FnBind[] add = [
			{q{void}, q{FT_GlyphSlot_AdjustWeight}, q{FT_GlyphSlot slot, FT_Fixed xdelta, FT_Fixed ydelta}},
			{q{void}, q{FT_GlyphSlot_Slant}, q{FT_GlyphSlot slot, FT_Fixed xslant, FT_Fixed yslant}},
		];
		ret ~= add;
	}
	return ret;
}()));
