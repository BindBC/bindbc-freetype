/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.color;

import bindbc.freetype.config;

static if(ftSupport >= FTSupport.v2_10){
	import ft;
	import ft.image;
	import ft.types;
	
	struct FT_Color{
		ubyte blue;
		ubyte green;
		ubyte red;
		ubyte alpha;
	}
	alias FT_Colour = FT_Color;
	
	enum{
		FT_PALETTE_FOR_LIGHT_BACKGROUND  = 0x01,
		FT_PALETTE_FOR_DARK_BACKGROUND   = 0x02,
	}
	
	struct FT_Palette_Data{
		ushort num_palettes;
		const(ushort)* palette_name_ids;
		const(ushort)* palette_flags;
		ushort num_palette_entries;
		const(ushort)* palette_entry_name_ids;
	}
	
	static if(staticBinding){
		extern(C) @nogc nothrow{
			FT_Error FT_Palette_Data_Get(FT_Face face, FT_Palette_Data* apalette);
			FT_Error FT_Palette_Select(FT_Face face, ushort palette_index, FT_Color* apalette);
			FT_Error FT_Palette_Set_Foreground_Color(FT_Face face, FT_Color foreground_color);
		}
	}else{
		extern(C) @nogc nothrow{
			alias pFT_Palette_Data_Get = FT_Error function(FT_Face face,FT_Palette_Data* apalette);
			alias pFT_Palette_Select = FT_Error function(FT_Face face, ushort palette_index, FT_Color* apalette);
			alias pFT_Palette_Set_Foreground_Color = FT_Error function(FT_Face face, FT_Color foreground_color);
		}
		__gshared{
			pFT_Palette_Data_Get FT_Palette_Data_Get;
			pFT_Palette_Select FT_Palette_Select;
			pFT_Palette_Set_Foreground_Color FT_Palette_Set_Foreground_Color;
		}
	}
}

