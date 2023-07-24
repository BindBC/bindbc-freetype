/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.list;

import bindbc.freetype.config;

import ft.system;
import ft.types;

extern(C) nothrow{
	alias FT_List_Iterator = FT_Error function(FT_ListNode, void*);
	alias FT_List_Destructor = void function(FT_Memory, void*, void*);
}

static if(staticBinding){
	extern(C) nothrow @nogc{
		FT_ListNode FT_List_Find(FT_List list, void* data);
		void FT_List_Add(FT_List list, FT_ListNode node);
		void FT_List_Insert(FT_List list, FT_ListNode node);
		void FT_List_Remove(FT_List list, FT_ListNode node);
		void FT_List_Up(FT_List list, FT_ListNode node);
		FT_Error FT_List_Iterate(FT_List list, FT_List_Iterator iterator, void* user);
		void FT_List_Finalize(FT_List list, FT_List_Destructor destroy, FT_Memory memory, void* user);;
	}
}else{
	extern(C) nothrow @nogc{
		alias da_FT_List_Find = FT_ListNode function(FT_List,void*);
		alias da_FT_List_Add = void function(FT_List list,FT_ListNode node);
		alias da_FT_List_Insert = void function(FT_List list, FT_ListNode node);
		alias da_FT_List_Remove = void function(FT_List list, FT_ListNode node);
		alias da_FT_List_Up = void function(FT_List list, FT_ListNode node);
		alias da_FT_List_Iterate = FT_Error function(FT_List list, FT_List_Iterator iterator, void* user);
		alias da_FT_List_Finalize = void function(FT_List list, FT_List_Destructor destroy, FT_Memory memory, void* user);
	}
	
	__gshared{
		da_FT_List_Find FT_List_Find;
		da_FT_List_Add FT_List_Add;
		da_FT_List_Insert FT_List_Insert;
		da_FT_List_Remove FT_List_Remove;
		da_FT_List_Up FT_List_Up;
		da_FT_List_Iterate FT_List_Iterate;
		da_FT_List_Finalize FT_List_Finalize;
	}
}