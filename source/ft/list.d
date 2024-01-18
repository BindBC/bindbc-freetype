/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.list;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.system;
import ft.types;

extern(C) nothrow{
	alias FT_List_Iterator = FT_Error function(FT_ListNode, void*);
	alias FT_List_Destructor = void function(FT_Memory, void*, void*);
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_ListNode}, q{FT_List_Find}, q{FT_List list, void* data}},
		{q{void}, q{FT_List_Add}, q{FT_List list, FT_ListNode node}},
		{q{void}, q{FT_List_Insert}, q{FT_List list, FT_ListNode node}},
		{q{void}, q{FT_List_Remove}, q{FT_List list, FT_ListNode node}},
		{q{void}, q{FT_List_Up}, q{FT_List list, FT_ListNode node}},
		{q{FT_Error}, q{FT_List_Iterate}, q{FT_List list, FT_List_Iterator iterator, void* user}},
		{q{void}, q{FT_List_Finalize}, q{FT_List list, FT_List_Destructor destroy, FT_Memory memory, void* user}, aliases: ["FT_List_Finalise"]},
	];
	return ret;
}()));
