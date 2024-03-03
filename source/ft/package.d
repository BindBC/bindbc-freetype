/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft;

public import
	ft.advanc,
	ft.bbox,
	ft.bdf,
	ft.bitmap,
	ft.bzip2,
	ft.cache,
	ft.cid,
	ft.color,
	ft.driver,
	ft.errdef,
	ft.errors,
	ft.fntfmt,
	ft.gasp,
	ft.glyph,
	ft.gxval,
	ft.gzip,
	ft.image,
	ft.increm,
	ft.lcdfil,
	ft.list,
	ft.logging,
	ft.lzw,
	ft.mm,
	ft.modapi,
	ft.moderr,
	ft.otval,
	ft.outln,
	ft.params,
	ft.pfr,
	ft.render,
	ft.sizes,
	ft.snames,
	ft.stroke,
	ft.synth,
	ft.system,
	ft.t1tables,
	ft.trigon,
	ft.ttnameid,
	ft.tttables,
	ft.tttags,
	ft.types,
	ft.winfnt;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import bindbc.common.types: c_long;

alias colour = ft.color;

struct FT_Glyph_Metrics{
	FT_Pos width;
	FT_Pos height;
	FT_Pos horiBearingX;
	FT_Pos horiBearingY;
	FT_Pos horiAdvance;
	FT_Pos vertBearingX;
	FT_Pos vertBearingY;
	FT_Pos vertAdvance;
}

struct FT_Bitmap_Size{
	short height;
	short width;
	FT_Pos size;
	FT_Pos x_ppem;
	FT_Pos y_ppem;
}

struct FT_LibraryRec;
struct FT_ModuleRec;
struct FT_DriverRec;
struct FT_RendererRec;

alias FT_Library = FT_LibraryRec*;
alias FT_Module = FT_ModuleRec*;
alias FT_Driver = FT_DriverRec*;
alias FT_Renderer = FT_RendererRec*;
alias FT_Face = FT_FaceRec*;
alias FT_Size = FT_SizeRec*;
alias FT_GlyphSlot = FT_GlyphSlotRec*;
alias FT_CharMap = FT_CharMapRec*;

alias FT_ENC_TAG = FT_MAKE_TAG;

alias FT_Encoding = FT_Tag;
enum: FT_Tag{
	FT_ENCODING_NONE            = 0,
	FT_ENCODING_MS_SYMBOL       = FT_MAKE_TAG('s','y','m','b'),
	FT_ENCODING_UNICODE         = FT_MAKE_TAG('u','n','i','c'),
	FT_ENCODING_SJIS            = FT_MAKE_TAG('s','j','i','s'),
	FT_ENCODING_PRC             = FT_MAKE_TAG('g','b',' ',' '),
	FT_ENCODING_BIG5            = FT_MAKE_TAG('b','i','g','5'),
	FT_ENCODING_WANSUNG         = FT_MAKE_TAG('w','a','n','s'),
	FT_ENCODING_JOHAB           = FT_MAKE_TAG('j','o','h','a'),
	FT_ENCODING_GB2312          = FT_ENCODING_PRC,
	FT_ENCODING_MS_SJIS         = FT_ENCODING_SJIS,
	FT_ENCODING_MS_GB2312       = FT_ENCODING_PRC,
	FT_ENCODING_MS_BIG5         = FT_ENCODING_BIG5,
	FT_ENCODING_MS_WANSUNG      = FT_ENCODING_WANSUNG,
	FT_ENCODING_MS_JOHAB        = FT_ENCODING_JOHAB,
	FT_ENCODING_ADOBE_STANDARD  = FT_MAKE_TAG('A','D','O','B'),
	FT_ENCODING_ADOBE_EXPERT    = FT_MAKE_TAG('A','D','B','E'),
	FT_ENCODING_ADOBE_CUSTOM    = FT_MAKE_TAG('A','D','B','C'),
	FT_ENCODING_ADOBE_LATIN_1   = FT_MAKE_TAG('l','a','t','1'),
	FT_ENCODING_OLD_LATIN_2     = FT_MAKE_TAG('l','a','t','2'),
	FT_ENCODING_APPLE_ROMAN     = FT_MAKE_TAG('a','r','m','n'),
}

struct FT_CharMapRec{
	FT_Face face;
	FT_Encoding encoding;
	ushort platform_id;
	ushort encoding_id;
}

struct FT_Face_InternalRec;
alias FT_Face_Internal = FT_Face_InternalRec*;

