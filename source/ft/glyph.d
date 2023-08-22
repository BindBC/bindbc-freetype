/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.glyph;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.render;
import ft.types;

alias FT_Glyph = FT_GlyphRec*;

struct FT_GlyphRec{
	FT_Library library;
	FT_Glyph_Class* clazz;
	FT_Glyph_Format format;
	FT_Vector advance;
}

alias FT_BitmapGlyph = FT_BitmapGlyphRec*;

struct FT_BitmapGlyphRec{
	FT_GlyphRec root;
	int left;
	int top;
	FT_Bitmap bitmap;
}

alias FT_OutlineGlyph = FT_OutlineGlyphRec*;

struct FT_OutlineGlyphRec{
	FT_GlyphRec root;
	FT_Outline outline;
}

alias FT_Glyph_BBox_Mode = int;
enum{
	FT_GLYPH_BBOX_UNSCALED   = 0,
	FT_GLYPH_BBOX_SUBPIXELS  = 0,
	FT_GLYPH_BBOX_GRIDFIT    = 1,
	FT_GLYPH_BBOX_TRUNCATE   = 2,
	FT_GLYPH_BBOX_PIXELS     = 3
}

static if(ftSupport >= FTSupport.v2_12){
	alias FT_SvgGlyph = FT_SvgGlyphRec_*;
	
	struct FT_SvgGlyphRec_{
		FT_GlyphRec root;
		
		ubyte* svg_document;
		FT_ULong svg_document_length;
		
		FT_UInt glyph_index;
		
		FT_Size_Metrics metrics;
		ushort units_per_EM;
		
		ushort start_glyph_id;
		ushort end_glyph_id;
		
		FT_Matrix transform;
		FT_Vector delta;
	}
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_Glyph}, q{FT_GlyphSlot slot, FT_Glyph* aglyph}},
		{q{FT_Error}, q{FT_Glyph_Copy}, q{FT_Glyph source, FT_Glyph* target}},
		{q{FT_Error}, q{FT_Glyph_Transform}, q{FT_Glyph glyph, FT_Matrix* matrix, FT_Vector* delta}},
		{q{void}, q{FT_Glyph_Get_CBox}, q{FT_Glyph glyph, uint bbox_mode, FT_BBox* acbox}},
		{q{FT_Error}, q{FT_Glyph_To_Bitmap}, q{FT_Glyph* the_glyph, FT_Render_Mode render_mode, FT_Vector* origin, FT_Bool destroy}},
		{q{void}, q{FT_Done_Glyph}, q{FT_Glyph glyph}},
		{q{void}, q{FT_Matrix_Multiply}, q{const(FT_Matrix)* a, FT_Matrix* b}},
		{q{FT_Error}, q{FT_Matrix_Invert}, q{FT_Matrix* matrix}},
	];
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
			{q{FT_Error}, q{FT_New_Glyph}, q{FT_Library library, FT_Glyph_Format format, FT_Glyph* aglyph}},
		];
		ret ~= add;
	}
	return ret;
}()));
