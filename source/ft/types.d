/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.types;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import bindbc.common.types: c_long, c_ulong;

alias FT_Bool = ubyte;
alias FT_FWord = short;
alias FT_UFWord = ushort;
deprecated("Please use `byte` or `char` instead") alias FT_Char = char;
deprecated("Please use `ubyte` instead") alias FT_Byte = ubyte;
deprecated("Please use `ubyte*` instead") alias FT_Bytes = ubyte*;
alias FT_Tag = uint;
deprecated("Please use `char` instead") alias FT_String = char;
deprecated("Please use `short` instead") alias FT_Short = short;
deprecated("Please use `ushort` instead") alias FT_UShort = ushort;
deprecated("Please use `int` instead") alias FT_Int = int;
deprecated("Please use `uint` instead") alias FT_UInt = uint;
alias FT_Long = c_long;
alias FT_ULong = c_ulong;
alias FT_F2Dot14 = short;
alias FT_F26Dot6 = c_long;
alias FT_Fixed = c_long;
alias FT_Error = int;
alias FT_Pointer = void*;
deprecated("Please use `size_t` instead") alias FT_Offset = size_t;
deprecated("Please use `ptrdiff_t` instead") alias FT_PtrDist = ptrdiff_t;

struct FT_UnitVector{
	FT_F2Dot14 x;
	FT_F2Dot14 y;
}

struct FT_Matrix{
	FT_Fixed xx, xy;
	FT_Fixed yx, yy;
}

struct FT_Data{
	const(ubyte)* pointer;
	int length;
}

alias FT_Generic_Finalizer = extern(C) void function(void*) nothrow;
alias FT_Generic_Finaliser = FT_Generic_Finalizer;

struct FT_Generic{
	void* data;
	FT_Generic_Finalizer finalizer;
	alias finaliser = finalizer;
}

FT_Tag FT_MAKE_TAG(char x1, char x2, char x3, char x4) nothrow @nogc pure @safe{
	return cast(uint)((x1 << 24) | (x2 << 16) | (x3 << 8) | x4);
}

alias FT_ListNode = FT_ListNodeRec*;

struct FT_ListNodeRec{
	FT_ListNode prev;
	FT_ListNode next;
	void* data;
}

alias FT_List = FT_ListRec*;

struct FT_ListRec{
	FT_ListNode head;
	FT_ListNode tail;
}

mixin(joinFnBinds((){
	FnBind[] ret;
	return ret;
}()));