struct FT_FaceRec{
	FT_Long num_faces;
	FT_Long face_index;
	FT_Long face_flags;
	FT_Long style_flags;
	FT_Long num_glyphs;
	char* family_name;
	char* style_name;
	int num_fixed_sizes;
	FT_Bitmap_Size* available_sizes;
	int num_charmaps;
	FT_CharMap* charmaps;
	FT_Generic generic;
	FT_BBox bbox;
	ushort units_per_EM;
	short ascender;
	short descender;
	short height;
	short max_advance_width;
	short max_advance_height;
	short underline_position;
	short underline_thickness;
	FT_GlyphSlot glyph;
	FT_Size size;
	FT_CharMap charmap;
	FT_Driver driver;
	FT_Memory memory;
	FT_Stream stream;
	FT_ListRec sizes_list;
	FT_Generic autohint;
	void* extensions;
	FT_Face_Internal internal;
}

enum: uint{
	FT_FACE_FLAG_SCALABLE          = 1 << 0,
	FT_FACE_FLAG_FIXED_SIZES       = 1 << 1,
	FT_FACE_FLAG_FIXED_WIDTH       = 1 << 2,
	FT_FACE_FLAG_SFNT              = 1 << 3,
	FT_FACE_FLAG_HORIZONTAL        = 1 << 4,
	FT_FACE_FLAG_VERTICAL          = 1 << 5,
	FT_FACE_FLAG_KERNING           = 1 << 6,
	FT_FACE_FLAG_FAST_GLYPHS       = 1 << 7,
	FT_FACE_FLAG_MULTIPLE_MASTERS  = 1 << 8,
	FT_FACE_FLAG_GLYPH_NAMES       = 1 << 9,
	FT_FACE_FLAG_EXTERNAL_STREAM   = 1 << 10,
	FT_FACE_FLAG_HINTER            = 1 << 11,
	FT_FACE_FLAG_CID_KEYED         = 1 << 12,
	FT_FACE_FLAG_TRICKY            = 1 << 13,
	FT_FACE_FLAG_COLOR             = 1 << 14,
	FT_FACE_FLAG_COLOUR            = FT_FACE_FLAG_COLOR,
}
static if(ftSupport >= FTSupport.v2_9)
enum: uint{
	FT_FACE_FLAG_VARIATION         = 1 << 15,
}
static if(ftSupport >= FTSupport.v2_12)
enum: uint{
	FT_FACE_FLAG_SVG               = 1 << 16,
	FT_FACE_FLAG_SBIX              = 1 << 17,
	FT_FACE_FLAG_SBIX_OVERLAY      = 1 << 18,
}

pragma(inline, true) nothrow @nogc pure @safe{
	bool FT_HAS_HORIZONTAL(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_HORIZONTAL) != 0; }
	bool FT_HAS_VERTICAL(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_VERTICAL) != 0; }
	bool FT_HAS_KERNING(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_KERNING) != 0; }
	bool FT_IS_SCALABLE(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_SCALABLE) != 0; }
	bool FT_IS_SFNT(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_SFNT) != 0; }
	bool FT_IS_FIXED_WIDTH(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_FIXED_WIDTH) != 0; }
	bool FT_HAS_FIXED_SIZES(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_FIXED_SIZES) != 0; }
	bool FT_HAS_FAST_GLYPHS(FT_Face face){ return false; }
	bool FT_HAS_GLYPH_NAMES(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_GLYPH_NAMES) != 0; }
	bool FT_HAS_MULTIPLE_MASTERS(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_MULTIPLE_MASTERS) != 0; }
	bool FT_IS_CID_KEYED(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_CID_KEYED) != 0; }
	bool FT_IS_TRICKY(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_TRICKY) != 0; }
	bool FT_HAS_COLOR(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_COLOR) != 0; }
	alias FT_HAS_COLOUR = FT_HAS_COLOR;
	
	static if(ftSupport >= FTSupport.v2_7){
		bool FT_IS_NAMED_INSTANCE(FT_Face face){ return (face.face_index & 0x7FFF0000L) != 0; }
	}
	static if(ftSupport >= FTSupport.v2_9){
		bool FT_IS_VARIATION(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_VARIATION) != 0; }
	}
	static if(ftSupport >= FTSupport.v2_12){
		bool FT_HAS_SVG(FT_Face face){ return (face.face_flags & FT_FACE_FLAG_SVG) != 0; }
	}
}

enum{
	FT_STYLE_FLAG_ITALIC    = 1 << 0,
	FT_STYLE_FLAG_BOLD      = 1 << 1,
}

struct FT_Size_InternalRec;
alias FT_Size_Internal = FT_Size_InternalRec*;

