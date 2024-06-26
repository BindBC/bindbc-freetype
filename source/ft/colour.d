/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.colour;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

static if(ftSupport >= FTSupport.v2_10){
	import ft;
	import ft.image;
	import ft.types;
	
	struct FT_Colour{
		ubyte blue;
		ubyte green;
		ubyte red;
		ubyte alpha;
	}
	alias FT_Color = FT_Colour;
	
	enum{
		FT_PALETTE_FOR_LIGHT_BACKGROUND  = 0x01,
		FT_PALETTE_FOR_DARK_BACKGROUND   = 0x02,
	}
	
	struct FT_Palette_Data{
		ushort numPalettes;
		const(ushort)* paletteNameIDs;
		const(ushort)* paletteFlags;
		ushort numPaletteEntries;
		const(ushort)* paletteEntryNameIDs;
		alias num_palettes = numPalettes;
		alias palette_name_ids = paletteNameIDs;
		alias palette_flags = paletteFlags;
		alias num_palette_entries = numPaletteEntries;
		alias palette_entry_name_ids = paletteEntryNameIDs;
	}
	
	struct FT_LayerIterator{
		uint numLayers;
		alias num_layers = numLayers;
		uint layer;
		ubyte* p;
	}
}

static if(ftSupport >= FTSupport.v2_11){
	mixin(makeEnumBind(q{FT_PaintFormat}, members: (){
		EnumMember[] ret = [
			{{q{colrLayers},      q{FT_COLR_PAINTFORMAT_COLR_LAYERS}},      q{1}},
			{{q{solid},           q{FT_COLR_PAINTFORMAT_SOLID}},            q{2}},
			{{q{linearGradient},  q{FT_COLR_PAINTFORMAT_LINEAR_GRADIENT}},  q{4}},
			{{q{radialGradient},  q{FT_COLR_PAINTFORMAT_RADIAL_GRADIENT}},  q{6}},
			{{q{sweepGradient},   q{FT_COLR_PAINTFORMAT_SWEEP_GRADIENT}},   q{8}},
			{{q{glyph},           q{FT_COLR_PAINTFORMAT_GLYPH}},            q{10}},
			{{q{colrGlyph},       q{FT_COLR_PAINTFORMAT_COLR_GLYPH}},       q{11}},
			{{q{transform},       q{FT_COLR_PAINTFORMAT_TRANSFORM}},        q{12}},
			{{q{translate},       q{FT_COLR_PAINTFORMAT_TRANSLATE}},        q{14}},
			{{q{scale},           q{FT_COLR_PAINTFORMAT_SCALE}},            q{16}},
			{{q{rotate},          q{FT_COLR_PAINTFORMAT_ROTATE}},           q{24}},
			{{q{skew},            q{FT_COLR_PAINTFORMAT_SKEW}},             q{28}},
			{{q{composite},       q{FT_COLR_PAINTFORMAT_COMPOSITE}},        q{32}},
			{{q{max},             q{FT_COLR_PAINT_FORMAT_MAX}},             q{33}},
			{{q{unsupported},     q{FT_COLR_PAINTFORMAT_UNSUPPORTED}},      q{255}},
		];
		return ret;
	}()));
	
	struct FT_ColourStopIterator{
		uint numColourStops;
		uint currentColourStop;
		alias num_colour_stops = numColourStops;
		alias num_color_stops = numColourStops;
		alias numColorStops = numColourStops;
		alias current_colour_stop = currentColourStop;
		alias current_color_stop = currentColourStop;
		alias currentColorStop = currentColourStop;
		ubyte* p;
	}
	alias FT_ColorStopIterator = FT_ColourStopIterator;
	
	struct FT_ColourIndex{
		ushort palette_index;
		FT_F2Dot14 alpha;
	}
	alias FT_ColorIndex = FT_ColourIndex;
	
	struct FT_ColourStop{
		static if(ftSupport >= FTSupport.v2_13){
			FT_Fixed stopOffset;
		}else{
			FT_F2Dot14 stopOffset;
		}
		alias stop_offset = stopOffset;
		FT_ColourIndex colour;
		alias color = colour;
	}
	alias FT_ColorStop = FT_ColourStop;
	
	mixin(makeEnumBind(q{FT_PaintExtend}, members: (){
		EnumMember[] ret = [
			{{q{pad},      q{FT_COLR_PAINT_EXTEND_PAD}},      q{0}},
			{{q{repeat},   q{FT_COLR_PAINT_EXTEND_REPEAT}},   q{1}},
			{{q{reflect},  q{FT_COLR_PAINT_EXTEND_REFLECT}},  q{2}},
		];
		return ret;
	}()));
	
	struct FT_ColourLine{
		FT_PaintExtend extend;
		FT_ColorStopIterator colourStopIterator;
		alias colorStopIterator = colourStopIterator;
	}
	alias FT_ColorLine = FT_ColourLine;
	
	struct FT_Affine23{
		FT_Fixed xx, xy, dx;
		FT_Fixed yx, yy, dy;
	}
	
	mixin(makeEnumBind(q{FT_Composite_Mode}, aliases: [q{FT_Composite}], members: (){
		EnumMember[] ret = [
			{{q{clear},          q{FT_COLR_COMPOSITE_CLEAR}},           q{0}},
			{{q{src},            q{FT_COLR_COMPOSITE_SRC}},             q{1}},
			{{q{dest},           q{FT_COLR_COMPOSITE_DEST}},            q{2}},
			{{q{srcOver},        q{FT_COLR_COMPOSITE_SRC_OVER}},        q{3}},
			{{q{destOver},       q{FT_COLR_COMPOSITE_DEST_OVER}},       q{4}},
			{{q{srcIn},          q{FT_COLR_COMPOSITE_SRC_IN}},          q{5}},
			{{q{destIn},         q{FT_COLR_COMPOSITE_DEST_IN}},         q{6}},
			{{q{srcOut},         q{FT_COLR_COMPOSITE_SRC_OUT}},         q{7}},
			{{q{destOut},        q{FT_COLR_COMPOSITE_DEST_OUT}},        q{8}},
			{{q{srcAtop},        q{FT_COLR_COMPOSITE_SRC_ATOP}},        q{9}},
			{{q{destAtop},       q{FT_COLR_COMPOSITE_DEST_ATOP}},       q{10}},
			{{q{xor},            q{FT_COLR_COMPOSITE_XOR}},             q{11}},
			{{q{screen},         q{FT_COLR_COMPOSITE_SCREEN}},          q{12}},
			{{q{overlay},        q{FT_COLR_COMPOSITE_OVERLAY}},         q{13}},
			{{q{darken},         q{FT_COLR_COMPOSITE_DARKEN}},          q{14}},
			{{q{lighten},        q{FT_COLR_COMPOSITE_LIGHTEN}},         q{15}},
			{{q{colourDodge},    q{FT_COLR_COMPOSITE_COLOUR_DODGE}},    q{16}, aliases: [q{colorDodge}, q{FT_COLR_COMPOSITE_COLOR_DODGE}]},
			{{q{colourBurn},     q{FT_COLR_COMPOSITE_COLOUR_BURN}},     q{17}, aliases: [q{colorBurn}, q{FT_COLR_COMPOSITE_COLOR_BURN}]},
			{{q{hardLight},      q{FT_COLR_COMPOSITE_HARD_LIGHT}},      q{18}},
			{{q{softLight},      q{FT_COLR_COMPOSITE_SOFT_LIGHT}},      q{19}},
			{{q{difference},     q{FT_COLR_COMPOSITE_DIFFERENCE}},      q{20}},
			{{q{exclusion},      q{FT_COLR_COMPOSITE_EXCLUSION}},       q{21}},
			{{q{multiply},       q{FT_COLR_COMPOSITE_MULTIPLY}},        q{22}},
			{{q{hslHue},         q{FT_COLR_COMPOSITE_HSL_HUE}},         q{23}},
			{{q{hslSaturation},  q{FT_COLR_COMPOSITE_HSL_SATURATION}},  q{24}},
			{{q{hslColour},      q{FT_COLR_COMPOSITE_HSL_COLOUR}},      q{25}, aliases: [q{hslColor}, q{FT_COLR_COMPOSITE_HSL_COLOR}]},
			{{q{hslLuminosity},  q{FT_COLR_COMPOSITE_HSL_LUMINOSITY}},  q{26}},
			{{q{max},            q{FT_COLR_COMPOSITE_MAX}},             q{27}},
		];
		return ret;
	}()));
	
	struct FT_OpaquePaint{
		ubyte* p;
		FT_Bool insertRootTransform;
		alias insert_root_transform = insertRootTransform;
	}
	
	struct FT_PaintColrLayers{
		FT_LayerIterator layerIterator;
		alias layer_iterator = layerIterator;
	}
	
	struct FT_PaintSolid{
		FT_ColorIndex colour;
		alias color = colour;
	}
	
	struct FT_PaintLinearGradient{
		FT_ColourLine colourLine;
		alias colourline = colourLine;
		alias colorline = colourLine;
		alias colorLine = colourLine;
		FT_Vector p0;
		FT_Vector p1;
		FT_Vector p2;
	}
	
	struct FT_PaintRadialGradient{
		FT_ColourLine colourLine;
		alias colourline = colourLine;
		alias colorline = colourLine;
		alias colorLine = colourLine;
		FT_Vector c0;
		ushort r0;
		FT_Vector c1;
		ushort r1;
	}
	
	struct FT_PaintSweepGradient{
		FT_ColourLine colourLine;
		alias colourline = colourLine;
		alias colorline = colourLine;
		alias colorLine = colourLine;
		FT_Vector centre;
		alias center = centre;
		FT_Fixed start_angle;
		FT_Fixed end_angle;
		alias start_angle = startAngle;
		alias end_angle = endAngle;
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
		FT_Fixed scaleX;
		FT_Fixed scaleY;
		alias scale_x = scaleX;
		alias scale_y = scaleY;
		FT_Fixed centreX;
		FT_Fixed centreY;
		alias centerX = centreX;
		alias center_x = centerX;
		alias centre_x = centreX;
		alias centerY = centreY;
		alias center_y = centerY;
		alias centre_y = centreY;
	}
	
	struct FT_PaintRotate{
		FT_OpaquePaint paint;
		FT_Fixed angle;
		FT_Fixed centreX;
		FT_Fixed centreY;
		alias centerX = centreX;
		alias center_x = centerX;
		alias centre_x = centreX;
		alias centerY = centreY;
		alias center_y = centerY;
		alias centre_y = centreY;
	}
	
	struct FT_PaintSkew{
		FT_OpaquePaint paint;
		FT_Fixed xSkewAngle;
		FT_Fixed ySkewAngle;
		alias x_skew_angle = xSkewAngle;
		alias y_skew_angle = ySkewAngle;
		FT_Fixed centreX;
		FT_Fixed centreY;
		alias centerX = centreX;
		alias center_x = centerX;
		alias centre_x = centreX;
		alias centerY = centreY;
		alias center_y = centerY;
		alias centre_y = centreY;
	}
	
	struct FT_PaintComposite{
		FT_OpaquePaint sourcePaint;
		FT_Composite_Mode compositeMode;
		FT_OpaquePaint backdropPaint;
		alias source_paint = sourcePaint;
		alias composite_mode = compositeMode;
		alias backdrop_paint = backdropPaint;
	}
	
	struct FT_COLR_Paint{
		FT_PaintFormat format;
		union{
			FT_PaintColrLayers colrLayers;
			alias colr_layers = colrLayers;
			FT_PaintGlyph glyph;
			FT_PaintSolid solid;
			FT_PaintLinearGradient linearGradient;
			FT_PaintRadialGradient radialGradient;
			FT_PaintSweepGradient sweepGradient;
			alias linear_gradient = linearGradient;
			alias radial_gradient = radialGradient;
			alias sweep_gradient = sweepGradient;
			FT_PaintTransform transform;
			FT_PaintTranslate translate;
			FT_PaintScale scale;
			FT_PaintRotate rotate;
			FT_PaintSkew skew;
			FT_PaintComposite composite;
			FT_PaintColrGlyph colrGlyph;
			alias colr_glyph = colrGlyph;
		}
	}
	
	mixin(makeEnumBind(q{FT_Colour_Root_Transform}, aliases: [q{FT_Color_Root_Transform}], members: (){
		EnumMember[] ret = [
			{{q{include},  q{FT_COLOUR_INCLUDE_ROOT_TRANSFORM}}, aliases: [{c: q{FT_COLOR_INCLUDE_ROOT_TRANSFORM}}]},
			{{q{none},     q{FT_COLOUR_NO_ROOT_TRANSFORM}}, aliases: [{c: q{FT_COLOR_NO_ROOT_TRANSFORM}}]},
			{{q{max},      q{FT_COLOUR_ROOT_TRANSFORM_MAX}}, aliases: [{c: q{FT_COLOR_ROOT_TRANSFORM_MAX}}]},
		];
		return ret;
	}()));
}

