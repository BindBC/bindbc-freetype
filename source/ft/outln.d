/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.outln;

import bindbc.freetype.config;

import ft;
import ft.image;
import ft.types;

alias FT_Orientation = int;
enum{
	FT_ORIENTATION_TRUETYPE = 0,
	FT_ORIENTATION_POSTSCRIPT = 1,
	FT_ORIENTATION_FILL_RIGHT = FT_ORIENTATION_TRUETYPE,
	FT_ORIENTATION_FILL_LEFT = FT_ORIENTATION_POSTSCRIPT
}

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_Error FT_Outline_Decompose(FT_Outline* outline, const(FT_Outline_Funcs)* func_interface, void* user);
		FT_Error FT_Outline_New(FT_Library library, uint numPoints, int numContours, FT_Outline* anoutline);
		FT_Error FT_Outline_Done(FT_Library library, FT_Outline* outline);
		FT_Error FT_Outline_Check(FT_Outline* outline);
		void FT_Outline_Get_CBox(const(FT_Outline)* outline, FT_BBox* acboc);
		void FT_Outline_Translate(const(FT_Outline)* outline, FT_Pos xoffset, FT_Pos yoffset);
		FT_Error FT_Outline_Copy(const(FT_Outline)* outline, FT_Outline* target);
		void FT_Outline_Transform(const(FT_Outline)* outline, const(FT_Matrix)* matrix);
		FT_Error FT_Outline_Embolden(FT_Outline* outline, FT_Pos strength);
		FT_Error FT_Outline_EmboldenXY(FT_Outline* outline, FT_Pos xstrength, FT_Pos ystrength);
		void FT_Outline_Reverse(FT_Outline* outline);
		FT_Error FT_Outline_Get_Bitmap(FT_Library library, FT_Outline* outline, const(FT_Bitmap)* abitmap);
		FT_Error FT_Outline_Render(FT_Library library, FT_Outline* outline, FT_Raster_Params* params);
		FT_Orientation FT_Outline_Get_Orientation(FT_Outline* outline);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Outline_Decompose = FT_Error function(FT_Outline* outline, const(FT_Outline_Funcs)* func_interface, void* user);
		alias pFT_Outline_New = FT_Error function(FT_Library library, uint numPoints, int numContours, FT_Outline* anoutline);
		alias pFT_Outline_Done = FT_Error function(FT_Library library, FT_Outline* outline);
		alias pFT_Outline_Check = FT_Error function(FT_Outline* outline);
		alias pFT_Outline_Get_CBox = void function(const(FT_Outline)* outline, FT_BBox* acbox);
		alias pFT_Outline_Translate = void function(const(FT_Outline)* outline, FT_Pos xoffset, FT_Pos yoffset);
		alias pFT_Outline_Copy = FT_Error function(const(FT_Outline)* outline,FT_Outline* target);
		alias pFT_Outline_Transform = void function(const(FT_Outline)* outline, const(FT_Matrix)* matrix);
		alias pFT_Outline_Embolden = FT_Error function(FT_Outline* outline, FT_Pos strength);
		alias pFT_Outline_EmboldenXY = FT_Error function(FT_Outline* outline, FT_Pos xstrength, FT_Pos ystrength);
		alias pFT_Outline_Reverse = void function(FT_Outline* outline);
		alias pFT_Outline_Get_Bitmap = FT_Error function(FT_Library library, FT_Outline* outline, const(FT_Bitmap)* abitmap);
		alias pFT_Outline_Render = FT_Error function(FT_Library library, FT_Outline* outline, FT_Raster_Params* params);
		alias pFT_Outline_Get_Orientation = FT_Orientation function(FT_Outline* outline);
	}
	
	__gshared{
		pFT_Outline_Decompose FT_Outline_Decompose;
		pFT_Outline_New FT_Outline_New;
		pFT_Outline_Done FT_Outline_Done;
		pFT_Outline_Check FT_Outline_Check;
		pFT_Outline_Get_CBox FT_Outline_Get_CBox;
		pFT_Outline_Translate FT_Outline_Translate;
		pFT_Outline_Copy FT_Outline_Copy;
		pFT_Outline_Transform FT_Outline_Transform;
		pFT_Outline_Embolden FT_Outline_Embolden;
		pFT_Outline_EmboldenXY FT_Outline_EmboldenXY;
		pFT_Outline_Reverse FT_Outline_Reverse;
		pFT_Outline_Get_Bitmap FT_Outline_Get_Bitmap;
		pFT_Outline_Render FT_Outline_Render;
		pFT_Outline_Get_Orientation FT_Outline_Get_Orientation;
	}
}