/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.winfnt;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

enum{
	FT_WinFNT_ID_CP1252   = 0,
	FT_WinFNT_ID_DEFAULT  = 1,
	FT_WinFNT_ID_SYMBOL   = 2,
	FT_WinFNT_ID_MAC      = 77,
	FT_WinFNT_ID_CP932    = 128,
	FT_WinFNT_ID_CP949    = 129,
	FT_WinFNT_ID_CP1361   = 130,
	FT_WinFNT_ID_CP936    = 134,
	FT_WinFNT_ID_CP950    = 136,
	FT_WinFNT_ID_CP1253   = 161,
	FT_WinFNT_ID_CP1254   = 162,
	FT_WinFNT_ID_CP1258   = 163,
	FT_WinFNT_ID_CP1255   = 177,
	FT_WinFNT_ID_CP1256   = 178,
	FT_WinFNT_ID_CP1257   = 186,
	FT_WinFNT_ID_CP1251   = 204,
	FT_WinFNT_ID_CP874    = 222,
	FT_WinFNT_ID_CP1250   = 238,
	FT_WinFNT_ID_OEM      = 255,
}


struct FT_WinFNT_HeaderRec{
	ushort version_;
	FT_ULong fileSize;
	alias _version = version_;
	alias file_size = fileSize;
	ubyte[60] copyright;
	ushort fileType;
	ushort nominalPointSize;
	ushort verticalResolution;
	ushort horizontalResolution;
	alias file_type = fileType;
	alias nominal_point_size = nominalPointSize;
	alias vertical_resolution = verticalResolution;
	alias horizontal_resolution = horizontalResolution;
	ushort ascent;
	ushort internalLeading;
	ushort externalLeading;
	alias internal_leading = internalLeading;
	alias external_leading = externalLeading;
	ubyte italic;
	ubyte underline;
	ubyte strikeOut;
	alias strike_out = strikeOut;
	ushort weight;
	ubyte charset;
	ushort pixelWidth;
	ushort pixelHeight;
	ubyte pitchAndFamily;
	ushort avgWidth;
	ushort maxWidth;
	ubyte firstChar;
	ubyte lastChar;
	ubyte defaultChar;
	ubyte breakChar;
	ushort bytesPerRow;
	FT_ULong deviceOffset;
	FT_ULong faceNameOffset;
	FT_ULong bitsPointer;
	FT_ULong bitsOffset;
	alias pixel_width = pixelWidth;
	alias pixel_height = pixelHeight;
	alias pitch_and_family = pitchAndFamily;
	alias avg_width = avgWidth;
	alias max_width = maxWidth;
	alias first_char = firstChar;
	alias last_char = lastChar;
	alias default_char = defaultChar;
	alias break_char = breakChar;
	alias bytes_per_row = bytesPerRow;
	alias device_offset = deviceOffset;
	alias face_name_offset = faceNameOffset;
	alias bits_pointer = bitsPointer;
	alias bits_offset = bitsOffset;
	ubyte reserved;
	FT_ULong flags;
	ushort aSpace;
	ushort bSpace;
	ushort cSpace;
	ushort colourTableOffset;
	alias A_space = aSpace;
	alias B_space = bSpace;
	alias C_space = cSpace;
	alias colour_table_offset = colourTableOffset;
	alias color_table_offset = colourTableOffset;
	alias colorTableOffset = colourTableOffset;
	FT_ULong[4] reserved1;
}

alias FT_WinFNT_Header = FT_WinFNT_HeaderRec*;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_WinFNT_Header}, q{FT_Face face, FT_WinFNT_HeaderRec* aHeader}},
	];
	return ret;
}()));
