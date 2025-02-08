/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.modapi;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.system;
import ft.types;

enum{
	FT_MODULE_FONT_DRIVER           = 0x1,
	FT_MODULE_RENDERER              = 0x2,
	FT_MODULE_HINTER                = 0x4,
	FT_MODULE_STYLER                = 0x8,
	FT_MODULE_DRIVER_SCALABLE       = 0x100,
	FT_MODULE_DRIVER_NO_OUTLINES    = 0x200,
	FT_MODULE_DRIVER_HAS_HINTER     = 0x400,
	FT_MODULE_DRIVER_HINTS_LIGHTLY  = 0x800,
}

alias FT_Module_Interface = FT_Pointer;

extern(C) nothrow{
	alias FT_Module_Constructor = FT_Error function(FT_Module);
	alias FT_Module_Destructor = void function(FT_Module);
	alias FT_Module_Requester = FT_Module_Interface function(FT_Module, const(char)*);
}

struct FT_Module_Class{
	FT_ULong moduleFlags;
	FT_Long moduleSize;
	char* moduleName;
	FT_Fixed moduleVersion;
	FT_Fixed moduleRequires;
	void* moduleInterface;
	FT_Module_Constructor moduleInit;
	FT_Module_Destructor moduleDone;
	FT_Module_Requester getInterface;
	alias module_flags = moduleFlags;
	alias module_size = moduleSize;
	alias module_name = moduleName;
	alias module_version = moduleVersion;
	alias module_requires = moduleRequires;
	alias module_interface = moduleInterface;
	alias module_init = moduleInit;
	alias module_done = moduleDone;
	alias get_interface = getInterface;
}

import bindbc.common: Version;
static if(ftSupport >= Version(2,10,1)){
	extern(C) nothrow alias FT_DebugHook_Func = FT_Error function(void*);
}else{
	extern(C) nothrow alias FT_DebugHook_Func = void function(void*);
}

mixin(makeEnumBind(q{FT_TrueTypeEngineType}, members: (){
	EnumMember[] ret = [
		{{q{none},        q{FT_TRUETYPE_ENGINE_TYPE_NONE}},        q{0}},
		{{q{unpatented},  q{FT_TRUETYPE_ENGINE_TYPE_UNPATENTED}},  q{1}},
		{{q{patented},    q{FT_TRUETYPE_ENGINE_TYPE_PATENTED}},    q{2}},
	];
	return ret;
}()));

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Add_Module}, q{FT_Library library, const(FT_Module_Class)* class_}},
		{q{FT_Module}, q{FT_Get_Module}, q{FT_Library library, const(char)* moduleName}},
		{q{FT_Error}, q{FT_Remove_Module}, q{FT_Library library, FT_Module module_}},
		{q{FT_Error}, q{FT_Property_Set}, q{FT_Library library, const(char)* moduleName, const(char)* propertyName, const(void)* value}},
		{q{FT_Error}, q{FT_Property_Get}, q{FT_Library library, const(char)* moduleName, const(char)* propertyName, void* value}},
		{q{FT_Error}, q{FT_Reference_Library}, q{FT_Library library}},
		{q{FT_Error}, q{FT_New_Library}, q{FT_Memory memory, FT_Library* aLibrary}},
		{q{FT_Error}, q{FT_Done_Library}, q{FT_Library library}},
		{q{void}, q{FT_Set_Debug_Hook}, q{FT_Library library, uint hookIndex, FT_DebugHook_Func debugHook}},
		{q{void}, q{FT_Add_Default_Modules}, q{FT_Library library}},
		{q{FT_TrueTypeEngineType}, q{FT_Get_TrueType_Engine_Type}, q{FT_Library library}},
	];
	if(ftSupport >= FTSupport.v2_8){
		FnBind[] add = [
			{q{void}, q{FT_Set_Default_Properties}, q{FT_Library library}},
		];
		ret ~= add;
	}
	return ret;
}()));
