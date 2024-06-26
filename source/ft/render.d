/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.render;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.ft;
import ft.glyph;
import ft.image;
import ft.modapi;
import ft.types;

extern(C) nothrow{
	alias FT_Glyph_InitFunc = FT_Error function(FT_Glyph, FT_GlyphSlot);
	alias FT_Glyph_DoneFunc = void function(FT_Glyph);
	alias FT_Glyph_TransformFunc = void function(FT_Glyph, const(FT_Matrix)*, const(FT_Vector)*);
	alias FT_Glyph_GetBBoxFunc = void function(FT_Glyph, FT_BBox*);
	alias FT_Glyph_CopyFunc = FT_Error function(FT_Glyph, FT_Glyph);
	alias FT_Glyph_PrepareFunc = FT_Error function(FT_Glyph, FT_GlyphSlot);
}

struct FT_Glyph_Class{ //typedef aliased in ftglyph.h
	FT_Long glyphSize;
	FT_Glyph_Format glyphFormat;
	FT_Glyph_InitFunc glyphInit;
	FT_Glyph_DoneFunc glyphDone;
	FT_Glyph_CopyFunc glyphCopy;
	FT_Glyph_TransformFunc glyphTransform;
	FT_Glyph_GetBBoxFunc glyphBbox;
	FT_Glyph_PrepareFunc glyphPrepare;
	alias glyph_size = glyphSize;
	alias glyph_format = glyphFormat;
	alias glyph_init = glyphInit;
	alias glyph_done = glyphDone;
	alias glyph_copy = glyphCopy;
	alias glyph_transform = glyphTransform;
	alias glyph_bbox = glyphBbox;
	alias glyph_prepare = glyphPrepare;
}

extern(C) nothrow{
	alias FT_Renderer_RenderFunc = FT_Error function(FT_Renderer, FT_GlyphSlot, FT_Render_Mode, const(FT_Vector)*);
	alias FT_Renderer_TransformFunc = FT_Error function(FT_Renderer, FT_GlyphSlot, const(FT_Matrix)*, const(FT_Vector)*);
	alias FT_Renderer_GetCBoxFunc = void function(FT_Renderer, FT_GlyphSlot, FT_BBox*);
	alias FT_Renderer_SetModeFunc = FT_Error function(FT_Renderer, FT_ULong, FT_Pointer);
}

struct FT_Renderer_Class{
	FT_Module_Class root;
	FT_Glyph_Format glyphFormat;
	FT_Renderer_RenderFunc renderGlyph;
	FT_Renderer_TransformFunc transformGlyph;
	FT_Renderer_GetCBoxFunc getGlyphCBox;
	FT_Renderer_SetModeFunc setMode;
	static if(ftSupport >= FTSupport.v2_13){
		const(FT_Raster_Funcs)* rasterClass;
	}else{
		FT_Raster_Funcs* rasterClass;
	}
	alias glyph_format = glyphFormat;
	alias render_glyph = renderGlyph;
	alias transform_glyph = transformGlyph;
	alias get_glyph_cbox = getGlyphCBox;
	alias set_mode = setMode;
	alias raster_class = rasterClass;
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Renderer}, q{FT_Get_Renderer}, q{FT_Library library, FT_Glyph_Format format}},
		{q{FT_Error}, q{FT_Set_Renderer}, q{FT_Library library, FT_Renderer renderer, uint numParams, FT_Parameter* parameters}},
	];
	return ret;
}()));
