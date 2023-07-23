
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.freetype;

import core.stdc.config;
import bindbc.freetype.config;
import bindbc.freetype.bind.ftimage,
       bindbc.freetype.bind.ftsystem,
       bindbc.freetype.bind.fttypes;

struct FT_Glyph_Metrics {
    FT_Pos width;
    FT_Pos height;
    FT_Pos horiBearingX;
    FT_Pos horiBearingY;
    FT_Pos horiAdvance;
    FT_Pos vertBearingX;
    FT_Pos vertBearingY;
    FT_Pos vertAdvance;
}

struct FT_Bitmap_Size {
    FT_Short height;
    FT_Short width;
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
enum : FT_Tag {
    FT_ENCODING_NONE = 0,
    FT_ENCODING_MS_SYMBOL = FT_MAKE_TAG('s','y','m','b'),
    FT_ENCODING_UNICODE = FT_MAKE_TAG('u','n','i','c'),
    FT_ENCODING_SJIS = FT_MAKE_TAG('s','j','i','s'),
    FT_ENCODING_PRC = FT_MAKE_TAG('g','b',' ',' '),
    FT_ENCODING_BIG5 = FT_MAKE_TAG('b','i','g','5'),
    FT_ENCODING_WANSUNG = FT_MAKE_TAG('w','a','n','s'),
    FT_ENCODING_JOHAB = FT_MAKE_TAG('j','o','h','a'),
    FT_ENCODING_GB2312 = FT_ENCODING_PRC,
    FT_ENCODING_MS_SJIS = FT_ENCODING_SJIS,
    FT_ENCODING_MS_GB2312 = FT_ENCODING_PRC,
    FT_ENCODING_MS_BIG5 = FT_ENCODING_BIG5,
    FT_ENCODING_MS_WANSUNG = FT_ENCODING_WANSUNG,
    FT_ENCODING_MS_JOHAB = FT_ENCODING_JOHAB,
    FT_ENCODING_ADOBE_STANDARD = FT_MAKE_TAG('A','D','O','B'),
    FT_ENCODING_ADOBE_EXPERT = FT_MAKE_TAG('A','D','B','E'),
    FT_ENCODING_ADOBE_CUSTOM = FT_MAKE_TAG('A','D','B','C'),
    FT_ENCODING_ADOBE_LATIN_1 = FT_MAKE_TAG('l','a','t','1'),
    FT_ENCODING_OLD_LATIN_2 = FT_MAKE_TAG('l','a','t','2'),
    FT_ENCODING_APPLE_ROMAN = FT_MAKE_TAG('a','r','m','n'),
}

struct FT_CharMapRec {
    FT_Face face;
    FT_Encoding encoding;
    FT_UShort platform_id;
    FT_UShort encoding_id;
}

struct FT_Face_InternalRec;
alias FT_Face_Internal = FT_Face_InternalRec*;

struct FT_FaceRec {
    FT_Long num_faces;
    FT_Long face_index;
    FT_Long face_flags;
    FT_Long style_flags;
    FT_Long num_glyphs;
    FT_String* family_name;
    FT_String* style_name;
    FT_Int num_fixed_sizes;
    FT_Bitmap_Size* available_sizes;
    FT_Int num_charmaps;
    FT_CharMap* charmaps;
    FT_Generic generic;
    FT_BBox bbox;
    FT_UShort units_per_EM;
    FT_Short ascender;
    FT_Short descender;
    FT_Short height;
    FT_Short max_advance_width;
    FT_Short max_advance_height;
    FT_Short underline_position;
    FT_Short underline_thickness;
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

enum : uint {
    FT_FACE_FLAG_SCALABLE = 1 << 0,
    FT_FACE_FLAG_FIXED_SIZES = 1 << 1,
    FT_FACE_FLAG_FIXED_WIDTH = 1 << 2,
    FT_FACE_FLAG_SFNT = 1 << 3,
    FT_FACE_FLAG_HORIZONTAL = 1 << 4,
    FT_FACE_FLAG_VERTICAL = 1 << 5,
    FT_FACE_FLAG_KERNING = 1 << 6,
    FT_FACE_FLAG_FAST_GLYPHS = 1 << 7,
    FT_FACE_FLAG_MULTIPLE_MASTERS = 1 << 8,
    FT_FACE_FLAG_GLYPH_NAMES = 1 << 9,
    FT_FACE_FLAG_EXTERNAL_STREAM = 1 << 10,
    FT_FACE_FLAG_HINTER = 1 << 11,
    FT_FACE_FLAG_CID_KEYED = 1 << 12,
    FT_FACE_FLAG_TRICKY = 1 << 13,
    FT_FACE_FLAG_COLOR = 1 << 14,

