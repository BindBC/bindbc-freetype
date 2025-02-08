/+
+            Copyright 2023 – 2025 Aya Partridge
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

mixin(makeEnumBind(q{FT_Stroker_LineJoin}, members: (){
	EnumMember[] ret = [
		{{q{round},          q{FT_STROKER_LINEJOIN_ROUND}},           q{0}},
		{{q{bevel},          q{FT_STROKER_LINEJOIN_BEVEL}},           q{1}},
		{{q{mitreVariable},  q{FT_STROKER_LINEJOIN_MITRE_VARIABLE}},  q{2}, aliases: [{q{mitre}, q{FT_STROKER_LINEJOIN_MITRE}}, {q{miterVariable}, q{FT_STROKER_LINEJOIN_MITER_VARIABLE}}]},
		{{q{mitreFixed},     q{FT_STROKER_LINEJOIN_MITRE_FIXED}},     q{3}, aliases: [{q{miterFixed}, q{FT_STROKER_LINEJOIN_MITER_FIXED}}]},
	];
	return ret;
}()));

mixin(makeEnumBind(q{FT_Stroker_LineCap}, members: (){
	EnumMember[] ret = [
		{{q{butt},    q{FT_STROKER_LINECAP_BUTT}},    q{0}},
		{{q{round},   q{FT_STROKER_LINECAP_ROUND}},   q{1}},
		{{q{square},  q{FT_STROKER_LINECAP_SQUARE}},  q{2}},
	];
	return ret;
}()));

mixin(makeEnumBind(q{FT_StrokerBorder}, members: (){
	EnumMember[] ret = [
		{{q{left},   q{FT_STROKER_BORDER_LEFT}},   q{0}},
		{{q{right},  q{FT_STROKER_BORDER_RIGHT}},  q{1}},
	];
	return ret;
}()));

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_StrokerBorder}, q{FT_Outline_GetInsideBorder}, q{FT_Outline* outline}},
		{q{FT_StrokerBorder}, q{FT_Outline_GetOutsideBorder}, q{FT_Outline* outline}},
		{q{FT_Error}, q{FT_Stroker_New}, q{FT_Library library, FT_Stroker* aStroker}},
		{q{void}, q{FT_Stroker_Set}, q{FT_Stroker stroker, FT_Fixed radius, FT_Stroker_LineCap lineCap, FT_Stroker_LineJoin lineJoin, FT_Fixed mitreLimit}},
		{q{void}, q{FT_Stroker_Rewind}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Stroker_ParseOutline}, q{FT_Stroker stroker, FT_Outline* outline, FT_Bool opened}},
		{q{FT_Error}, q{FT_Stroker_BeginSubPath}, q{FT_Stroker stroker, FT_Vector* to, FT_Bool open}},
		{q{FT_Error}, q{FT_Stroker_EndSubPath}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Stroker_LineTo}, q{FT_Stroker stroker, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_ConicTo}, q{FT_Stroker stroker, FT_Vector* control, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_CubicTo}, q{FT_Stroker stroker, FT_Vector* control1, FT_Vector* control2, FT_Vector* to}},
		{q{FT_Error}, q{FT_Stroker_GetBorderCounts}, q{FT_Stroker stroker, FT_StrokerBorder border, uint* aNumPoints, uint* aNumContours}},
		{q{void}, q{FT_Stroker_ExportBorder}, q{FT_Stroker stroker, FT_StrokerBorder border, FT_Outline* outline}},
		{q{FT_Error}, q{FT_Stroker_GetCounts}, q{FT_Stroker stroker, uint* aNumPoints, uint* aNumContours}},
		{q{void}, q{FT_Stroker_Export}, q{FT_Stroker stroker, FT_Outline* outline}},
		{q{void}, q{FT_Stroker_Done}, q{FT_Stroker stroker}},
		{q{FT_Error}, q{FT_Glyph_Stroke}, q{FT_Glyph* pGlyph, FT_Stroker stroker, FT_Bool destroy}},
		{q{FT_Error}, q{FT_Glyph_StrokeBorder}, q{FT_Glyph* pGlyph, FT_Stroker stroker, FT_Bool inside, FT_Bool destroy}},
	];
	return ret;
}()));
