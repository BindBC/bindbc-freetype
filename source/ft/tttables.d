/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.tttables;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

struct TT_Header{
	FT_Fixed Table_Version;
	FT_Fixed Font_Revision;
	FT_Long CheckSum_Adjust;
	FT_Long Magic_Number;
	ushort Flags;
	ushort Units_Per_EM;
	static if(ftSupport >= FTSupport.v2_10){
		FT_ULong[2] Created;
		FT_ULong[2] Modified;
	}else{
		FT_Long[2] Created;
		FT_Long[2] Modified;
	}
	short xMin;
	short yMin;
	short xMax;
	short yMax;
	ushort Mac_Style;
	ushort Lowest_Rec_PPEM;
	short Font_Direction;
	short Index_To_Loc_Format;
	short Glyph_Data_Format;
}

struct TT_HoriHeader{
	FT_Fixed Version;
	short Ascender;
	short Descender;
	short Line_Gap;
	ushort advance_Width_Max;
	short min_Left_Side_Bearing;
	short min_Right_Side_Bearing;
	short xMax_Extent;
	short caret_Slope_Rise;
	short caret_Slope_Run;
	short caret_Offset;
	short[4] Reserved;
	short metric_Data_Format;
	ushort number_Of_HMetrics;
	void* long_metrics;
	void* short_metrics;
}

struct TT_VertHeader{
	FT_Fixed Version;
	short Ascender;
	short Descender;
	short Line_Gap;
	ushort advance_Height_Max;
	short min_Top_Side_Bearing;
	short min_Bottom_Side_Bearing;
	short yMax_Extent;
	short caret_Slope_Rise;
	short caret_Slope_Run;
	short caret_Offset;
	short[4] Reserved;
	short metric_Data_Format;
	ushort number_Of_VMetrics;
	void* long_metrics;
	void* short_metrics;
}

struct TT_OS2{
	ushort _version;
	short xAvgCharWidth;
	ushort usWeightClass;
	ushort usWidthClass;
	ushort fsType;
	short ySubscriptXSize;
	short ySubscriptYSize;
	short ySubscriptXOffset;
	short ySubscriptYOffset;
	short ySuperscriptXSize;
	short ySuperscriptYSize;
	short ySuperscriptXOffset;
	short ySuperscriptYOffset;
	short yStrikeoutSize;
	short yStrikeoutPosition;
	short sFamilyClass;
	ubyte[10] panose;
	FT_ULong ulUnicodeRange1;
	FT_ULong ulUnicodeRange2;
	FT_ULong ulUnicodeRange3;
	FT_ULong ulUnicodeRange4;
	char[4] achVendID;
	ushort fsSelection;
	ushort usFirstCharIndex;
	ushort usLastCharIndex;
	short sTypoAscender;
	short sTypoDescender;
	short sTypoLineGap;
	ushort usWinAscent;
	ushort usWinDescent;
	FT_ULong ulCodePageRange1;
	FT_ULong ulCodePageRange2;
	short sxHeight;
	short sCapHeight;
	ushort usDefaultChar;
	ushort usBreakChar;
	ushort usMaxContext;
	ushort usLowerOpticalPointSize;
	ushort usUpperOpticalPointSize;
}

struct TT_Postscript{
	FT_Fixed FormatType;
	FT_Fixed italicAngle;
	short underlinePosition;
	short underlineThickness;
	FT_ULong isFixedPitch;
	FT_ULong minMemType42;
	FT_ULong maxMemType42;
	FT_ULong minMemType1;
	FT_ULong maxMemType1;
}

struct TT_PCLT{
	FT_Fixed Version;
	FT_ULong FontNumber;
	ushort Pitch;
	ushort xHeight;
	ushort Style;
	ushort TypeFamily;
	ushort CapHeight;
	ushort SymbolSet;
	char[16] TypeFace;
	byte[8] CharacterComplement;
	char[6] FileName;
	byte StrokeWeight;
	byte WidthType;
	ubyte SerifStyle;
	ubyte Reserved;
}

struct TT_MaxProfile{
	FT_Fixed _version;
	ushort numGlyphs;
	ushort maxPoints;
	ushort maxContours;
	ushort maxCompositePoints;
	ushort maxCompositeContours;
	ushort maxZones;
	ushort maxTwilightPoints;
	ushort maxStorage;
	ushort maxFunctionDefs;
	ushort maxInstructionDefs;
	ushort maxStackElements;
	ushort maxSizeOfInstructions;
	ushort maxComponentElements;
	ushort maxComponentDepth;
}

alias FT_Sfnt_Tag = int;
enum{
	FT_SFNT_HEAD,
	FT_SFNT_MAXP,
	FT_SFNT_OS2,
	FT_SFNT_HHEA,
	FT_SFNT_VHEA,
	FT_SFNT_POST,
	FT_SFNT_PCLT,
	FT_SFNT_MAX,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{void*}, q{FT_Get_Sfnt_Table}, q{FT_Face face, FT_Sfnt_Tag tag}},
		{q{FT_Error}, q{FT_Load_Sfnt_Table}, q{FT_Face face, FT_ULong tag, FT_Long offset, ubyte* buffer, FT_ULong* length}},
		{q{FT_Error}, q{FT_Sfnt_Table_Info}, q{FT_Face face, uint table_index, FT_ULong* tag, FT_ULong* length}},
		{q{FT_ULong}, q{FT_Get_CMap_Language_ID}, q{FT_CharMap charmap}},
		{q{FT_ULong}, q{FT_Get_CMap_Format}, q{FT_CharMap charmap}},
	];
	return ret;
}()));
