/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.t1tables;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.image;
import ft.types;

struct PS_FontInfoRec{
	char* version_;
	alias _version = version_;
	char* notice;
	char* fullName;
	char* familyName;
	alias full_name = fullName;
	alias family_name = familyName;
	char* weight;
	FT_Long italicAngle;
	FT_Bool isFixedPitch;
	short underlinePosition;
	ushort underlineThickness;
	alias italic_angle = italicAngle;
	alias is_fixed_pitch = isFixedPitch;
	alias underline_position = underlinePosition;
	alias underline_thickness = underlineThickness;
}

alias PS_FontInfo = PS_FontInfoRec*;

struct PS_PrivateRec{
	int uniqueID;
	alias unique_id = uniqueID;
	int lenIV;
	ubyte numBlueValues;
	ubyte numOtherBlues;
	ubyte numFamilyBlues;
	ubyte numFamilyOtherBlues;
	short[14] blueValues;
	short[10] otherBlues;
	short[14] familyBlues;
	short[10] familyOtherBlues;
	FT_Fixed blueScale;
	int blueShift;
	int blueFuzz;
	ushort[1] standardWidth;
	ushort[1] standardHeight;
	ubyte numSnapWidths;
	ubyte numSnapHeights;
	FT_Bool forceBold;
	FT_Bool roundStemUp;
	short[13] snapWidths;
	short[13] snapHeights;
	FT_Fixed expansionFactor;
	FT_Long languageGroup;
	alias num_blue_values = numBlueValues;
	alias num_other_blues = numOtherBlues;
	alias num_family_blues = numFamilyBlues;
	alias num_family_other_blues = numFamilyOtherBlues;
	alias blue_values = blueValues;
	alias other_blues = otherBlues;
	alias family_blues = familyBlues;
	alias family_other_blues = familyOtherBlues;
	alias blue_scale = blueScale;
	alias blue_shift = blueShift;
	alias blue_fuzz = blueFuzz;
	alias standard_width = standardWidth;
	alias standard_height = standardHeight;
	alias num_snap_widths = numSnapWidths;
	alias num_snap_heights = numSnapHeights;
	alias force_bold = forceBold;
	alias round_stem_up = roundStemUp;
	alias snap_widths = snapWidths;
	alias snap_heights = snapHeights;
	alias expansion_factor = expansionFactor;
	alias language_group = languageGroup;
	FT_Long password;
	short[2] minFeature;
	alias min_feature = minFeature;
}

alias PS_Private = PS_PrivateRec*;

mixin(makeEnumBind(q{T1_Blend_Flags}, aliases: [q{T1_Blend}], members: (){
	EnumMember[] ret = [
		{{q{underlinePosition},   q{T1_BLEND_UNDERLINE_POSITION}},   q{0}},
		{{q{underlineThickness},  q{T1_BLEND_UNDERLINE_THICKNESS}},  q{1}},
		{{q{italicAngle},         q{T1_BLEND_ITALIC_ANGLE}},         q{2}},
		{{q{blueValues},          q{T1_BLEND_BLUE_VALUES}},          q{3}},
		{{q{otherBlues},          q{T1_BLEND_OTHER_BLUES}},          q{4}},
		{{q{standardWidth},       q{T1_BLEND_STANDARD_WIDTH}},       q{5}},
		{{q{standardHeight},      q{T1_BLEND_STANDARD_HEIGHT}},      q{6}},
		{{q{stemSnapWidths},      q{T1_BLEND_STEM_SNAP_WIDTHS}},     q{7}},
		{{q{stemSnapHeights},     q{T1_BLEND_STEM_SNAP_HEIGHTS}},    q{8}},
		{{q{blueScale},           q{T1_BLEND_BLUE_SCALE}},           q{9}},
		{{q{blueShift},           q{T1_BLEND_BLUE_SHIFT}},           q{10}},
		{{q{familyBlues},         q{T1_BLEND_FAMILY_BLUES}},         q{11}},
		{{q{familyOtherBlues},    q{T1_BLEND_FAMILY_OTHER_BLUES}},   q{12}},
		{{q{forceBold},           q{T1_BLEND_FORCE_BOLD}},           q{13}},
		{{q{max_},                q{T1_BLEND_MAX}},                  q{14}},
	];
	return ret;
}()));

enum T1_MAX_MM_DESIGNS = 16;
enum T1_MAX_MM_AXIS = 4;
enum T1_MAX_MM_MAP_POINTS = 20;

struct PS_DesignMapRec{
	ubyte numPoints;
	FT_Long* designPoints;
	FT_Fixed* blendPoints;
	alias num_points = numPoints;
	alias design_points = designPoints;
	alias blend_points = blendPoints;
}