struct FT_Size_Metrics{
	ushort x_ppem;
	ushort y_ppem;
	
	FT_Fixed x_scale;
	FT_Fixed y_scale;
	
	FT_Pos ascender;
	FT_Pos descender;
	FT_Pos height;
	FT_Pos max_advance;
}

struct FT_SizeRec{
	FT_Face face;
	FT_Generic generic;
	FT_Size_Metrics metrics;
	FT_Size_Internal internal;
}

struct FT_SubGlyphRec;
alias FT_SubGlyph = FT_SubGlyphRec*;

struct FT_Slot_InternalRec;
alias FT_Slot_Internal = FT_Slot_InternalRec*;

struct FT_GlyphSlotRec{
	FT_Library library;
	FT_Face face;
	FT_GlyphSlot next;
	
	// Renamed from "reserved" in Freetype 2.10
	uint glyph_index;
	
	FT_Generic generic;
	FT_Glyph_Metrics metrics;
	FT_Fixed linearHoriAdvance;
	FT_Fixed linearVertAdvance;
	FT_Vector advance;
	FT_Glyph_Format format;
	FT_Bitmap bitmap;
	int bitmap_left;
	int bitmap_top;
	FT_Outline outline;
	uint num_subglyphs;
	FT_SubGlyph subglyphs;
	void* control_data;
	c_long control_len;
	FT_Pos lsb_delta;
	FT_Pos rsb_delta;
	void* other;
	FT_Slot_Internal internal;
}

enum: uint{
	FT_OPEN_MEMORY    = 0x1,
	FT_OPEN_STREAM    = 0x2,
	FT_OPEN_PATHNAME  = 0x4,
	FT_OPEN_DRIVER    = 0x8,
	FT_OPEN_PARAMS    = 0x10,
}

struct FT_Parameter{
	FT_ULong tag;
	FT_Pointer data;
}

struct FT_Open_Args{
	uint flags;
	const(ubyte)* memory_base;
	FT_Long memory_size;
	char* pathname;
	FT_Stream stream;
	FT_Module driver;
	int num_params;
	FT_Parameter* params;
}

alias FT_Size_Request_Type = int;
enum: FT_Size_Request_Type{
	FT_SIZE_REQUEST_TYPE_NOMINAL,
	FT_SIZE_REQUEST_TYPE_REAL_DIM,
	FT_SIZE_REQUEST_TYPE_BBOX,
	FT_SIZE_REQUEST_TYPE_CELL,
	FT_SIZE_REQUEST_TYPE_SCALES,
	FT_SIZE_REQUEST_TYPE_MAX,
}

struct FT_Size_RequestRec{
	FT_Size_Request_Type type;
	FT_Long width;
	FT_Long height;
	uint horiResolution;
	uint vertResolution;
}

alias FT_Size_Request = FT_Size_RequestRec*;

enum: uint{
	FT_LOAD_DEFAULT                        = 0x0,
	FT_LOAD_NO_SCALE                       = 1 << 0,
	FT_LOAD_NO_HINTING                     = 1 << 1,
	FT_LOAD_RENDER                         = 1 << 2,
	FT_LOAD_NO_BITMAP                      = 1 << 3,
	FT_LOAD_VERTICAL_LAYOUT                = 1 << 4,
	FT_LOAD_FORCE_AUTOHINT                 = 1 << 5,
	FT_LOAD_CROP_BITMAP                    = 1 << 6,
	FT_LOAD_PEDANTIC                       = 1 << 7,
	FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH    = 1 << 9,
	FT_LOAD_NO_RECURSE                     = 1 << 10,
	FT_LOAD_IGNORE_TRANSFORM               = 1 << 11,
	FT_LOAD_MONOCHROME                     = 1 << 12,
	FT_LOAD_LINEAR_DESIGN                  = 1 << 13,
	FT_LOAD_NO_AUTOHINT                    = 1 << 15,
	FT_LOAD_COLOR                          = 1 << 20,
	FT_LOAD_COLOUR                         = FT_LOAD_COLOR,
	FT_LOAD_COMPUTE_METRICS                = 1 << 21,
}
static if(ftSupport >= FTSupport.v2_7)
enum: uint{
	FT_LOAD_BITMAP_METRICS_ONLY            = 1 << 22,
}
static if(ftSupport >= FTSupport.v2_12)
enum: uint{
	FT_LOAD_ADVANCE_ONLY                   = 1 << 8,
	FT_LOAD_SVG_ONLY                       = 1 << 23,
}
static if(ftSupport >= FTSupport.v2_13)
enum: uint{
	FT_LOAD_NO_SVG                         = 1 << 24,
}

