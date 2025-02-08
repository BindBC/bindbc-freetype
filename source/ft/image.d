/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.image;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import bindbc.common.types: c_long;
import ft.types;

alias FT_Pos = c_long;

struct FT_Vector{
	FT_Pos x;
	FT_Pos y;
}

struct FT_BBox{
	FT_Pos xMin, yMin;
	FT_Pos xMax, yMax;
}

mixin(makeEnumBind(q{FT_Pixel_Mode}, members: (){
	EnumMember[] ret = [
		{{q{none},   q{FT_PIXEL_MODE_NONE}},  q{0}},
		{{q{mono},   q{FT_PIXEL_MODE_MONO}}},
		{{q{grey},   q{FT_PIXEL_MODE_GREY}}, aliases: [{q{gray}, q{FT_PIXEL_MODE_GRAY}}]},
		{{q{grey2},  q{FT_PIXEL_MODE_GREY2}}, aliases: [{q{gray2}, q{FT_PIXEL_MODE_GRAY2}}]},
		{{q{grey4},  q{FT_PIXEL_MODE_GREY4}}, aliases: [{q{gray4}, q{FT_PIXEL_MODE_GRAY4}}]},
		{{q{lcd},    q{FT_PIXEL_MODE_LCD}}},
		{{q{lcdV},   q{FT_PIXEL_MODE_LCD_V}}},
		{{q{bgra},   q{FT_PIXEL_MODE_BGRA}}},
		{{q{max_},   q{FT_PIXEL_MODE_MAX}}},
	];
	return ret;
}()));

struct FT_Bitmap{
	uint rows;
	uint width;
	int pitch;
	ubyte* buffer;
	ushort numGreys;
	ubyte pixelMode;
	ubyte paletteMode;
	alias num_greys = numGreys;
	alias num_grays = numGreys;
	alias numGrays = numGreys;
	alias pixel_mode = pixelMode;
	alias palette_mode = paletteMode;
	void* palette;
}

struct FT_Outline{
	short nContours;
	short nPoints;
	alias n_contours = nContours;
	alias n_points = nPoints;
	FT_Vector* points;
	byte* tags;
	short* contours;
	int flags;
}

enum FT_OUTLINE_CONTOURS_MAX = short.max;
enum FT_OUTLINE_POINTS_MAX = short.max;

enum: uint{
	FT_OUTLINE_NONE            = 0x0,
	FT_OUTLINE_OWNER           = 0x1,
	FT_OUTLINE_EVEN_ODD_FILL   = 0x2,
	FT_OUTLINE_REVERSE_FILL    = 0x4,
	FT_OUTLINE_IGNORE_DROPOUTS = 0x8,
	FT_OUTLINE_SMART_DROPOUTS  = 0x10,
	FT_OUTLINE_INCLUDE_STUBS   = 0x20,
	FT_OUTLINE_HIGH_PRECISION  = 0x100,
	FT_OUTLINE_SINGLE_PASS     = 0x200,
}
static if(ftSupport >= FTSupport.v2_11)
enum: uint{
	FT_OUTLINE_OVERLAP         = 0x40,
}

enum{
	FT_CURVE_TAG_ON          = 1,
	FT_CURVE_TAG_CONIC       = 0,
	FT_CURVE_TAG_CUBIC       = 2,
	FT_CURVE_TAG_TOUCH_X     = 8,
	FT_CURVE_TAG_TOUCH_Y     = 16,
	FT_CURVE_TAG_TOUCH_BOTH  = FT_CURVE_TAG_TOUCH_X | FT_CURVE_TAG_TOUCH_Y,
}

extern(C) nothrow{
	alias FT_Outline_MoveToFunc = int function(const(FT_Vector)*, void*);
	alias FT_Outline_LineToFunc = int function(const(FT_Vector)*, void*);
	alias FT_Outline_ConicToFunc = int function(const(FT_Vector)*, const(FT_Vector)*, void*);
	alias FT_Outline_CubicToFunc = int function(const(FT_Vector)*, const(FT_Vector)*, const(FT_Vector)*, void*);
}

