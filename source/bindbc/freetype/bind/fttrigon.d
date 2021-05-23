
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.fttrigon;

import bindbc.freetype.bind.ftimage,
       bindbc.freetype.bind.fttypes;

alias FT_Angle = FT_Fixed;

enum {
    FT_ANGLE_PI     = 180 << 16,
    FT_ANGLE_2PI    = FT_ANGLE_PI * 2,
    FT_ANGLE_PI2    = FT_ANGLE_PI / 2,
    FT_ANGLE_PI4    = FT_ANGLE_PI / 4
}

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_Fixed FT_Sin(FT_Angle angle);
        FT_Fixed FT_Cos(FT_Angle angle);
        FT_Fixed FT_Tan(FT_Angle angle);
        FT_Angle FT_Atan2(FT_Fixed x, FT_Fixed y);
        FT_Angle FT_Angle_Diff(FT_Angle angle1, FT_Angle angle2);
        void FT_Vector_Unit(FT_Vector* vec, FT_Angle angle);
        void FT_Vector_Rotate(FT_Vector* vec, FT_Angle angle);
        FT_Fixed FT_Vector_Length(FT_Vector* vec);
        void FT_Vector_Polarize(FT_Vector* vec, FT_Fixed* length, FT_Angle* angle);
        void FT_Vector_From_Polar(FT_Vector* vec, FT_Fixed length, FT_Angle angle);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Sin = FT_Fixed function(FT_Angle angle);
        alias pFT_Cos = FT_Fixed function(FT_Angle angle);
        alias pFT_Tan = FT_Fixed function(FT_Angle angle);
        alias pFT_Atan2 = FT_Angle function(FT_Fixed x, FT_Fixed y);
        alias pFT_Angle_Diff = FT_Angle function(FT_Angle angle1, FT_Angle angle2);
        alias pFT_Vector_Unit = void function(FT_Vector* vec, FT_Angle angle);
        alias pFT_Vector_Rotate = void function(FT_Vector* vec, FT_Angle angle);
        alias pFT_Vector_Length = FT_Fixed function(FT_Vector* vec);
        alias pFT_Vector_Polarize = void function(FT_Vector* vec, FT_Fixed* length, FT_Angle* angle);
        alias pFT_Vector_From_Polar = void function(FT_Vector* vec, FT_Fixed length, FT_Angle angle);
    }

    __gshared {
        pFT_Sin FT_Sin;
        pFT_Cos FT_Cos;
        pFT_Tan FT_Tan;
        pFT_Atan2 FT_Atan2;
        pFT_Angle_Diff FT_Angle_Diff;
        pFT_Vector_Unit FT_Vector_Unit;
        pFT_Vector_Rotate FT_Vector_Rotate;
        pFT_Vector_Length FT_Vector_Length;
        pFT_Vector_Polarize FT_Vector_Polarize;
        pFT_Vector_From_Polar FT_Vector_From_Polar;
    }
}