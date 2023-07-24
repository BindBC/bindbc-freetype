/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.mm;

import bindbc.freetype.config;

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
	uint num_axis;
	uint num_designs;
	uint num_namedstyles;
	FT_Var_Axis* axis;
	FT_Var_Named_Style* namedstyle;
}

// Added in Freetype 2.8
enum FT_VAR_AXIS_FLAG_HIDDEN = 1;

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Get_Multi_Master(FT_Face face, FT_Multi_Master* amaster);
		FT_Error FT_Get_MM_Var(FT_Face face, FT_MM_Var** amaster);
		FT_Error FT_Set_MM_Design_Coordinates(FT_Face face, uint num_coords, FT_Long* coords);
		FT_Error FT_Set_Var_Design_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);
		FT_Error FT_Set_MM_Blend_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);
		FT_Error FT_Set_Var_Blend_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);

		static if(ftSupport >= FTSupport.v2_7){
			FT_Error FT_Get_Var_Design_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);
			FT_Error FT_Get_MM_Blend_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);
			FT_Error FT_Get_Var_Blend_Coordinates(FT_Face face, uint num_coords, FT_Fixed* coords);
		}
		static if(ftSupport >= FTSupport.v2_8){
			FT_Error FT_Get_Var_Axis_Flags(FT_MM_Var* master, uint axis_index, uint* flags);
		}
		static if(ftSupport >= FTSupport.v2_9){
			FT_Error FT_Done_MM_Var(FT_Library library, FT_MM_Var* amaster);
			FT_Error FT_Set_Named_Instance(FT_Face face, uint instance_index);
		}
		static if(ftSupport >= FTSupport.v2_10){
			FT_Error FT_Set_MM_WeightVector(FT_Face face, uint len, FT_Fixed* weightvector);
			FT_Error FT_Get_MM_WeightVector(FT_Face face, uint len, FT_Fixed* weightvector);
		}
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Get_Multi_Master = FT_Error function(FT_Face face, FT_Multi_Master* amaster);
		alias pFT_Get_MM_Var = FT_Error function(FT_Face face, FT_MM_Var** amaster);
		alias pFT_Set_MM_Design_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Long* coords);
		alias pFT_Set_Var_Design_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);
		alias pFT_Set_MM_Blend_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);
		alias pFT_Set_Var_Blend_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);

		static if(ftSupport >= FTSupport.v2_7){
			alias pFT_Get_Var_Design_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);
			alias pFT_Get_MM_Blend_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);
			alias pFT_Get_Var_Blend_Coordinates = FT_Error function(FT_Face face, uint num_coords, FT_Fixed* coords);
		}

		static if(ftSupport >= FTSupport.v2_8){
			alias pFT_Get_Var_Axis_Flags = FT_Error function(FT_MM_Var* master, uint axis_index, uint* flags);
		}

		static if(ftSupport >= FTSupport.v2_9){
			alias pFT_Done_MM_Var = FT_Error function(FT_Library library, FT_MM_Var* amaster);
			alias pFT_Set_Named_Instance = FT_Error function(FT_Face face, uint instance_index);
		}
		static if(ftSupport >= FTSupport.v2_10){
			alias pFT_Set_MM_WeightVector = FT_Error function(FT_Face face, uint len, FT_Fixed* weightvector);
			alias pFT_Get_MM_WeightVector = FT_Error function(FT_Face face, uint len, FT_Fixed* weightvector);
		}
	}
	
	__gshared{
		pFT_Get_Multi_Master FT_Get_Multi_Master;
		pFT_Get_MM_Var FT_Get_MM_Var;
		pFT_Set_MM_Design_Coordinates FT_Set_MM_Design_Coordinates;
		pFT_Set_Var_Design_Coordinates FT_Set_Var_Design_Coordinates;
		pFT_Set_MM_Blend_Coordinates FT_Set_MM_Blend_Coordinates;
		pFT_Set_Var_Blend_Coordinates FT_Set_Var_Blend_Coordinates;

		static if(ftSupport >= FTSupport.v2_7){
			pFT_Get_Var_Design_Coordinates FT_Get_Var_Design_Coordinates;
			pFT_Get_MM_Blend_Coordinates FT_Get_MM_Blend_Coordinates;
			pFT_Get_Var_Blend_Coordinates FT_Get_Var_Blend_Coordinates;
		}
		static if(ftSupport >= FTSupport.v2_8){
			pFT_Get_Var_Axis_Flags FT_Get_Var_Axis_Flags;
		}
		static if(ftSupport >= FTSupport.v2_9){
			pFT_Done_MM_Var FT_Done_MM_Var;
			pFT_Set_Named_Instance FT_Set_Named_Instance;
		}
		static if(ftSupport >= FTSupport.v2_10){
			pFT_Set_MM_WeightVector FT_Set_MM_WeightVector;
			pFT_Get_MM_WeightVector FT_Get_MM_WeightVector;
		}
	}

}