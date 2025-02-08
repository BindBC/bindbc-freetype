/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.mm;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

struct FT_MM_Axis{
	char* name;
	FT_Long minimum;
	FT_Long maximum;
}

struct FT_Multi_Master{
	uint num_axis;
	uint num_designs;
	FT_MM_Axis[4] axis;
}

struct FT_Var_Axis{
	char* name;
	FT_Fixed minimum;
	FT_Fixed def;
	FT_Fixed maximum;
	FT_ULong tag;
	uint strid;
}

struct FT_Var_Named_Style{
	FT_Fixed* coords;
	uint strid;
	static if(ftSupport >= FTSupport.v2_7){
		uint psid;
	}
}

struct FT_MM_Var{
	uint numAxis;
	uint numDesigns;
	uint numNamedstyles;
	alias num_axis = numAxis;
	alias num_designs = numDesigns;
	alias num_namedstyles = numNamedstyles;
	FT_Var_Axis* axis;
	FT_Var_Named_Style* namedStyle;
	alias namedstyle = namedStyle;
}

// Added in Freetype 2.8
enum FT_VAR_AXIS_FLAG_HIDDEN = 1;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_Multi_Master}, q{FT_Face face, FT_Multi_Master* aMaster}},
		{q{FT_Error}, q{FT_Get_MM_Var}, q{FT_Face face, FT_MM_Var** aMaster}},
		{q{FT_Error}, q{FT_Set_MM_Design_Coordinates}, q{FT_Face face, uint numCoords, FT_Long* coords}},
		{q{FT_Error}, q{FT_Set_Var_Design_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
		{q{FT_Error}, q{FT_Set_MM_Blend_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
		{q{FT_Error}, q{FT_Set_Var_Blend_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
	];
	if(ftSupport >= FTSupport.v2_7){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_Var_Design_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
			{q{FT_Error}, q{FT_Get_MM_Blend_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
			{q{FT_Error}, q{FT_Get_Var_Blend_Coordinates}, q{FT_Face face, uint numCoords, FT_Fixed* coords}},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_8){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_Var_Axis_Flags}, q{FT_MM_Var* master, uint axisIndex, uint* flags}},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_9){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Done_MM_Var}, q{FT_Library library, FT_MM_Var* aMaster}},
			{q{FT_Error}, q{FT_Set_Named_Instance}, q{FT_Face face, uint instanceIndex}},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Set_MM_WeightVector}, q{FT_Face face, uint len, FT_Fixed* weightVector}},
			{q{FT_Error}, q{FT_Get_MM_WeightVector}, q{FT_Face face, uint len, FT_Fixed* weightVector}},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_13){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Get_Default_Named_Instance}, q{FT_Face face, uint* instanceIndex}},
		];
		ret ~= add;
	}
	return ret;
}()));