alias PS_DesignMap = PS_DesignMapRec*;

struct PS_BlendRec{
	uint numDesigns;
	uint numAxis;
	char*[T1_MAX_MM_AXIS] axisNames;
	FT_Fixed*[T1_MAX_MM_DESIGNS] designPos;
	PS_DesignMapRec[T1_MAX_MM_AXIS] designMap;
	FT_Fixed* weightVector;
	FT_Fixed* defaultWeightVector;
	PS_FontInfo[T1_MAX_MM_DESIGNS+1] fontInfos;
	PS_Private[T1_MAX_MM_DESIGNS+1] privates;
	FT_ULong blendBitflags;
	alias num_designs = numDesigns;
	alias num_axis = numAxis;
	alias axis_names = axisNames;
	alias design_pos = designPos;
	alias design_map = designMap;
	alias weight_vector = weightVector;
	alias default_weight_vector = defaultWeightVector;
	alias font_infos = fontInfos;
	alias blend_bitflags = blendBitflags;
	FT_BBox*[T1_MAX_MM_DESIGNS+1] bboxes;
	uint[T1_MAX_MM_DESIGNS] defaultDesignVector;
	uint numDefaultDesignVector;
	alias default_design_vector = defaultDesignVector;
	alias num_default_design_vector = numDefaultDesignVector;
}

alias PS_Blend = PS_BlendRec*;

struct CID_FaceDictRec{
	PS_PrivateRec privateDict;
	uint lenBuildChar;
	FT_Fixed forceBoldThreshold;
	FT_Pos strokeWidth;
	FT_Fixed expansionFactor;
	ubyte paintType;
	ubyte fontType;
	FT_Matrix fontMatrix;
	FT_Vector fontOffset;
	uint numSubrs;
	FT_ULong subrMapOffset;
	int sdBytes;
	alias private_dict = privateDict;
	alias len_buildchar = lenBuildChar;
	alias forcebold_threshold = forceBoldThreshold;
	alias stroke_width = strokeWidth;
	alias expansion_factor = expansionFactor;
	alias paint_type = paintType;
	alias font_type = fontType;
	alias font_matrix = fontMatrix;
	alias font_offset = fontOffset;
	alias num_subrs = numSubrs;
	alias subrmap_offset = subrMapOffset;
	alias sd_bytes = sdBytes;
}

alias CID_FaceDict = CID_FaceDictRec*;

struct CID_FaceInfoRec{
	char* cidFontName;
	FT_Fixed cidVersion;
	int cidFontType;
	alias cid_font_name = cidFontName;
	alias cid_version = cidVersion;
	alias cid_font_type = cidFontType;
	char* registry;
	char* ordering;
	int supplement;
	PS_FontInfoRec fontInfo;
	FT_BBox fontBBox;
	FT_ULong uidBase;
	int numXUID;
	alias font_info = fontInfo;
	alias font_bbox = fontBBox;
	alias uid_base = uidBase;
	alias num_xuid = numXUID;
	FT_ULong[16] xuid;
	FT_ULong cidMapOffset;
	int fdBytes;
	int gdBytes;
	FT_ULong cidCount;
	int numDicts;
	CID_FaceDict fontDicts;
	FT_ULong dataOffset;
	alias cidmap_offset = cidMapOffset;
	alias fd_bytes = fdBytes;
	alias gd_bytes = gdBytes;
	alias cid_count = cidCount;
	alias num_dicts = numDicts;
	alias font_dicts = fontDicts;
	alias data_offset = dataOffset;
}

alias CID_FaceInfo = CID_FaceInfoRec*;

mixin(makeEnumBind(q{T1_EncodingType}, members: (){
	EnumMember[] ret = [
		{{q{none},       q{T1_ENCODING_TYPE_NONE}},       q{0}},
		{{q{array},      q{T1_ENCODING_TYPE_ARRAY}},      q{1}},
		{{q{standard},   q{T1_ENCODING_TYPE_STANDARD}},   q{2}},
		{{q{isoLatin1},  q{T1_ENCODING_TYPE_ISOLATIN1}},  q{3}},
		{{q{expert},     q{T1_ENCODING_TYPE_EXPERT}},     q{4}},
	];
	return ret;
}()));