    // Added in Freetype 2.9
    FT_FACE_FLAG_VARIATION = 1 << 15,
}

@nogc nothrow {
    bool FT_HAS_HORIZONTAL(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_HORIZONTAL) != 0;
    }

    bool FT_HAS_VERTICAL(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_VERTICAL) != 0;
    }

    bool FT_HAS_KERNING(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_KERNING) != 0;
    }

    bool FT_IS_SCALABLE(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_SCALABLE) != 0;
    }

    bool FT_IS_SFNT(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_SFNT) != 0;
    }

    bool FT_IS_FIXED_WIDTH(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_FIXED_WIDTH) != 0;
    }

    bool FT_HAS_FIXED_SIZES(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_FIXED_SIZES) != 0;
    }

    bool FT_HAS_FAST_GLYPHS(FT_Face face) {
        return false;
    }

    bool FT_HAS_GLYPH_NAMES(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_GLYPH_NAMES) != 0;
    }

    bool FT_HAS_MULTIPLE_MASTERS(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_MULTIPLE_MASTERS) != 0;
    }

    bool FT_IS_CID_KEYED(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_CID_KEYED) != 0;
    }

    bool FT_IS_TRICKY(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_TRICKY) != 0;
    }

    bool FT_HAS_COLOR(FT_Face face) {
        return (face.face_flags & FT_FACE_FLAG_COLOR) != 0;
    }

    static if(ftSupport >= FTSupport.ft27) {
        bool FT_IS_NAMED_INSTANCE(FT_Face face) {
            return (face.face_index & 0x7FFF0000L) != 0;
        }
    }

    static if(ftSupport >= FTSupport.ft29) {
        bool FT_IS_VARIATION(FT_Face face) {
            return (face.face_flags & FT_FACE_FLAG_VARIATION) != 0;
        }
    }
}

enum {
    FT_STYLE_FLAG_ITALIC          = 1 << 0,
    FT_STYLE_FLAG_BOLD            = 1 << 1,
}

struct FT_Size_InternalRec;
alias FT_Size_Internal = FT_Size_InternalRec*;

struct FT_Size_Metrics {
    FT_UShort x_ppem;
    FT_UShort y_ppem;

    FT_Fixed x_scale;
    FT_Fixed y_scale;

    FT_Pos ascender;
    FT_Pos descender;
    FT_Pos height;
    FT_Pos max_advance;
}

struct FT_SizeRec {
    FT_Face face;
    FT_Generic generic;
    FT_Size_Metrics metrics;
    FT_Size_Internal internal;
}

struct FT_SubGlyphRec;
struct FT_Slot_InternalRec;
alias FT_SubGlyph = FT_SubGlyphRec*;
alias FT_Slot_Internal = FT_Slot_InternalRec*;

struct FT_GlyphSlotRec {
    FT_Library library;
    FT_Face face;
    FT_GlyphSlot next;

    // Renamed from "reserved" in Freetype 2.10
    FT_UInt glyph_index;

    FT_Generic generic;
    FT_Glyph_Metrics metrics;
    FT_Fixed linearHoriAdvance;
    FT_Fixed linearVertAdvance;
    FT_Vector advance;
    FT_Glyph_Format format;
    FT_Bitmap bitmap;
    FT_Int bitmap_left;
    FT_Int bitmap_top;
    FT_Outline outline;
    FT_UInt num_subglyphs;
    FT_SubGlyph subglyphs;
    void* control_data;
    c_long control_len;
    FT_Pos lsb_delta;
    FT_Pos rsb_delta;
    void* other;
    FT_Slot_Internal internal;
}

