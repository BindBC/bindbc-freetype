/+
+            Copyright 2023 – 2024 Aya Partridge
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
	FT_Fixed tableVersion;
	FT_Fixed fontRevision;
	FT_Long checkSumAdjust;
	FT_Long magicNumber;
	ushort flags;
	ushort unitsPerEM;
	static if(ftSupport >= FTSupport.v2_10){
		FT_ULong[2] created;
		FT_ULong[2] modified;
	}else{
		FT_Long[2] created;
		FT_Long[2] modified;
	}
	alias Table_Version = tableVersion;
	alias Font_Revision = fontRevision;
	alias CheckSum_Adjust = checkSumAdjust;
	alias Magic_Number = magicNumber;
	alias Flags = flags;
	alias Units_Per_EM = unitsPerEM;
	alias Created = created;
	alias Modified = modified;
	short xMin;
	short yMin;
	short xMax;
	short yMax;
	ushort macStyle;
	ushort lowestRecPPEM;
	short fontDirection;
	short indexToLocFormat;
	short glyphDataFormat;
	alias Mac_Style = macStyle;
	alias Lowest_Rec_PPEM = lowestRecPPEM;
	alias Font_Direction = fontDirection;
	alias Index_To_Loc_Format = indexToLocFormat;
	alias Glyph_Data_Format = glyphDataFormat;
}

struct TT_HoriHeader{
	FT_Fixed version_;
	short ascender;
	short descender;
	short lineGap;
	ushort advanceWidthMax;
	short minLeftSideBearing;
	short minRightSideBearing;
	short xMaxExtent;
	short caretSlopeRise;
	short caretSlopeRun;
	short caretOffset;
	alias Version = version_;
	alias Ascender = ascender;
	alias Descender = descender;
	alias Line_Gap = lineGap;
	alias advance_Width_Max = advanceWidthMax;
	alias min_Left_Side_Bearing = minLeftSideBearing;
	alias min_Right_Side_Bearing = minRightSideBearing;
	alias xMax_Extent = xMaxExtent;
	alias caret_Slope_Rise = caretSlopeRise;
	alias caret_Slope_Run = caretSlopeRun;
	alias caret_Offset = caretOffset;
	short[4] Reserved;
	short metricDataFormat;
	ushort numberOfHMetrics;
	void* longMetrics;
	void* shortMetrics;
	alias metric_Data_Format = metricDataFormat;
	alias number_Of_HMetrics = numberOfHMetrics;
	alias long_metrics = longMetrics;
	alias short_metrics = shortMetrics;
}

struct TT_VertHeader{
	FT_Fixed version_;
	short ascender;
	short descender;
	short lineGap;
	ushort advanceHeightMax;
	short minTopSideBearing;
	short minBottomSideBearing;
	short yMaxExtent;
	short caretSlopeRise;
	short caretSlopeRun;
	short caretOffset;
	alias Version = version_;
	alias Ascender = ascender;
	alias Descender = descender;
	alias Line_Gap = lineGap;
	alias advance_Height_Max = advanceHeightMax;
	alias min_Top_Side_Bearing = minTopSideBearing;
	alias min_Bottom_Side_Bearing = minBottomSideBearing;
	alias yMax_Extent = yMaxExtent;
	alias caret_Slope_Rise = caretSlopeRise;
	alias caret_Slope_Run = caretSlopeRun;
	alias caret_Offset = caretOffset;
	short[4] Reserved;
	short metricDataFormat;
	ushort numberOfVMetrics;
	void* longMetrics;
	void* shortMetrics;
	alias metric_Data_Format = metricDataFormat;
	alias number_Of_VMetrics = numberOfVMetrics;
	alias long_metrics = longMetrics;
	alias short_metrics = shortMetrics;
}

struct TT_OS2{
	ushort version_;
	alias _version = version_;
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
	FT_Fixed version_;
	FT_ULong fontNumber;
	ushort pitch;
	ushort xHeight;
	ushort style;
	ushort typeFamily;
	ushort capHeight;
	ushort symbolSet;
	char[16] typeFace;
	byte[8] characterComplement;
	char[6] fileName;
	byte strokeWeight;
	byte widthType;
	ubyte serifStyle;
	alias Version = version_;
	alias FontNumber = fontNumber;
	alias Pitch = pitch;
	alias Style = style;
	alias TypeFamily = typeFamily;
	alias CapHeight = capHeight;
	alias SymbolSet = symbolSet;
	alias TypeFace = typeFace;
	alias CharacterComplement = characterComplement;
	alias FileName = fileName;
	alias StrokeWeight = strokeWeight;
	alias WidthType = widthType;
	alias SerifStyle = serifStyle;
	ubyte Reserved;
}

struct TT_MaxProfile{
	FT_Fixed version_;
	alias _version = version_;
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

mixin(makeEnumBind(q{FT_SFNT_Tag}, aliases: [q{FT_Sfnt_Tag}, q{FT_Sfnt}, q{FT_SFNT}], members: (){
	EnumMember[] ret = [
		{{q{head},  q{FT_SFNT_HEAD}}},
		{{q{maxp},  q{FT_SFNT_MAXP}}},
		{{q{os2},   q{FT_SFNT_OS2}}},
		{{q{hhea},  q{FT_SFNT_HHEA}}},
		{{q{vhea},  q{FT_SFNT_VHEA}}},
		{{q{post},  q{FT_SFNT_POST}}},
		{{q{pclt},  q{FT_SFNT_PCLT}}},
		{{q{max_},  q{FT_SFNT_MAX}}},
	];
	return ret;
}()));

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{void*}, q{FT_Get_Sfnt_Table}, q{FT_Face face, FT_Sfnt_Tag tag}},
		{q{FT_Error}, q{FT_Load_Sfnt_Table}, q{FT_Face face, FT_ULong tag, FT_Long offset, ubyte* buffer, FT_ULong* length}},
		{q{FT_Error}, q{FT_Sfnt_Table_Info}, q{FT_Face face, uint tableIndex, FT_ULong* tag, FT_ULong* length}},
		{q{FT_ULong}, q{FT_Get_CMap_Language_ID}, q{FT_CharMap charMap}},
		{q{FT_ULong}, q{FT_Get_CMap_Format}, q{FT_CharMap charMap}},
	];
	return ret;
}()));
