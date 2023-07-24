/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.t1tables;

import bindbc.freetype.config;

import ft;
import ft.image;
import ft.types;

struct PS_FontInfoRec{
	char* _version;
	char* notice;
	char* full_name;
	char* family_name;
	char* weight;
	FT_Long italic_angle;
	FT_Bool is_fixed_pitch;
	short underline_position;
	ushort underline_thickness;
}

alias PS_FontInfo = PS_FontInfoRec*;

struct PS_PrivateRec{
	int unique_id;
	int lenIV;
	ubyte num_blue_values;
	ubyte num_other_blues;
	ubyte num_family_blues;
	ubyte num_family_other_blues;
	short[14] blue_values;
	short[10] other_blues;
	short[14] family_blues;
	short[10] family_other_blues;
	FT_Fixed blue_scale;
	int blue_shift;
	int blue_fuzz;
	ushort[1] standard_width;
	ushort[1] standard_height;
	ubyte num_snap_widths;
	ubyte num_snap_heights;
	FT_Bool force_bold;
	FT_Bool round_stem_up;
	short[13] snap_widths;
	short[13] snap_heights;
	FT_Fixed expansion_factor;
	FT_Long language_group;
	FT_Long password;
	short[2] min_feature;
}

alias PS_Private = PS_PrivateRec*;

alias T1_Blend_Flags = int;
enum{
	T1_BLEND_UNDERLINE_POSITION = 0,
	T1_BLEND_UNDERLINE_THICKNESS,
	T1_BLEND_ITALIC_ANGLE,
	T1_BLEND_BLUE_VALUES,
	T1_BLEND_OTHER_BLUES,
	T1_BLEND_STANDARD_WIDTH,
	T1_BLEND_STANDARD_HEIGHT,
	T1_BLEND_STEM_SNAP_WIDTHS,
	T1_BLEND_STEM_SNAP_HEIGHTS,
	T1_BLEND_BLUE_SCALE,
	T1_BLEND_BLUE_SHIFT,
	T1_BLEND_FAMILY_BLUES,
	T1_BLEND_FAMILY_OTHER_BLUES,
	T1_BLEND_FORCE_BOLD,
	T1_BLEND_MAX
}

enum T1_MAX_MM_DESIGNS = 16;
enum T1_MAX_MM_AXIS = 4;
enum T1_MAX_MM_MAP_POINTS = 20;

struct PS_DesignMapRec{
	ubyte num_points;
	FT_Long* design_points;
	FT_Fixed* blend_points;
}

alias PS_DesignMap = PS_DesignMapRec*;

struct PS_BlendRec{
	uint num_designs;
	uint num_axis;
	char*[T1_MAX_MM_AXIS] axis_names;
	FT_Fixed*[T1_MAX_MM_DESIGNS] design_pos;
	PS_DesignMapRec[T1_MAX_MM_AXIS] design_map;
	FT_Fixed* weight_vector;
	FT_Fixed* default_weight_vector;
	PS_FontInfo[T1_MAX_MM_DESIGNS+1] font_infos;
	PS_Private[T1_MAX_MM_DESIGNS+1] privates;
	FT_ULong blend_bitflags;
	FT_BBox*[T1_MAX_MM_DESIGNS+1] bboxes;
	uint[T1_MAX_MM_DESIGNS] default_design_vector;
	uint num_default_design_vector;
}

alias PS_Blend = PS_BlendRec*;

struct CID_FaceDictRec{
	PS_PrivateRec private_dict;
	uint len_buildchar;
	FT_Fixed forcebold_threshold;
	FT_Pos stroke_width;
	FT_Fixed expansion_factor;
	ubyte paint_type;
	ubyte font_type;
	FT_Matrix font_matrix;
	FT_Vector font_offset;
	uint num_subrs;
	FT_ULong subrmap_offset;
	int sd_bytes;
}

alias CID_FaceDict = CID_FaceDictRec*;

struct CID_FaceInfoRec{
	char* cid_font_name;
	FT_Fixed cid_version;
	int cid_font_type;
	char* registry;
	char* ordering;
	int supplement;
	PS_FontInfoRec font_info;
	FT_BBox font_bbox;
	FT_ULong uid_base;
	int num_xuid;
	FT_ULong[16] xuid;
	FT_ULong cidmap_offset;
	int fd_bytes;
	int gd_bytes;
	FT_ULong cid_count;
	int num_dicts;
	CID_FaceDict font_dicts;
	FT_ULong data_offset;
}