enum : uint {
    FT_OPEN_MEMORY           = 0x1,
    FT_OPEN_STREAM           = 0x2,
    FT_OPEN_PATHNAME         = 0x4,
    FT_OPEN_DRIVER           = 0x8,
    FT_OPEN_PARAMS           = 0x10,
}

struct FT_Parameter {
    FT_ULong tag;
    FT_Pointer data;
}

struct FT_Open_Args {
    FT_UInt flags;
    const(FT_Byte)* memory_base;
    FT_Long memory_size;
    FT_String* pathname;
    FT_Stream stream;
    FT_Module driver;
    FT_Int num_params;
    FT_Parameter* params;
}

alias FT_Size_Request_Type = int;
enum  {
    FT_SIZE_REQUEST_TYPE_NOMINAL,
    FT_SIZE_REQUEST_TYPE_REAL_DIM,
    FT_SIZE_REQUEST_TYPE_BBOX,
    FT_SIZE_REQUEST_TYPE_CELL,
    FT_SIZE_REQUEST_TYPE_SCALES,
    FT_SIZE_REQUEST_TYPE_MAX
}

struct FT_Size_RequestRec {
    FT_Size_Request_Type type;
    FT_Long width;
    FT_Long height;
    FT_UInt horiResolution;
    FT_UInt vertResolution;
}

alias FT_Size_Request = FT_Size_RequestRec*;

static if(ftSupport >= FTSupport.ft27) {
    enum : uint {
        FT_LOAD_DEFAULT = 0x0,
        FT_LOAD_NO_SCALE = 1 << 0,
        FT_LOAD_NO_HINTING = 1 << 1,
        FT_LOAD_RENDER = 1 << 2,
        FT_LOAD_NO_BITMAP = 1 << 3,
        FT_LOAD_VERTICAL_LAYOUT = 1 << 4,
        FT_LOAD_FORCE_AUTOHINT = 1 << 5,
        FT_LOAD_CROP_BITMAP = 1 << 6,
        FT_LOAD_PEDANTIC = 1 << 7,
        FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 1 << 9,
        FT_LOAD_NO_RECURSE = 1 << 10,
        FT_LOAD_IGNORE_TRANSFORM = 1 << 11,
        FT_LOAD_MONOCHROME = 1 << 12,
        FT_LOAD_LINEAR_DESIGN = 1 << 13,
        FT_LOAD_NO_AUTOHINT = 1 << 15,
        FT_LOAD_COLOR = 1 << 20,
        FT_LOAD_COMPUTE_METRICS = 1 << 21,
        FT_LOAD_BITMAP_METRICS_ONLY = 1 << 22,
    }
}
else {
    enum : uint {
        FT_LOAD_DEFAULT = 0x0,
        FT_LOAD_NO_SCALE = 1 << 0,
        FT_LOAD_NO_HINTING = 1 << 1,
        FT_LOAD_RENDER = 1 << 2,
        FT_LOAD_NO_BITMAP = 1 << 3,
        FT_LOAD_VERTICAL_LAYOUT = 1 << 4,
        FT_LOAD_FORCE_AUTOHINT = 1 << 5,
        FT_LOAD_CROP_BITMAP = 1 << 6,
        FT_LOAD_PEDANTIC = 1 << 7,
        FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 1 << 9,
        FT_LOAD_NO_RECURSE = 1 << 10,
        FT_LOAD_IGNORE_TRANSFORM = 1 << 11,
        FT_LOAD_MONOCHROME = 1 << 12,
        FT_LOAD_LINEAR_DESIGN = 1 << 13,
        FT_LOAD_NO_AUTOHINT = 1 << 15,
        FT_LOAD_COLOR = 1 << 20,
        FT_LOAD_COMPUTE_METRICS = 1 << 21,
    }
}