mixin(joinFnBinds((){
	FnBind[] ret;
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
			{q{FT_Error}, q{FT_Palette_Data_Get}, q{FT_Face face, FT_Palette_Data* aPalette}},
			{q{FT_Error}, q{FT_Palette_Select}, q{FT_Face face, ushort paletteIndex, FT_Colour* aPalette}},
			{q{FT_Error}, q{FT_Palette_Set_Foreground_Color}, q{FT_Face face, FT_Colour foregroundColour}, aliases: [q{FT_Palette_Set_Foreground_Colour}]},
			{q{FT_Bool}, q{FT_Get_Color_Glyph_Layer}, q{FT_Face face, uint baseGlyph, uint* aGlyphIndex, uint* aColourIndex, FT_LayerIterator* iterator}, aliases: [q{FT_Get_Colour_Glyph_Layer}]},
		];
		ret ~= add;
	}
	if(ftSupport >= FTSupport.v2_11){
		FnBind[] add = [
			{q{FT_Bool}, q{FT_Get_Color_Glyph_Paint}, q{FT_Face face, uint baseGlyph, FT_Color_Root_Transform rootTransform, FT_OpaquePaint* paint}, aliases: [q{FT_Get_Colour_Glyph_Paint}]},
			{q{FT_Bool}, q{FT_Get_Paint_Layers}, q{FT_Face face, FT_LayerIterator* iterator, FT_OpaquePaint* paint}},
			{q{FT_Bool}, q{FT_Get_Colorline_Stops}, q{FT_Face face, FT_ColourStop* colourStop, FT_ColourStopIterator iterator}, aliases: [q{FT_Get_Colourline_Stops}]},
			{q{FT_Bool}, q{FT_Get_Paint}, q{FT_Face face, FT_OpaquePaint opaquePaint, FT_COLR_Paint* paint}},
		];
		ret ~= add;
	}
	return ret;
}()));
