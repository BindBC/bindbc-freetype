/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.trigon;

import bindbc.freetype.config;

import ft.image;
import ft.types;

alias FT_Angle = FT_Fixed;

enum{
	FT_ANGLE_PI   = 180 << 16,
	FT_ANGLE_2PI  = FT_ANGLE_PI * 2,
	FT_ANGLE_PI2  = FT_ANGLE_PI / 2,
	FT_ANGLE_PI4  = FT_ANGLE_PI / 4
}

static if(staticBinding){
	extern(C) nothrow @nogc{
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
}else{
	extern(C) __gshared nothrow @nogc{
		FT_Fixed function(FT_Angle angle) FT_Sin;
		FT_Fixed function(FT_Angle angle) FT_Cos;
		FT_Fixed function(FT_Angle angle) FT_Tan;
		FT_Angle function(FT_Fixed x, FT_Fixed y) FT_Atan2;
		FT_Angle function(FT_Angle angle1, FT_Angle angle2) FT_Angle_Diff;
		void function(FT_Vector* vec, FT_Angle angle) FT_Vector_Unit;
		void function(FT_Vector* vec, FT_Angle angle) FT_Vector_Rotate;
		FT_Fixed function(FT_Vector* vec) FT_Vector_Length;
		void function(FT_Vector* vec, FT_Fixed* length, FT_Angle* angle) FT_Vector_Polarize;
		void function(FT_Vector* vec, FT_Fixed length, FT_Angle angle) FT_Vector_From_Polar;
	}
}
