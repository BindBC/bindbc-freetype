/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.bitmap;

import bindbc.freetype.config;

import ft;
import ft.image;
import ft.modapi;
import ft.types;
static if(ftSupport >= FTSupport.v2_10){
	import ft.color;
}

static if(staticBinding){
	extern(C) nothrow @nogc{
		void FT_Bitmap_Init(FT_Bitmap* abitmap);
		FT_Error FT_Bitmap_Copy(FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target);
		FT_Error FT_Bitmap_Embolden(FT_Library library, FT_Bitmap* bitmap, FT_Pos xStrength, FT_Pos yStrength);
		FT_Error FT_Bitmap_Convert(FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target, int alignment);
		FT_Error FT_GlyphSlot_Own_Bitmap(FT_GlyphSlot slot);
		FT_Error FT_Bitmap_Done(FT_Library library, FT_Bitmap* bitmap);
	}
	static if(ftSupport >= FTSupport.v2_10){
		FT_Error FT_Bitmap_Blend(FT_Library library, const(FT_Bitmap)* source, const(FT_Vector) source_offset, FT_Bitmap* target, FT_Vector* atarget_offset, FT_Color color);
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Bitmap_Init = void function(FT_Bitmap* abitmap);
		alias pFT_Bitmap_Copy = FT_Error function(FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target);
		alias pFT_Bitmap_Embolden = FT_Error function(FT_Library library, FT_Bitmap* bitmap, FT_Pos xStrength, FT_Pos yStrength);
		alias pFT_Bitmap_Convert = FT_Error function(FT_Library library, const(FT_Bitmap)* source, FT_Bitmap* target, int alignment);
		alias pFT_GlyphSlot_Own_Bitmap = FT_Error function(FT_GlyphSlot slot);
		alias pFT_Bitmap_Done = FT_Error function(FT_Library library, FT_Bitmap* bitmap);
		
		static if(ftSupport >= FTSupport.v2_10){
			alias pFT_Bitmap_Blend = FT_Error function(FT_Library library, const(FT_Bitmap)* source, const(FT_Vector) source_offset, FT_Bitmap* target, FT_Vector* atarget_offset, FT_Color color);
		}
	}
	__gshared{
		pFT_Bitmap_Init FT_Bitmap_Init;
		pFT_Bitmap_Copy FT_Bitmap_Copy;
		pFT_Bitmap_Embolden FT_Bitmap_Embolden;
		pFT_Bitmap_Convert FT_Bitmap_Convert;
		pFT_GlyphSlot_Own_Bitmap FT_GlyphSlot_Own_Bitmap;
		pFT_Bitmap_Done FT_Bitmap_Done;
		
		static if(ftSupport >= FTSupport.v2_10){
			pFT_Bitmap_Blend FT_Bitmap_Blend;
		}
	}
}