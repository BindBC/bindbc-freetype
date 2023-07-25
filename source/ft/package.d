/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft;

import bindbc.freetype.config;

import bindbc.common.types: c_long;
import ft.image;
import ft.system;
import ft.types;
import ft.color;

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

pragma(inline,true) nothrow @nogc pure @safe{
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
	FT_OPEN_MEMORY      = 0x1,
	FT_OPEN_STREAM      = 0x2,
	FT_OPEN_PATHNAME    = 0x4,
	FT_OPEN_DRIVER      = 0x8,
	FT_OPEN_PARAMS      = 0x10,
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

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Init_FreeType(FT_Library* alibrary);
		FT_Error FT_Done_FreeType(FT_Library library);
		FT_Error FT_New_Face(FT_Library library, const(char)* filepathname, FT_Long face_index, FT_Face* aface);
		FT_Error FT_New_Memory_Face(FT_Library library, const(ubyte)* file_base, FT_Long file_size, FT_Long face_index, FT_Face* aface);
		FT_Error FT_Open_Face(FT_Library library, const(FT_Open_Args)* args, FT_Long face_index, FT_Face* aface);
		FT_Error FT_Attach_File(FT_Face face, const(char)* filepathname);
		FT_Error FT_Attach_Stream(FT_Face face, const(FT_Open_Args)* parameters);
		FT_Error FT_Reference_Face(FT_Face face);
		FT_Error FT_Done_Face(FT_Face face);
		FT_Error FT_Select_Size(FT_Face face, int strike_index);
		FT_Error FT_Request_Size(FT_Face face, FT_Size_Request req);
		FT_Error FT_Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, uint horz_resolution, uint vert_resolution);
		FT_Error FT_Set_Pixel_Sizes(FT_Face face, uint pixel_width, uint pixel_height);
		FT_Error FT_Load_Glyph(FT_Face face, uint glyph_index, int load_flags);
		FT_Error FT_Load_Char(FT_Face face, uint char_code, int load_flags);
		void FT_Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
		FT_Error FT_Render_Glyph(FT_GlyphSlot slot, FT_Render_Mode render_mode);
		FT_Error FT_Get_Kerning(FT_Face face, uint left_glyph, uint right_glyph, uint kern_mode, FT_Vector* akerning);
		FT_Error FT_Get_Track_Kerning(FT_Face face, FT_Fixed point_size, int degree, FT_Fixed* akerning);
		FT_Error FT_Get_Glyph_Name(FT_Face face, uint glyph_index, FT_Pointer buffer, uint buffer_max);
		const(char)* FT_Get_Postscript_Name(FT_Face face);
		FT_Error FT_Select_Charmap(FT_Face face, FT_Encoding encoding);
		FT_Error FT_Set_Charmap(FT_Face face, FT_CharMap charmap);
		int FT_Get_Charmap_Index(FT_CharMap charmap);
		uint FT_Get_Char_Index(FT_Face face, FT_ULong charcode);
		FT_ULong FT_Get_First_Char(FT_Face face, uint* agindex);
		FT_ULong FT_Get_Next_Char(FT_Face face, FT_ULong char_code, uint* agindex);
		uint FT_Get_Name_Index(FT_Face face, const(char)* glyph_name);
		FT_Error FT_Get_SubGlyph_Info(FT_GlyphSlot glyph, uint sub_index, int* p_index, uint* p_flags, int* p_arg1, int* p_arg2, FT_Matrix* p_transform);
		ushort FT_Get_FSType_Flags(FT_Face face);
		uint FT_Face_GetCharVariantIndex(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
		int FT_Face_GetCharVariantIsDefault(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
		uint* FT_Face_GetVariantSelectors(FT_Face face);
		uint* FT_Face_GetVariantsOfChar(FT_Face face, FT_ULong charcode);
		uint* FT_Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector);
		FT_Long FT_MulDiv(FT_Long a, FT_Long b, FT_Long c);
		FT_Long FT_MulFix(FT_Long a, FT_Long b);
		FT_Long FT_DivFix(FT_Long a,FT_Long b);
		FT_Fixed FT_RoundFix(FT_Fixed a);
		FT_Fixed FT_CeilFix(FT_Fixed a);
		FT_Fixed FT_FloorFix(FT_Fixed a);
		void FT_Vector_Transform(FT_Vector* vector, FT_Matrix* matrix);
		void FT_Library_Version(FT_Library library, int* amajor, int* aminor, int* apatch);
		FT_Bool FT_Face_CheckTrueTypePatents(FT_Face face);
		FT_Bool FT_Face_SetUnpatentedHinting(FT_Face face, FT_Bool value);
		static if(ftSupport >= FTSupport.v2_8){
			FT_Error FT_Face_Properties(FT_Face face, uint num_properties, FT_Parameter* properties);
		}
		static if(ftSupport >= FTSupport.v2_11){
			void FT_Get_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
		}else{
			// Moved to ftcolor.h in 2.11
			FT_Bool FT_Get_Color_Glyph_Layer(FT_Face face, uint base_glyph, uint* aglyph_index, uint* acolor_index, FT_LayerIterator* iterator);
		}
	}
}else{
	extern(C) __gshared nothrow @nogc{
		FT_Error function(FT_Library* alibrary) FT_Init_FreeType;
		FT_Error function(FT_Library library) FT_Done_FreeType;
		FT_Error function(FT_Library library, const(char)* filepathname, FT_Long face_index, FT_Face* aface) FT_New_Face;
		FT_Error function(FT_Library library, const(ubyte)* file_base, FT_Long file_size, FT_Long face_index, FT_Face* aface) FT_New_Memory_Face;
		FT_Error function(FT_Library library, const(FT_Open_Args)* args, FT_Long face_index, FT_Face* aface) FT_Open_Face;
		FT_Error function(FT_Face face, const(char)* filepathname) FT_Attach_File;
		FT_Error function(FT_Face face, FT_Open_Args* parameters) FT_Attach_Stream;
		FT_Error function(FT_Face face) FT_Reference_Face;
		FT_Error function(FT_Face face) FT_Done_Face;
		FT_Error function(FT_Face face, int strike_index) FT_Select_Size;
		FT_Error function(FT_Face face, FT_Size_Request req) FT_Request_Size;
		FT_Error function(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, uint horz_resolution, uint vert_resolution) FT_Set_Char_Size;
		FT_Error function(FT_Face face, uint pixel_width, uint pixel_height) FT_Set_Pixel_Sizes;
		FT_Error function(FT_Face face, uint glyph_index, int load_flags) FT_Load_Glyph;
		FT_Error function(FT_Face face, uint char_code, int load_flags) FT_Load_Char;
		void function(FT_Face face, FT_Matrix* matrix, FT_Vector* delta) FT_Set_Transform;
		FT_Error function(FT_GlyphSlot slot, FT_Render_Mode render_mode) FT_Render_Glyph;
		FT_Error function(FT_Face face, uint left_glyph, uint right_glyph, uint kern_mode, FT_Vector* akerning) FT_Get_Kerning;
		FT_Error function(FT_Face face, FT_Fixed point_size, int degree, FT_Fixed* akerning) FT_Get_Track_Kerning;
		FT_Error function(FT_Face face, uint glyph_index, FT_Pointer buffer, uint buffer_max) FT_Get_Glyph_Name;
		const(char)* function(FT_Face face) FT_Get_Postscript_Name;
		FT_Error function(FT_Face face, FT_Encoding encoding) FT_Select_Charmap;
		FT_Error function(FT_Face face, FT_CharMap charmap) FT_Set_Charmap;
		int function(FT_CharMap charmap) FT_Get_Charmap_Index;
		uint function(FT_Face face, FT_ULong charcode) FT_Get_Char_Index;
		FT_ULong function(FT_Face face, uint* agindex) FT_Get_First_Char;
		FT_ULong function(FT_Face face, FT_ULong char_code, uint* agindex) FT_Get_Next_Char;
		uint function(FT_Face face, const(char)* glyph_name) FT_Get_Name_Index;
		FT_Error function(FT_GlyphSlot glyph, uint sub_index, int* p_index, uint* p_flags, int* p_arg1, int* p_arg2, FT_Matrix* p_transform) FT_Get_SubGlyph_Info;
		ushort function(FT_Face face) FT_Get_FSType_Flags;
		uint function(FT_Face face, FT_ULong charcode, FT_ULong variantSelector) FT_Face_GetCharVariantIndex;
		int function(FT_Face face, FT_ULong charcode, FT_ULong variantSelector) FT_Face_GetCharVariantIsDefault;
		uint* function(FT_Face face) FT_Face_GetVariantSelectors;
		uint* function(FT_Face face, FT_ULong charcode) FT_Face_GetVariantsOfChar;
		uint* function(FT_Face face, FT_ULong variantSelector) FT_Face_GetCharsOfVariant;
		FT_Long function(FT_Long a, FT_Long b, FT_Long c) FT_MulDiv;
		FT_Long function(FT_Long a, FT_Long b) FT_MulFix;
		FT_Long function(FT_Long a, FT_Long b) FT_DivFix;
		FT_Fixed function(FT_Fixed a) FT_RoundFix;
		FT_Fixed function(FT_Fixed a) FT_CeilFix;
		FT_Fixed function(FT_Fixed a) FT_FloorFix;
		void function(FT_Vector* vector, FT_Matrix* matrix) FT_Vector_Transform;
		void function(FT_Library library, int* amajor, int* aminor, int* apatch) FT_Library_Version;
		FT_Bool function(FT_Face face) FT_Face_CheckTrueTypePatents;
		FT_Bool function(FT_Face face, FT_Bool value) FT_Face_SetUnpatentedHinting;
		
		static if(ftSupport >= FTSupport.v2_8){
			alias pFT_Face_Properties = FT_Error function(FT_Face face, uint num_properties, FT_Parameter* properties);
		}
		static if(ftSupport >= FTSupport.v2_11){
			alias pFT_Get_Transform = void function(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
		}else{
			// Moved to ftcolor.h in 2.11
			alias pFT_Get_Color_Glyph_Layer = FT_Bool function(FT_Face face, uint base_glyph, uint* aglyph_index, uint* acolor_index, FT_LayerIterator* iterator);
		}
	}
	__gshared{
		static if(ftSupport >= FTSupport.v2_8){
			pFT_Face_Properties FT_Face_Properties;
		}
		static if(ftSupport >= FTSupport.v2_11){
			pFT_Get_Transform FT_Get_Transform;
		}else{
			// Moved to ftcolor.h in 2.11
			pFT_Get_Color_Glyph_Layer FT_Get_Color_Glyph_Layer;
		}
	}
}
