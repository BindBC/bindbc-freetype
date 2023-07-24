/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.pfr;

import bindbc.freetype.config;

import ft;
import ft.image;
import ft.types;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Get_PFR_Metrics(FT_Face face, uint* aoutline_resolution, uint* ametrics_resolution,FT_Fixed* ametrics_x_scale,FT_Fixed* ametrics_y_scale);
		FT_Error FT_Get_PFR_Kerning(FT_Face face, uint left, uint right, FT_Vector* avector);
		FT_Error FT_Get_PFR_Advance(FT_Face face, uint gindex, FT_Pos* aadvance);
	}
}else{
	extern(C) nothrow @nogc{
		alias da_FT_Get_PFR_Metrics = FT_Error function(FT_Face face, uint* aoutline_resolution, uint* ametrics_resolution,FT_Fixed* ametrics_x_scale,FT_Fixed* ametrics_y_scale);
		alias da_FT_Get_PFR_Kerning = FT_Error function(FT_Face face, uint left, uint right, FT_Vector* avector);
		alias da_FT_Get_PFR_Advance = FT_Error function(FT_Face face, uint gindex, FT_Pos* aadvance);
	}
	__gshared{
		da_FT_Get_PFR_Metrics FT_Get_PFR_Metrics;
		da_FT_Get_PFR_Kerning FT_Get_PFR_Kerning;
		da_FT_Get_PFR_Advance FT_Get_PFR_Advance;
	}
}