struct FT_Outline_Funcs{
	FT_Outline_MoveToFunc moveTo;
	FT_Outline_LineToFunc lineTo;
	FT_Outline_ConicToFunc conicTo;
	FT_Outline_CubicToFunc cubicTo;
	alias move_to = moveTo;
	alias line_to = lineTo;
	alias conic_to = conicTo;
	alias cubic_to = cubicTo;
	int shift;
	FT_Pos delta;
}

mixin(makeEnumBind(q{FT_Glyph_Format}, q{FT_Tag}, members: (){
	EnumMember[] ret = [
		{{q{none},       q{FT_GLYPH_FORMAT_NONE}},       q{0}},
		{{q{composite},  q{FT_GLYPH_FORMAT_COMPOSITE}},  q{ftMakeTag('c','o','m','p')}},
		{{q{bitmap},     q{FT_GLYPH_FORMAT_BITMAP}},     q{ftMakeTag('b','i','t','s')}},
		{{q{outline},    q{FT_GLYPH_FORMAT_OUTLINE}},    q{ftMakeTag('o','u','t','l')}},
		{{q{plotter},    q{FT_GLYPH_FORMAT_PLOTTER}},    q{ftMakeTag('p','l','o','t')}},
	];
	if(ftSupport >= FTSupport.v2_12){
		EnumMember[] add = [
			{{q{svg},    q{FT_GLYPH_FORMAT_SVG}},        q{ftMakeTag('S','V','G',' ')}},
		];
		ret ~= add;
	}
	return ret;
}()));

struct FT_RasterRec;
alias FT_Raster = FT_RasterRec*;

struct FT_Span{
	short x;
	ushort len;
	ubyte coverage;
}

alias FT_SpanFunc = extern(C) void function(int, int, FT_Span*, void*) nothrow;

enum{
	FT_RASTER_FLAG_DEFAULT  = 0x0,
	FT_RASTER_FLAG_AA       = 0x1,
	FT_RASTER_FLAG_DIRECT   = 0x2,
	FT_RASTER_FLAG_CLIP     = 0x4,
}
static if(ftSupport >= FTSupport.v2_11)
enum{
	FT_RASTER_FLAG_SDF      = 0x8,
}

struct FT_Raster_Params{
	const(FT_Bitmap)* target;
	const(void)* source;
	int flags;
	FT_SpanFunc graySpans;
	void* blackSpans;
	void* bitTest;
	void* bitSet;
	alias gray_spans = graySpans;
	alias black_spans = blackSpans;
	alias bit_test = bitTest;
	alias bit_set = bitSet;
	void* user;
	FT_BBox clipBox;
	alias clip_box = clipBox;
}

extern(C) nothrow{
	alias FT_Raster_NewFunc = int function(void*, FT_Raster*);
	alias FT_Raster_DoneFunc = void function(FT_Raster);
	alias FT_Raster_ResetFunc = void function(FT_Raster, ubyte*, uint);
	alias FT_Raster_SetModeFunc = int function(FT_Raster, uint, void*);
	alias FT_Raster_RenderFunc = int function(FT_Raster, FT_Raster_Params*);
}

struct FT_Raster_Funcs{
	FT_Glyph_Format glyphFormat;
	FT_Raster_NewFunc rasterNew;
	FT_Raster_ResetFunc rasterReset;
	FT_Raster_SetModeFunc rasterSetMode;
	FT_Raster_RenderFunc rasterRender;
	FT_Raster_DoneFunc rasterDone;
	alias glyph_format = glyphFormat;
	alias raster_new = rasterNew;
	alias raster_reset = rasterReset;
	alias raster_set_mode = rasterSetMode;
	alias raster_render = rasterRender;
	alias raster_done = rasterDone;
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