FT_Render_Mode FT_LOAD_TARGET_MODE(uint x) nothrow @nogc pure @safe{
	return cast(FT_Render_Mode)((x >> 16) & 15);
}

alias FT_Render_Mode = uint;
enum: FT_Render_Mode{
	FT_RENDER_MODE_NORMAL  = 0,
	FT_RENDER_MODE_LIGHT   = 1,
	FT_RENDER_MODE_MONO    = 2,
	FT_RENDER_MODE_LCD     = 3,
	FT_RENDER_MODE_LCD_V   = 4,
}
static if(ftSupport >= FTSupport.v2_11)
enum: FT_Render_Mode{
	FT_RENDER_MODE_SDF     = 5,
	FT_RENDER_MODE_MAX     = 6,
}
else
enum: FT_Render_Mode{
	FT_RENDER_MODE_MAX     = 5,
}

enum FREETYPE_MAJOR = ftSupport.major;
enum FREETYPE_MINOR = ftSupport.minor;
enum FREETYPE_PATCH = ftSupport.patch;

enum{
	FT_LOAD_TARGET_NORMAL  = (FT_RENDER_MODE_NORMAL  & 15) << 16,
	FT_LOAD_TARGET_LIGHT   = (FT_RENDER_MODE_LIGHT   & 15) << 16,
	FT_LOAD_TARGET_MONO    = (FT_RENDER_MODE_MONO    & 15) << 16,
	FT_LOAD_TARGET_LCD     = (FT_RENDER_MODE_LCD     & 15) << 16,
	FT_LOAD_TARGET_LCD_V   = (FT_RENDER_MODE_LCD_V   & 15) << 16,
}

enum FT_Kerning_Mode{
	FT_KERNING_DEFAULT   = 0,
	FT_KERNING_UNFITTED  = 1,
	FT_KERNING_UNSCALE   = 2,
}

enum{
	FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS      = 0x1,
	FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES  = 0x2,
	FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID    = 0x4,
	FT_SUBGLYPH_FLAG_SCALE               = 0x8,
	FT_SUBGLYPH_FLAG_XY_SCALE            = 0x40,
	FT_SUBGLYPH_FLAG_2X2                 = 0x80,
	FT_SUBGLYPH_FLAG_USE_MY_METRICS      = 0x200,
}

static if(ftSupport <= FTSupport.v2_10){
	struct FT_LayerIterator{
		uint num_layers;
		uint layer;
		ubyte* p;
	}
}