mixin(makeEnumBind(q{PS_Dict_Keys}, aliases: [q{PS_Dict}], members: (){
	EnumMember[] ret = [
		{{q{fontType},             q{PS_DICT_FONT_TYPE}}},
		{{q{fontMatrix},           q{PS_DICT_FONT_MATRIX}}},
		{{q{fontBbox},             q{PS_DICT_FONT_BBOX}}},
		{{q{paintType},            q{PS_DICT_PAINT_TYPE}}},
		{{q{fontName},             q{PS_DICT_FONT_NAME}}},
		{{q{uniqueID},             q{PS_DICT_UNIQUE_ID}}},
		{{q{numCharStrings},       q{PS_DICT_NUM_CHAR_STRINGS}}},
		{{q{charStringKey},        q{PS_DICT_CHAR_STRING_KEY}}},
		{{q{charString},           q{PS_DICT_CHAR_STRING}}},
		{{q{encodingType},         q{PS_DICT_ENCODING_TYPE}}},
		{{q{encodingEntry},        q{PS_DICT_ENCODING_ENTRY}}},
		
		{{q{numSubrs},             q{PS_DICT_NUM_SUBRS}}},
		{{q{subr},                 q{PS_DICT_SUBR}}},
		{{q{stdHW},                q{PS_DICT_STD_HW}}},
		{{q{stdVW},                q{PS_DICT_STD_VW}}},
		{{q{numBlueValues},        q{PS_DICT_NUM_BLUE_VALUES}}},
		{{q{blueValue},            q{PS_DICT_BLUE_VALUE}}},
		{{q{blueFuzz},             q{PS_DICT_BLUE_FUZZ}}},
		{{q{numOtherBlues},        q{PS_DICT_NUM_OTHER_BLUES}}},
		{{q{otherBlue},            q{PS_DICT_OTHER_BLUE}}},
		{{q{numFamilyBlues},       q{PS_DICT_NUM_FAMILY_BLUES}}},
		{{q{familyBlue},           q{PS_DICT_FAMILY_BLUE}}},
		{{q{numFamilyOtherBlues},  q{PS_DICT_NUM_FAMILY_OTHER_BLUES}}},
		{{q{familyOtherBlue},      q{PS_DICT_FAMILY_OTHER_BLUE}}},
		{{q{blueScale},            q{PS_DICT_BLUE_SCALE}}},
		{{q{blueShift},            q{PS_DICT_BLUE_SHIFT}}},
		{{q{numStemSnapH},         q{PS_DICT_NUM_STEM_SNAP_H}}},
		{{q{stemSnapH},            q{PS_DICT_STEM_SNAP_H}}},
		{{q{numStemSnapV},         q{PS_DICT_NUM_STEM_SNAP_V}}},
		{{q{stemSnapV},            q{PS_DICT_STEM_SNAP_V}}},
		{{q{forceBold},            q{PS_DICT_FORCE_BOLD}}},
		{{q{rndStemUp},            q{PS_DICT_RND_STEM_UP}}},
		{{q{minFeature},           q{PS_DICT_MIN_FEATURE}}},
		{{q{lenIV},                q{PS_DICT_LEN_IV}}},
		{{q{password},             q{PS_DICT_PASSWORD}}},
		{{q{languageGroup},        q{PS_DICT_LANGUAGE_GROUP}}},
		
		{{q{version_},             q{PS_DICT_VERSION}}},
		{{q{notice},               q{PS_DICT_NOTICE}}},
		{{q{fullName},             q{PS_DICT_FULL_NAME}}},
		{{q{familyName},           q{PS_DICT_FAMILY_NAME}}},
		{{q{weight},               q{PS_DICT_WEIGHT}}},
		{{q{isFixedPitch},         q{PS_DICT_IS_FIXED_PITCH}}},
		{{q{underlinePosition},    q{PS_DICT_UNDERLINE_POSITION}}},
		{{q{underlineThickness},   q{PS_DICT_UNDERLINE_THICKNESS}}},
		{{q{fsType},               q{PS_DICT_FS_TYPE}}},
		{{q{italicAngle},          q{PS_DICT_ITALIC_ANGLE}}, aliases: [{c: q{PS_DICT_MAX}}]},
	];
	return ret;
}()));

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{FT_Has_PS_Glyph_Names}, q{FT_Face face}},
		{q{FT_Error}, q{FT_Get_PS_Font_Info}, q{FT_Face face, PS_FontInfoRec* aFontInfo}},
		{q{FT_Error}, q{FT_Get_PS_Font_Private}, q{FT_Face face, PS_PrivateRec* aFontPrivate}},
		{q{FT_Long}, q{FT_Get_PS_Font_Value}, q{FT_Face face, PS_Dict_Keys* key, uint idx, void* value, FT_Long valueLen}},
	];
	return ret;
}()));
