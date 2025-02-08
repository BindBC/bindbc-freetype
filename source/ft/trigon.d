/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.trigon;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.image;
import ft.types;

alias FT_Angle = FT_Fixed;

enum{
	FT_ANGLE_PI   = 180 << 16,
	FT_ANGLE_2PI  = FT_ANGLE_PI * 2,
	FT_ANGLE_PI2  = FT_ANGLE_PI / 2,
	FT_ANGLE_PI4  = FT_ANGLE_PI / 4,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Fixed}, q{FT_Sin}, q{FT_Angle angle}},
		{q{FT_Fixed}, q{FT_Cos}, q{FT_Angle angle}},
		{q{FT_Fixed}, q{FT_Tan}, q{FT_Angle angle}},
		{q{FT_Angle}, q{FT_Atan2}, q{FT_Fixed x, FT_Fixed y}},
		{q{FT_Angle}, q{FT_Angle_Diff}, q{FT_Angle angle1, FT_Angle angle2}},
		{q{void}, q{FT_Vector_Unit}, q{FT_Vector* vec, FT_Angle angle}},
		{q{void}, q{FT_Vector_Rotate}, q{FT_Vector* vec, FT_Angle angle}},
		{q{FT_Fixed}, q{FT_Vector_Length}, q{FT_Vector* vec}},
		{q{void}, q{FT_Vector_Polarize}, q{FT_Vector* vec, FT_Fixed* length, FT_Angle* angle}},
		{q{void}, q{FT_Vector_From_Polar}, q{FT_Vector* vec, FT_Fixed length, FT_Angle angle}},
	];
	return ret;
}()));