static if(ftSupport >= FTSupport.v2_11){
	struct FT_LayerIterator{
		uint num_layers;
		uint layer;
		ubyte* p;
	}
	
	alias FT_PaintFormat = int;
	enum: FT_PaintFormat{
		FT_COLR_PAINTFORMAT_COLR_LAYERS      = 1,
		FT_COLR_PAINTFORMAT_SOLID            = 2,
		FT_COLR_PAINTFORMAT_LINEAR_GRADIENT  = 4,
		FT_COLR_PAINTFORMAT_RADIAL_GRADIENT  = 6,
		FT_COLR_PAINTFORMAT_SWEEP_GRADIENT   = 8,
		FT_COLR_PAINTFORMAT_GLYPH            = 10,
		FT_COLR_PAINTFORMAT_COLR_GLYPH       = 11,
		FT_COLR_PAINTFORMAT_TRANSFORM        = 12,
		FT_COLR_PAINTFORMAT_TRANSLATE        = 14,
		FT_COLR_PAINTFORMAT_SCALE            = 16,
		FT_COLR_PAINTFORMAT_ROTATE           = 24,
		FT_COLR_PAINTFORMAT_SKEW             = 28,
		FT_COLR_PAINTFORMAT_COMPOSITE        = 32,
		FT_COLR_PAINT_FORMAT_MAX             = 33,
		FT_COLR_PAINTFORMAT_UNSUPPORTED      = 255,
	}
	
	struct FT_ColorStopIterator{
		uint num_color_stops;
		alias num_colour_stops = num_color_stops;
		uint current_color_stop;
		alias current_colour_stop = current_color_stop;
		ubyte* p;
	}
	alias FT_ColourStopIterator = FT_ColorStopIterator;
	
	struct FT_ColorIndex{
		ushort palette_index;
		FT_F2Dot14 alpha;
	}
	alias FT_ColourIndex = FT_ColorIndex;
	
	struct FT_ColorStop{
		static if(ftSupport >= FTSupport.v2_13){
			FT_Fixed stop_offset;
		}else{
			FT_F2Dot14 stop_offset;
		}
		FT_ColorIndex color;
		alias colour = color;
	}
	alias FT_ColourStop = FT_ColorStop;
	
	alias FT_PaintExtend = int;
	enum: FT_PaintExtend{
		FT_COLR_PAINT_EXTEND_PAD     = 0,
		FT_COLR_PAINT_EXTEND_REPEAT  = 1,
		FT_COLR_PAINT_EXTEND_REFLECT = 2,
	}
	
	struct FT_ColorLine{
		FT_PaintExtend extend;
		FT_ColorStopIterator color_stop_iterator;
		alias colour_stop_iterator = color_stop_iterator;
	}
	alias FT_ColourLine = FT_ColorLine;
	
	struct FT_Affine23{
		FT_Fixed xx, xy, dx;
		FT_Fixed yx, yy, dy;
	}
	
	alias FT_Composite_Mode = int;
	enum: FT_Composite_Mode{
		FT_COLR_COMPOSITE_CLEAR           = 0,
		FT_COLR_COMPOSITE_SRC             = 1,
		FT_COLR_COMPOSITE_DEST            = 2,
		FT_COLR_COMPOSITE_SRC_OVER        = 3,
		FT_COLR_COMPOSITE_DEST_OVER       = 4,
		FT_COLR_COMPOSITE_SRC_IN          = 5,
		FT_COLR_COMPOSITE_DEST_IN         = 6,
		FT_COLR_COMPOSITE_SRC_OUT         = 7,
		FT_COLR_COMPOSITE_DEST_OUT        = 8,
		FT_COLR_COMPOSITE_SRC_ATOP        = 9,
		FT_COLR_COMPOSITE_DEST_ATOP       = 10,
		FT_COLR_COMPOSITE_XOR             = 11,
		FT_COLR_COMPOSITE_SCREEN          = 12,
		FT_COLR_COMPOSITE_OVERLAY         = 13,
		FT_COLR_COMPOSITE_DARKEN          = 14,
		FT_COLR_COMPOSITE_LIGHTEN         = 15,
		FT_COLR_COMPOSITE_COLOR_DODGE     = 16,
		FT_COLR_COMPOSITE_COLOR_BURN      = 17,
		FT_COLR_COMPOSITE_HARD_LIGHT      = 18,
		FT_COLR_COMPOSITE_SOFT_LIGHT      = 19,
		FT_COLR_COMPOSITE_DIFFERENCE      = 20,
		FT_COLR_COMPOSITE_EXCLUSION       = 21,
		FT_COLR_COMPOSITE_MULTIPLY        = 22,
		FT_COLR_COMPOSITE_HSL_HUE         = 23,
		FT_COLR_COMPOSITE_HSL_SATURATION  = 24,
		FT_COLR_COMPOSITE_HSL_COLOR       = 25,
		FT_COLR_COMPOSITE_HSL_LUMINOSITY  = 26,
		FT_COLR_COMPOSITE_MAX             = 27,
	}
	
	struct FT_OpaquePaint{
		ubyte* p;
		FT_Bool insert_root_transform;
	}
	
	struct FT_PaintColrLayers{
		FT_LayerIterator layer_iterator;
	}
	
	struct FT_PaintSolid{
		FT_ColorIndex color;
		alias colour = color;
	}
	
	struct FT_PaintLinearGradient{
		FT_ColorLine colorline;
		alias colourline = colorline;
		FT_Vector p0;
		FT_Vector p1;
		FT_Vector p2;
	}
	
	struct FT_PaintRadialGradient{
		FT_ColorLine colorline;
		alias colourline = colorline;
		FT_Vector c0;
		ushort r0;
		FT_Vector c1;
		ushort r1;
	}
	
	struct FT_PaintSweepGradient{
		FT_ColorLine colorline;
		alias colourline = colorline;
		FT_Vector center;
		FT_Fixed start_angle;
		FT_Fixed end_angle;
	}
	
	struct FT_PaintGlyph{
		FT_OpaquePaint paint;
		uint glyphID;
	}
	
	struct FT_PaintColrGlyph{
		uint glyphID;
	}
	
	struct FT_PaintTransform{
		FT_OpaquePaint paint;
		FT_Affine23 affine;
	}
	
	struct FT_PaintTranslate{
		FT_OpaquePaint paint;
		FT_Fixed dx;
		FT_Fixed dy;
	}
	
	struct FT_PaintScale{
		FT_OpaquePaint paint;
		FT_Fixed scale_x;
		FT_Fixed scale_y;
		FT_Fixed center_x;
		FT_Fixed center_y;
	}
	
	struct FT_PaintRotate{
		FT_OpaquePaint paint;
		FT_Fixed angle;
		FT_Fixed center_x;
		FT_Fixed center_y;
	}
	
	struct FT_PaintSkew{
		FT_OpaquePaint paint;
		FT_Fixed x_skew_angle;
		FT_Fixed y_skew_angle;
		FT_Fixed center_x;
		FT_Fixed center_y;
	}
	
	struct FT_PaintComposite{
		FT_OpaquePaint source_paint;
		FT_Composite_Mode composite_mode;
		FT_OpaquePaint backdrop_paint;
	}
	
	struct FT_COLR_Paint{
		FT_PaintFormat format;
		union u{
			FT_PaintColrLayers colr_layers;
			FT_PaintGlyph glyph;
			FT_PaintSolid solid;
			FT_PaintLinearGradient linear_gradient;
			FT_PaintRadialGradient radial_gradient;
			FT_PaintSweepGradient sweep_gradient;
			FT_PaintTransform transform;
			FT_PaintTranslate translate;
			FT_PaintScale scale;
			FT_PaintRotate rotate;
			FT_PaintSkew skew;
			FT_PaintComposite composite;
			FT_PaintColrGlyph colr_glyph;
		}
	}
	
	alias FT_Color_Root_Transform = int;
	enum: FT_Color_Root_Transform{
		FT_COLOR_INCLUDE_ROOT_TRANSFORM,
		FT_COLOR_NO_ROOT_TRANSFORM,
		FT_COLOR_ROOT_TRANSFORM_MAX,
	}
	
	static if(staticBinding){
		extern(C) @nogc nothrow{
			FT_Bool FT_Get_Color_Glyph_Paint(FT_Face face, uint base_glyph, FT_Color_Root_Transform root_transform, FT_OpaquePaint* paint);
			FT_Bool FT_Get_Paint_Layers(FT_Face face, FT_LayerIterator* iterator, FT_OpaquePaint* paint);
			FT_Bool FT_Get_Colorline_Stops(FT_Face face, FT_ColorStop* color_stop, FT_ColorStopIterator iterator);
			FT_Bool FT_Get_Paint(FT_Face face, FT_OpaquePaint opaque_paint, FT_COLR_Paint* paint);
			static if(ftSupport >= FTSupport.v2_10){
				FT_Bool FT_Get_Color_Glyph_Layer(FT_Face face, uint base_glyph, uint* aglyph_index, uint* acolor_index, FT_LayerIterator* iterator);
			}
		}
	}else{
		extern(C) @nogc nothrow{
			alias pFT_Get_Color_Glyph_Paint = FT_Bool function(FT_Face face, uint base_glyph, FT_Color_Root_Transform root_transform, FT_OpaquePaint* paint);
			alias pFT_Get_Paint_Layers = FT_Bool function(FT_Face face, FT_LayerIterator* iterator, FT_OpaquePaint* paint);
			alias pFT_Get_Colorline_Stops = FT_Bool function(FT_Face face, FT_ColorStop* color_stop, FT_ColorStopIterator iterator);
			alias pFT_Get_Paint = FT_Bool function(FT_Face face, FT_OpaquePaint opaque_paint, FT_COLR_Paint* paint);
		}
		__gshared{
			pFT_Get_Color_Glyph_Paint FT_Get_Color_Glyph_Paint;
			pFT_Get_Paint_Layers FT_Get_Paint_Layers;
			pFT_Get_Colorline_Stops FT_Get_Colorline_Stops;
			pFT_Get_Paint FT_Get_Paint;
		}
		static if(ftSupport >= FTSupport.v2_10){
			extern(C) @nogc nothrow{
				alias pFT_Get_Color_Glyph_Layer = FT_Bool function(FT_Face face, uint base_glyph, uint* aglyph_index, uint* acolor_index, FT_LayerIterator* iterator);
			}
			__gshared{
				pFT_Get_Color_Glyph_Layer FT_Get_Color_Glyph_Layer;
			}
		}
		alias FT_Get_Colourline_Stops = FT_Get_Colorline_Stops;
		alias FT_Get_Colour_Glyph_Layer = FT_Get_Color_Glyph_Layer;
	}
}