enum: ushort{
	FT_FSTYPE_INSTALLABLE_EMBEDDING         = 0x0000,
	FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING  = 0x0002,
	FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING   = 0x0004,
	FT_FSTYPE_EDITABLE_EMBEDDING            = 0x0008,
	FT_FSTYPE_NO_SUBSETTING                 = 0x0100,
	FT_FSTYPE_BITMAP_EMBEDDING_ONLY         = 0x0200,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Init_FreeType}, q{FT_Library* aLibrary}},
		{q{FT_Error}, q{FT_Done_FreeType}, q{FT_Library library}},
		{q{FT_Error}, q{FT_New_Face}, q{FT_Library library, const(char)* filePathName, FT_Long faceIndex, FT_Face* aFace}},
		{q{FT_Error}, q{FT_New_Memory_Face}, q{FT_Library library, const(ubyte)* fileBase, FT_Long fileSize, FT_Long faceIndex, FT_Face* aFace}},
		{q{FT_Error}, q{FT_Open_Face}, q{FT_Library library, const(FT_Open_Args)* args, FT_Long faceIndex, FT_Face* aFace}},
		{q{FT_Error}, q{FT_Attach_File}, q{FT_Face face, const(char)* filePathName}},
		{q{FT_Error}, q{FT_Attach_Stream}, q{FT_Face face, const(FT_Open_Args)* parameters}},
		{q{FT_Error}, q{FT_Reference_Face}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Done_Face}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Select_Size}, q{FT_Face face, int strikeIndex}},
		{q{FT_Error}, q{FT_Request_Size}, q{FT_Face face, FT_Size_Request req}},
		{q{FT_Error}, q{FT_Set_Char_Size}, q{FT_Face face, FT_F26Dot6 charWidth, FT_F26Dot6 charHeight, uint horzResolution, uint vertResolution}},
		{q{FT_Error}, q{FT_Set_Pixel_Sizes}, q{FT_Face face, uint pixelWidth, uint pixelHeight}},
		{q{FT_Error}, q{FT_Load_Glyph}, q{FT_Face face, uint glyphIndex, int loadFlags}},
		{q{FT_Error}, q{FT_Load_Char}, q{FT_Face face, uint charCode, int loadFlags}},
		{q{void}, q{FT_Set_Transform}, q{FT_Face face, FT_Matrix* matrix, FT_Vector* delta}},
		{q{FT_Error}, q{FT_Render_Glyph}, q{FT_GlyphSlot slot, FT_Render_Mode renderMode}},
		{q{FT_Error}, q{FT_Get_Kerning}, q{FT_Face face, uint leftGlyph, uint rightGlyph, uint kernMode, FT_Vector* aKerning}},
		{q{FT_Error}, q{FT_Get_Track_Kerning}, q{FT_Face face, FT_Fixed pointSize, int degree, FT_Fixed* aKerning}},
		{q{FT_Error}, q{FT_Get_Glyph_Name}, q{FT_Face face, uint glyphIndex, FT_Pointer buffer, uint bufferMax}},
		{q{const(char)*}, q{FT_Get_Postscript_Name}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Select_Charmap}, q{FT_Face face, FT_Encoding encoding}},
		{q{FT_Error}, q{FT_Set_Charmap}, q{FT_Face face, FT_CharMap charMap}},
		{q{int}, q{FT_Get_Charmap_Index}, q{FT_CharMap charMap}},
		{q{uint}, q{FT_Get_Char_Index}, q{FT_Face face, FT_ULong charCode}},
		{q{FT_ULong}, q{FT_Get_First_Char}, q{FT_Face face, uint* aGIndex}},
		{q{FT_ULong}, q{FT_Get_Next_Char}, q{FT_Face face, FT_ULong charCode, uint* aGIndex}},
		{q{uint}, q{FT_Get_Name_Index}, q{FT_Face face, const(char)* glyphName}},
		{q{FT_Error}, q{FT_Get_SubGlyph_Info}, q{FT_GlyphSlot glyph, uint subIndex, int* pIndex, uint* pFlags, int* pArg1, int* pArg2, FT_Matrix* pTransform}},
		{q{ushort}, q{FT_Get_FSType_Flags}, q{FT_Face face}},
		{q{uint}, q{FT_Face_GetCharVariantIndex}, q{FT_Face face, FT_ULong charCode, FT_ULong variantSelector}},
		{q{int}, q{FT_Face_GetCharVariantIsDefault}, q{FT_Face face, FT_ULong charCode, FT_ULong variantSelector}},
		{q{uint*}, q{FT_Face_GetVariantSelectors}, q{FT_Face face}},
		{q{uint*}, q{FT_Face_GetVariantsOfChar}, q{FT_Face face, FT_ULong charCode}},
		{q{uint*}, q{FT_Face_GetCharsOfVariant}, q{FT_Face face, FT_ULong variantSelector}},
		{q{FT_Long}, q{FT_MulDiv}, q{FT_Long a, FT_Long b, FT_Long c}},
		{q{FT_Long}, q{FT_MulFix}, q{FT_Long a, FT_Long b}},
		{q{FT_Long}, q{FT_DivFix}, q{FT_Long a, FT_Long b}},
		{q{FT_Fixed}, q{FT_RoundFix}, q{FT_Fixed a}},
		{q{FT_Fixed}, q{FT_CeilFix}, q{FT_Fixed a}},
		{q{FT_Fixed}, q{FT_FloorFix}, q{FT_Fixed a}},
		{q{void}, q{FT_Vector_Transform}, q{FT_Vector* vector, FT_Matrix* matrix}},
		{q{void}, q{FT_Library_Version}, q{FT_Library library, int* aMajor, int* aMinor, int* aPatch}},
		{q{FT_Bool}, q{FT_Face_CheckTrueTypePatents}, q{FT_Face face}},
		{q{FT_Bool}, q{FT_Face_SetUnpatentedHinting}, q{FT_Face face, FT_Bool value}},
	];
	if(ftSupport >= FTSupport.v2_8){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Face_Properties}, q{FT_Face face, uint numProperties, FT_Parameter* properties}},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_11){
		FnBind[] add = [
			{q{void}, q{FT_Get_Transform}, q{FT_Face face, FT_Matrix* matrix, FT_Vector* delta}},
		];
		ret ~= add;
	}else{
		// Moved to ftcolor.h in 2.11
		FnBind[] add = [
			{q{FT_Bool}, q{FT_Get_Color_Glyph_Layer}, q{FT_Face face, uint baseGlyph, uint* aGlyphIndex, uint* aColourIndex, FT_LayerIterator* iterator}},
		];
		ret ~= add;
	}
	return ret;
}()));