alias CID_FaceInfo = CID_FaceInfoRec*;

alias T1_EncodingType = int;
enum: T1_EncodingType{
	T1_ENCODING_TYPE_NONE       = 0,
	T1_ENCODING_TYPE_ARRAY      = 1,
	T1_ENCODING_TYPE_STANDARD   = 2,
	T1_ENCODING_TYPE_ISOLATIN1  = 3,
	T1_ENCODING_TYPE_EXPERT     = 4,
}

alias PS_Dict_Keys = int;
enum: PS_Dict_Keys{
	PS_DICT_FONT_TYPE,
	PS_DICT_FONT_MATRIX,
	PS_DICT_FONT_BBOX,
	PS_DICT_PAINT_TYPE,
	PS_DICT_FONT_NAME,
	PS_DICT_UNIQUE_ID,
	PS_DICT_NUM_CHAR_STRINGS,
	PS_DICT_CHAR_STRING_KEY,
	PS_DICT_CHAR_STRING,
	PS_DICT_ENCODING_TYPE,
	PS_DICT_ENCODING_ENTRY,
	
	PS_DICT_NUM_SUBRS,
	PS_DICT_SUBR,
	PS_DICT_STD_HW,
	PS_DICT_STD_VW,
	PS_DICT_NUM_BLUE_VALUES,
	PS_DICT_BLUE_VALUE,
	PS_DICT_BLUE_FUZZ,
	PS_DICT_NUM_OTHER_BLUES,
	PS_DICT_OTHER_BLUE,
	PS_DICT_NUM_FAMILY_BLUES,
	PS_DICT_FAMILY_BLUE,
	PS_DICT_NUM_FAMILY_OTHER_BLUES,
	PS_DICT_FAMILY_OTHER_BLUE,
	PS_DICT_BLUE_SCALE,
	PS_DICT_BLUE_SHIFT,
	PS_DICT_NUM_STEM_SNAP_H,
	PS_DICT_STEM_SNAP_H,
	PS_DICT_NUM_STEM_SNAP_V,
	PS_DICT_STEM_SNAP_V,
	PS_DICT_FORCE_BOLD,
	PS_DICT_RND_STEM_UP,
	PS_DICT_MIN_FEATURE,
	PS_DICT_LEN_IV,
	PS_DICT_PASSWORD,
	PS_DICT_LANGUAGE_GROUP,
	
	PS_DICT_VERSION,
	PS_DICT_NOTICE,
	PS_DICT_FULL_NAME,
	PS_DICT_FAMILY_NAME,
	PS_DICT_WEIGHT,
	PS_DICT_IS_FIXED_PITCH,
	PS_DICT_UNDERLINE_POSITION,
	PS_DICT_UNDERLINE_THICKNESS,
	PS_DICT_FS_TYPE,
	PS_DICT_ITALIC_ANGLE,
	
	PS_DICT_MAX = PS_DICT_ITALIC_ANGLE
}

static if(staticBinding){
	extern(C) nothrow @nogc{
		int FT_Has_PS_Glyph_Names(FT_Face face);
		FT_Error FT_Get_PS_Font_Info(FT_Face face,PS_FontInfoRec* afont_info);
		FT_Error FT_Get_PS_Font_Private(FT_Face face,PS_PrivateRec* afont_private);
		FT_Long FT_Get_PS_Font_Value(FT_Face face, PS_Dict_Keys* key, uint idx, void* value, FT_Long value_len);
	}
}else{
	extern(C) nothrow @nogc{
		alias da_FT_Has_PS_Glyph_Names = int function(FT_Face face);
		alias da_FT_Get_PS_Font_Info = FT_Error function(FT_Face face,PS_FontInfoRec* afont_info);
		alias da_FT_Get_PS_Font_Private = FT_Error function(FT_Face face,PS_PrivateRec* afont_private);
		alias da_FT_Get_PS_Font_Value = FT_Long function(FT_Face face, PS_Dict_Keys* key, uint idx, void* value, FT_Long value_len);
	}
	__gshared{
		da_FT_Has_PS_Glyph_Names FT_Has_PS_Glyph_Names;
		da_FT_Get_PS_Font_Info FT_Get_PS_Font_Info;
		da_FT_Get_PS_Font_Private FT_Get_PS_Font_Private;
		da_FT_Get_PS_Font_Value FT_Get_PS_Font_Value;
	}
}