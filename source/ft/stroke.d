/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.stroke;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.glyph;
import ft.system;
import ft.types;

struct FT_StrokerRec;
alias FT_Stroker = FT_StrokerRec*;

alias FT_Stroker_LineJoin = int;
enum: FT_Stroker_LineJoin{
	FT_STROKER_LINEJOIN_ROUND           = 0,
	FT_STROKER_LINEJOIN_BEVEL           = 1,
	FT_STROKER_LINEJOIN_MITER_VARIABLE  = 2,
	FT_STROKER_LINEJOIN_MITRE_VARIABLE  = FT_STROKER_LINEJOIN_MITER_VARIABLE,
	FT_STROKER_LINEJOIN_MITER           = FT_STROKER_LINEJOIN_MITER_VARIABLE,
	FT_STROKER_LINEJOIN_MITRE           = FT_STROKER_LINEJOIN_MITER,
	FT_STROKER_LINEJOIN_MITER_FIXED     = 3,
	FT_STROKER_LINEJOIN_MITRE_FIXED     = FT_STROKER_LINEJOIN_MITER_FIXED,
}

alias FT_Stroker_LineCap = int;
enum{
	FT_STROKER_LINECAP_BUTT    = 0,
	FT_STROKER_LINECAP_ROUND   = 1,
	FT_STROKER_LINECAP_SQUARE  = 2,
}

alias FT_StrokerBorder = int;
enum{
	FT_STROKER_BORDER_LEFT   = 0,
	FT_STROKER_BORDER_RIGHT  = 1,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_StrokerBorder}, q{FT_Outline_GetInsideBorder}, q{FT_Outline* outline}},
		{q{FT_StrokerBorder}, q{FT_Outline_GetOutsideBorder}, q{FT_Outline* outline}},
		{q{FT_Error}, q{FT_Stroker_New}, q{FT_Library library, FT_Stroker* astroker}},
		{q{void}, q{FT_Stroker_Set}, q{FT_Stroker stroker, FT_Fixed radius, FT_Stroker_LineCap line_cap, FT_Stroker_LineJoin line_join, FT_Fixed miter_limit}},
		{q{void}, q{FT_Stroker_Rewind}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Stroker_ParseOutline}, q{FT_Stroker stroker, FT_Outline* outline, FT_Bool opened}},
		{q{FT_Error}, q{FT_Stroker_BeginSubPath}, q{FT_Stroker stroker, FT_Vector* to, FT_Bool open}},
		{q{FT_Error}, q{FT_Stroker_EndSubPath}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Stroker_LineTo}, q{FT_Stroker stroker, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_ConicTo}, q{FT_Stroker stroker, FT_Vector* control, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_CubicTo}, q{FT_Stroker stroker, FT_Vector* control1, FT_Vector* control2, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_GetBorderCounts}, q{FT_Stroker stroker, FT_StrokerBorder border, uint* anum_points, uint* anum_contours}},
		{q{void}, q{FT_Stroker_ExportBorder}, q{FT_Stroker stroker, FT_StrokerBorder border, FT_Outline* outline}},
		{q{FT_Error}, q{FT_Stroker_GetCounts}, q{FT_Stroker stroker, uint* anum_points, uint* anum_contours}},
		{q{void}, q{FT_Stroker_Export}, q{FT_Stroker stroker, FT_Outline* outline}},
		{q{void}, q{FT_Stroker_Done}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Glyph_Stroke}, q{FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool destroy}},
		{q{FT_Error}, q{FT_Glyph_StrokeBorder}, q{FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool inside, FT_Bool destroy}},
	];
	return ret;
}()));