@nogc FT_Render_Mode FT_LOAD_TARGET_MODE(uint x) nothrow {
    return cast(FT_Render_Mode)((x >> 16) & 15);
}

alias FT_Render_Mode = uint;
static if(ftSupport >= FTSupport.ft211) {
    enum {
        FT_RENDER_MODE_NORMAL = 0,
        FT_RENDER_MODE_LIGHT,
        FT_RENDER_MODE_MONO,
        FT_RENDER_MODE_LCD,
        FT_RENDER_MODE_LCD_V,
        FT_RENDER_MODE_SDF,
        FT_RENDER_MODE_MAX,
    }
} else {
    enum {
        FT_RENDER_MODE_NORMAL = 0,
        FT_RENDER_MODE_LIGHT,
        FT_RENDER_MODE_MONO,
        FT_RENDER_MODE_LCD,
        FT_RENDER_MODE_LCD_V,
        FT_RENDER_MODE_MAX
    }
}

enum {
    FT_LOAD_TARGET_NORMAL = (FT_RENDER_MODE_NORMAL & 15) << 16,
    FT_LOAD_TARGET_LIGHT = (FT_RENDER_MODE_LIGHT & 15) << 16,
    FT_LOAD_TARGET_MONO = (FT_RENDER_MODE_MONO & 15) << 16,
    FT_LOAD_TARGET_LCD = (FT_RENDER_MODE_LCD & 15) << 16,
    FT_LOAD_TARGET_LCD_V = (FT_RENDER_MODE_LCD_V & 15) << 16,
}

enum FT_Kerning_Mode {
    FT_KERNING_DEFAULT = 0,
    FT_KERNING_UNFITTED,
    FT_KERNING_UNSCALED
}

enum {
    FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS = 1,
    FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = 2,
    FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID = 4,
    FT_SUBGLYPH_FLAG_SCALE = 8,
    FT_SUBGLYPH_FLAG_XY_SCALE = 0x40,
    FT_SUBGLYPH_FLAG_2X2 = 0x80,
    FT_SUBGLYPH_FLAG_USE_MY_METRICS = 0x200,
}

static if(ftSupport <= FTSupport.ft210) {
    struct FT_LayerIterator {
        FT_UInt num_layers;
        FT_UInt layer;
        FT_Byte* p;
    }
}

enum {
    FT_FSTYPE_INSTALLABLE_EMBEDDING = 0x0000,
    FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = 0x0002,
    FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING = 0x0004,
    FT_FSTYPE_EDITABLE_EMBEDDING = 0x0008,
    FT_FSTYPE_NO_SUBSETTING = 0x0100,
    FT_FSTYPE_BITMAP_EMBEDDING_ONLY = 0x0200,
}

