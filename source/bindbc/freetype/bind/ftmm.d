
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftmm;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.fttypes;

struct FT_MM_Axis {
    FT_String* name;
    FT_Long minimum;
    FT_Long maximum;
}

struct FT_Multi_Master {
    FT_UInt num_axis;
    FT_UInt num_designs;
    FT_MM_Axis[4] axis;
}

struct FT_Var_Axis {
    FT_String* name;
    FT_Fixed minimum;
    FT_Fixed def;
    FT_Fixed maximum;
    FT_ULong tag;
    FT_UInt strid;
}

struct FT_Var_Named_Style {
    FT_Fixed* coords;
    FT_UInt strid;
    static if(ftSupport >= FTSupport.ft27) {
        FT_UInt psid;
    }
}

struct FT_MM_Var {
    FT_UInt num_axis;
    FT_UInt num_designs;
    FT_UInt num_namedstyles;
    FT_Var_Axis* axis;
    FT_Var_Named_Style* namedstyle;
}

// Added in Freetype 2.8
enum FT_VAR_AXIS_FLAG_HIDDEN = 1;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_Error FT_Get_Multi_Master(FT_Face face, FT_Multi_Master* amaster);
        FT_Error FT_Get_MM_Var(FT_Face face, FT_MM_Var** amaster);
        FT_Error FT_Set_MM_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Long* coords);
        FT_Error FT_Set_Var_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        FT_Error FT_Set_MM_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        FT_Error FT_Set_Var_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

        static if(ftSupport >= FTSupport.ft27) {
            FT_Error FT_Get_Var_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
            FT_Error FT_Get_MM_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
            FT_Error FT_Get_Var_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        }
        static if(ftSupport >= FTSupport.ft28) {
            FT_Error FT_Get_Var_Axis_Flags(FT_MM_Var* master, FT_UInt axis_index, FT_UInt* flags);
        }
        static if(ftSupport >= FTSupport.ft29) {
            FT_Error FT_Done_MM_Var(FT_Library library, FT_MM_Var* amaster);
            FT_Error FT_Set_Named_Instance(FT_Face face, FT_UInt instance_index);
        }
        static if(ftSupport >= FTSupport.ft210) {
            FT_Error FT_Set_MM_WeightVector(FT_Face face, FT_UInt len, FT_Fixed* weightvector);
            FT_Error FT_Get_MM_WeightVector(FT_Face face, FT_UInt len, FT_Fixed* weightvector);
        }
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Get_Multi_Master = FT_Error function(FT_Face face, FT_Multi_Master* amaster);
        alias pFT_Get_MM_Var = FT_Error function(FT_Face face, FT_MM_Var** amaster);
        alias pFT_Set_MM_Design_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Long* coords);
        alias pFT_Set_Var_Design_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        alias pFT_Set_MM_Blend_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        alias pFT_Set_Var_Blend_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

        static if(ftSupport >= FTSupport.ft27) {
            alias pFT_Get_Var_Design_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
            alias pFT_Get_MM_Blend_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
            alias pFT_Get_Var_Blend_Coordinates = FT_Error function(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);
        }

        static if(ftSupport >= FTSupport.ft28) {
            alias pFT_Get_Var_Axis_Flags = FT_Error function(FT_MM_Var* master, FT_UInt axis_index, FT_UInt* flags);
        }

        static if(ftSupport >= FTSupport.ft29) {
            alias pFT_Done_MM_Var = FT_Error function(FT_Library library, FT_MM_Var* amaster);
            alias pFT_Set_Named_Instance = FT_Error function(FT_Face face, FT_UInt instance_index);
        }
        static if(ftSupport >= FTSupport.ft210) {
            alias FT_Set_MM_WeightVector = FT_Error function(FT_Face face, FT_UInt len, FT_Fixed* weightvector);
            alias FT_Get_MM_WeightVector = FT_Error function(FT_Face face, FT_UInt len, FT_Fixed* weightvector);
        }
    }

    __gshared {
        pFT_Get_Multi_Master FT_Get_Multi_Master;
        pFT_Get_MM_Var FT_Get_MM_Var;
        pFT_Set_MM_Design_Coordinates FT_Set_MM_Design_Coordinates;
        pFT_Set_Var_Design_Coordinates FT_Set_Var_Design_Coordinates;
        pFT_Set_MM_Blend_Coordinates FT_Set_MM_Blend_Coordinates;
        pFT_Set_Var_Blend_Coordinates FT_Set_Var_Blend_Coordinates;

        static if(ftSupport >= FTSupport.ft27) {
            pFT_Get_Var_Design_Coordinates FT_Get_Var_Design_Coordinates;
            pFT_Get_MM_Blend_Coordinates FT_Get_MM_Blend_Coordinates;
            pFT_Get_Var_Blend_Coordinates FT_Get_Var_Blend_Coordinates;
        }
        static if(ftSupport >= FTSupport.ft28) {
            pFT_Get_Var_Axis_Flags FT_Get_Var_Axis_Flags;
        }
        static if(ftSupport >= FTSupport.ft29) {
            pFT_Done_MM_Var FT_Done_MM_Var;
            pFT_Set_Named_Instance FT_Set_Named_Instance;
        }
        static if(ftSupport >= FTSupport.ft210) {
            pFT_Set_MM_WeightVector FT_Set_MM_WeightVector;
            pFT_Get_MM_WeightVector FT_Get_MM_WeightVector;
        }
    }

}