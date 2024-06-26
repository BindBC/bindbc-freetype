/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.outln;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.types;

mixin(makeEnumBind(q{FT_Orientation}, members: (){
	EnumMember[] ret = [
		{{q{trueType},    q{FT_ORIENTATION_TRUETYPE}},    q{0}, aliases: [{q{fillRight}, q{FT_ORIENTATION_FILL_RIGHT}}]},
		{{q{postScript},  q{FT_ORIENTATION_POSTSCRIPT}},  q{1}, aliases: [{q{fillLeft}, q{FT_ORIENTATION_FILL_LEFT}}]},
	];
	return ret;
}()));

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Outline_Decompose}, q{FT_Outline* outline, const(FT_Outline_Funcs)* funcInterface, void* user}},
		{q{FT_Error}, q{FT_Outline_New}, q{FT_Library library, uint numPoints, int numContours, FT_Outline* anOutline}},
		{q{FT_Error}, q{FT_Outline_Done}, q{FT_Library library, FT_Outline* outline}},
		{q{FT_Error}, q{FT_Outline_Check}, q{FT_Outline* outline}},
		{q{void}, q{FT_Outline_Get_CBox}, q{const(FT_Outline)* outline, FT_BBox* aCBox}},
		{q{void}, q{FT_Outline_Translate}, q{const(FT_Outline)* outline, FT_Pos xOffset, FT_Pos yOffset}},
		{q{FT_Error}, q{FT_Outline_Copy}, q{const(FT_Outline)* outline, FT_Outline* target}},
		{q{void}, q{FT_Outline_Transform}, q{const(FT_Outline)* outline, const(FT_Matrix)* matrix}},
		{q{FT_Error}, q{FT_Outline_Embolden}, q{FT_Outline* outline, FT_Pos strength}},
		{q{FT_Error}, q{FT_Outline_EmboldenXY}, q{FT_Outline* outline, FT_Pos xStrength, FT_Pos yStrength}},
		{q{void}, q{FT_Outline_Reverse}, q{FT_Outline* outline}},
		{q{FT_Error}, q{FT_Outline_Get_Bitmap}, q{FT_Library library, FT_Outline* outline, const(FT_Bitmap)* aBitmap}},
		{q{FT_Error}, q{FT_Outline_Render}, q{FT_Library library, FT_Outline* outline, FT_Raster_Params* params}},
		{q{FT_Orientation}, q{FT_Outline_Get_Orientation}, q{FT_Outline* outline}},
	];
	return ret;
}()));