static if(staticBinding) {
	extern(C) @nogc nothrow {
        FT_Error FT_Init_FreeType(FT_Library* alibrary);
        FT_Error FT_Done_FreeType(FT_Library library);
        FT_Error FT_New_Face(FT_Library library, const(char)* filepathname, FT_Long face_index, FT_Face* aface);
        FT_Error FT_New_Memory_Face(FT_Library library, const(FT_Byte)* file_base, FT_Long file_size, FT_Long face_index, FT_Face* aface);
        FT_Error FT_Open_Face(FT_Library library, const(FT_Open_Args)* args, FT_Long face_index, FT_Face* aface);
        FT_Error FT_Attach_File(FT_Face face, const(char)* filepathname);
        FT_Error FT_Attach_Stream(FT_Face face, FT_Open_Args* parameters);
        FT_Error FT_Reference_Face(FT_Face face);
        FT_Error FT_Done_Face(FT_Face face);
        FT_Error FT_Select_Size(FT_Face face, FT_Int strike_index);
        FT_Error FT_Request_Size(FT_Face face, FT_Size_Request req);
        FT_Error FT_Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);
        FT_Error FT_Set_Pixel_Sizes(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height);
        FT_Error FT_Load_Glyph(FT_Face face, FT_UInt glyph_index, FT_Int32 load_flags);
        FT_Error FT_Load_Char(FT_Face face, FT_UInt char_code, FT_Int32 load_flags);
        void FT_Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
        FT_Error FT_Render_Glyph(FT_GlyphSlot slot, FT_Render_Mode render_mode);
        FT_Error FT_Get_Kerning(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_UInt kern_mode, FT_Vector* akerning);
        FT_Error FT_Get_Track_Kerning(FT_Face face, FT_Fixed point_size, FT_Int degree, FT_Fixed* akerning);
        FT_Error FT_Get_Glyph_Name(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max);
        const(char)* FT_Get_Postscript_Name(FT_Face face);
        FT_Error FT_Select_Charmap(FT_Face face, FT_Encoding encoding);
        FT_Error FT_Set_Charmap(FT_Face face, FT_CharMap charmap);
        FT_Int FT_Get_Charmap_Index(FT_CharMap charmap);
        FT_UInt FT_Get_Char_Index(FT_Face face, FT_ULong charcode);
        FT_ULong FT_Get_First_Char(FT_Face face, FT_UInt* agindex);
        FT_ULong FT_Get_Next_Char(FT_Face face, FT_ULong char_code, FT_UInt* agindex);
        FT_UInt FT_Get_Name_Index(FT_Face face, const(FT_String)* glyph_name);
        FT_Error FT_Get_SubGlyph_Info(FT_GlyphSlot glyph, FT_UInt sub_index, FT_Int* p_index, FT_UInt* p_flags, FT_Int* p_arg1, FT_Int* p_arg2, FT_Matrix* p_transform);
        FT_UShort FT_Get_FSType_Flags(FT_Face face);
        FT_UInt FT_Face_GetCharVariantIndex(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
        FT_Int FT_Face_GetCharVariantIsDefault(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
        FT_UInt32* FT_Face_GetVariantSelectors(FT_Face face);
        FT_UInt32* FT_Face_GetVariantsOfChar(FT_Face face, FT_ULong charcode);
        FT_UInt32* FT_Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector);
        FT_Long FT_MulDiv(FT_Long a, FT_Long b, FT_Long c);
        FT_Long FT_MulFix(FT_Long a, FT_Long b);
        FT_Long FT_DivFix(FT_Long a,FT_Long b);
        FT_Fixed FT_RoundFix(FT_Fixed a);
        FT_Fixed FT_CeilFix(FT_Fixed a);
        FT_Fixed FT_FloorFix(FT_Fixed a);
        void FT_Vector_Transform(FT_Vector* vector, FT_Matrix* matrix);
        void FT_Library_Version(FT_Library library, FT_Int* amajor, FT_Int* aminor, FT_Int* apatch);
        FT_Bool FT_Face_CheckTrueTypePatents(FT_Face face);
        FT_Bool FT_Face_SetUnpatentedHinting(FT_Face face, FT_Bool value);
    }
    static if(ftSupport >= FTSupport.ft28) {
        FT_Error FT_Face_Properties(FT_Face face, FT_UInt num_properties, FT_Parameter* properties);
    }
    static if(ftSupport >= FTSupport.ft211) {
        void FT_Get_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Init_FreeType = FT_Error function(FT_Library* alibrary);
        alias pFT_Done_FreeType = FT_Error function(FT_Library library);
        alias pFT_New_Face = FT_Error function(FT_Library library, const(char)* filepathname, FT_Long face_index, FT_Face* aface);
        alias pFT_New_Memory_Face = FT_Error function(FT_Library library, const(FT_Byte)* file_base, FT_Long file_size, FT_Long face_index, FT_Face* aface);
        alias pFT_Open_Face = FT_Error function(FT_Library library, const(FT_Open_Args)* args, FT_Long face_index, FT_Face* aface);
        alias pFT_Attach_File = FT_Error function(FT_Face face, const(char)* filepathname);
        alias pFT_Attach_Stream = FT_Error function(FT_Face face, FT_Open_Args* parameters);
        alias pFT_Reference_Face = FT_Error function(FT_Face face);
        alias pFT_Done_Face = FT_Error function(FT_Face face);
        alias pFT_Select_Size = FT_Error function(FT_Face face, FT_Int strike_index);
        alias pFT_Request_Size = FT_Error function(FT_Face face, FT_Size_Request req);
        alias pFT_Set_Char_Size = FT_Error function(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);
        alias pFT_Set_Pixel_Sizes = FT_Error function(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height);
        alias pFT_Load_Glyph = FT_Error function(FT_Face face, FT_UInt glyph_index, FT_Int32 load_flags);
        alias pFT_Load_Char = FT_Error function(FT_Face face, FT_UInt char_code, FT_Int32 load_flags);
        alias pFT_Set_Transform = void function(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
        alias pFT_Render_Glyph = FT_Error function(FT_GlyphSlot slot, FT_Render_Mode render_mode);
        alias pFT_Get_Kerning = FT_Error function(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_UInt kern_mode, FT_Vector* akerning);
        alias pFT_Get_Track_Kerning = FT_Error function(FT_Face face, FT_Fixed point_size, FT_Int degree, FT_Fixed* akerning);
        alias pFT_Get_Glyph_Name = FT_Error function(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max);
        alias pFT_Get_Postscript_Name = const(char)* function(FT_Face face);
        alias pFT_Select_Charmap = FT_Error function(FT_Face face, FT_Encoding encoding);
        alias pFT_Set_Charmap = FT_Error function(FT_Face face, FT_CharMap charmap);
        alias pFT_Get_Charmap_Index = FT_Int function(FT_CharMap charmap);
        alias pFT_Get_Char_Index = FT_UInt function(FT_Face face, FT_ULong charcode);
        alias pFT_Get_First_Char = FT_ULong function(FT_Face face, FT_UInt* agindex);
        alias pFT_Get_Next_Char = FT_ULong function(FT_Face face, FT_ULong char_code, FT_UInt* agindex);
        alias pFT_Get_Name_Index = FT_UInt function(FT_Face face, const(FT_String)* glyph_name);
        alias pFT_Get_SubGlyph_Info = FT_Error function(FT_GlyphSlot glyph, FT_UInt sub_index, FT_Int* p_index, FT_UInt* p_flags, FT_Int* p_arg1, FT_Int* p_arg2, FT_Matrix* p_transform);
        alias pFT_Get_FSType_Flags = FT_UShort function(FT_Face face);
        alias pFT_Face_GetCharVariantIndex = FT_UInt function(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
        alias pFT_Face_GetCharVariantIsDefault = FT_Int function(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);;
        alias pFT_Face_GetVariantSelectors = FT_UInt32* function(FT_Face face);
        alias pFT_Face_GetVariantsOfChar = FT_UInt32* function(FT_Face face, FT_ULong charcode);
        alias pFT_Face_GetCharsOfVariant = FT_UInt32* function(FT_Face face, FT_ULong variantSelector);
        alias pFT_MulDiv = FT_Long function(FT_Long a, FT_Long b, FT_Long c);
        alias pFT_MulFix = FT_Long function(FT_Long a, FT_Long b);
        alias pFT_DivFix = FT_Long function(FT_Long a, FT_Long b);
        alias pFT_RoundFix = FT_Fixed function(FT_Fixed a);
        alias pFT_CeilFix = FT_Fixed function(FT_Fixed a);
        alias pFT_FloorFix = FT_Fixed function(FT_Fixed a);
        alias pFT_Vector_Transform = void function(FT_Vector* vector, FT_Matrix* matrix);
        alias pFT_Library_Version = void function(FT_Library library, FT_Int* amajor, FT_Int* aminor, FT_Int* apatch);
        alias pFT_Face_CheckTrueTypePatents = FT_Bool function(FT_Face face);
        alias pFT_Face_SetUnpatentedHinting = FT_Bool function(FT_Face face, FT_Bool value);

        static if(ftSupport >= FTSupport.ft28) {
            alias pFT_Face_Properties = FT_Error function(FT_Face face, FT_UInt num_properties, FT_Parameter* properties);
        }
        static if(ftSupport <= FTSupport.ft210) {
            // Moved to ftcolor.h in 2.11
            alias pFT_Get_Color_Glyph_Layer = FT_Bool function(FT_Face face, FT_UInt base_glyph, FT_UInt* aglyph_index, FT_UInt* acolor_index, FT_LayerIterator* iterator);
        }
        static if(ftSupport >= FTSupport.ft211) {
            alias pFT_Get_Transform = void function(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
        }
    }

    __gshared {
        pFT_Init_FreeType FT_Init_FreeType;
        pFT_Done_FreeType FT_Done_FreeType;
        pFT_New_Face FT_New_Face;
        pFT_New_Memory_Face FT_New_Memory_Face;
        pFT_Open_Face FT_Open_Face;
        pFT_Attach_File FT_Attach_File;
        pFT_Attach_Stream FT_Attach_Stream;
        pFT_Reference_Face FT_Reference_Face;
        pFT_Done_Face FT_Done_Face;
        pFT_Select_Size FT_Select_Size;
        pFT_Request_Size FT_Request_Size;
        pFT_Set_Char_Size FT_Set_Char_Size;
        pFT_Set_Pixel_Sizes FT_Set_Pixel_Sizes;
        pFT_Load_Glyph FT_Load_Glyph;
        pFT_Load_Char FT_Load_Char;
        pFT_Set_Transform FT_Set_Transform;
        pFT_Render_Glyph FT_Render_Glyph;
        pFT_Get_Kerning FT_Get_Kerning;
        pFT_Get_Track_Kerning FT_Get_Track_Kerning;
        pFT_Get_Glyph_Name FT_Get_Glyph_Name;
        pFT_Get_Postscript_Name FT_Get_Postscript_Name;
        pFT_Select_Charmap FT_Select_Charmap;
        pFT_Set_Charmap FT_Set_Charmap;
        pFT_Get_Charmap_Index FT_Get_Charmap_Index;
        pFT_Get_Char_Index FT_Get_Char_Index;
        pFT_Get_First_Char FT_Get_First_Char;
        pFT_Get_Next_Char FT_Get_Next_Char;
        pFT_Get_Name_Index FT_Get_Name_Index;
        pFT_Get_SubGlyph_Info FT_Get_SubGlyph_Info;
        pFT_Get_FSType_Flags FT_Get_FSType_Flags;
        pFT_Face_GetCharVariantIndex FT_Face_GetCharVariantIndex;
        pFT_Face_GetCharVariantIsDefault FT_Face_GetCharVariantIsDefault;
        pFT_Face_GetVariantSelectors FT_Face_GetVariantSelectors;
        pFT_Face_GetVariantsOfChar FT_Face_GetVariantsOfChar;
        pFT_Face_GetCharsOfVariant FT_Face_GetCharsOfVariant;
        pFT_MulDiv FT_MulDiv;
        pFT_MulFix FT_MulFix;
        pFT_DivFix FT_DivFix;
        pFT_RoundFix FT_RoundFix;
        pFT_CeilFix FT_CeilFix;
        pFT_FloorFix FT_FloorFix;
        pFT_Vector_Transform FT_Vector_Transform;
        pFT_Library_Version FT_Library_Version;
        pFT_Face_CheckTrueTypePatents FT_Face_CheckTrueTypePatents;
        pFT_Face_SetUnpatentedHinting FT_Face_SetUnpatentedHinting;

        static if(ftSupport >= FTSupport.ft28) {
            pFT_Face_Properties FT_Face_Properties;
        }
        static if(ftSupport <= FTSupport.ft210) {
            // Moved to ftcolor.h in 2.11
            pFT_Get_Color_Glyph_Layer FT_Get_Color_Glyph_Layer;
        }
        static if(ftSupport >= FTSupport.ft211) {
            pFT_Get_Transform FT_Get_Transform;
        }
    }
}