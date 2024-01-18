/+
+            Copyright 2023 – 2024 Aya Partridge
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
	ushort _version;
	FT_ULong file_size;
	ubyte[60] copyright;
	ushort file_type;
	ushort nominal_point_size;
	ushort vertical_resolution;
	ushort horizontal_resolution;
	ushort ascent;
	ushort internal_leading;
	ushort external_leading;
	ubyte italic;
	ubyte underline;
	ubyte strike_out;
	ushort weight;
	ubyte charset;
	ushort pixel_width;
	ushort pixel_height;
	ubyte pitch_and_family;
	ushort avg_width;
	ushort max_width;
	ubyte first_char;
	ubyte last_char;
	ubyte default_char;
	ubyte break_char;
	ushort bytes_per_row;
	FT_ULong device_offset;
	FT_ULong face_name_offset;
	FT_ULong bits_pointer;
	FT_ULong bits_offset;
	ubyte reserved;
	FT_ULong flags;
	ushort A_space;
	ushort B_space;
	ushort C_space;
	ushort color_table_offset;
	alias colour_table_offset = color_table_offset;
	FT_ULong[4] reserved1;
}

alias FT_WinFNT_Header = FT_WinFNT_HeaderRec*;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Get_WinFNT_Header}, q{FT_Face face, FT_WinFNT_HeaderRec* aheader}},
	];
	return ret;
}()));
