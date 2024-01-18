/+
+            Copyright 2023 – 2024 Aya Partridge
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
	FT_ULong module_flags;
	FT_Long module_size;
	char* module_name;
	FT_Fixed module_version;
	FT_Fixed module_requires;
	void* module_interface;
	FT_Module_Constructor module_init;
	FT_Module_Destructor module_done;
	FT_Module_Requester get_interface;
}

import bindbc.common: Version;
static if(ftSupport >= Version(2,10,1)){
	extern(C) nothrow alias FT_DebugHook_Func = FT_Error function(void*);
}else{
	extern(C) nothrow alias FT_DebugHook_Func = void function(void*);
}

alias FT_TrueTypeEngineType = int;
enum: FT_TrueTypeEngineType{
	FT_TRUETYPE_ENGINE_TYPE_NONE        = 0,
	FT_TRUETYPE_ENGINE_TYPE_UNPATENTED  = 1,
	FT_TRUETYPE_ENGINE_TYPE_PATENTED    = 2,
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Add_Module}, q{FT_Library library, const(FT_Module_Class)* clazz}},
		{q{FT_Module}, q{FT_Get_Module}, q{FT_Library library, const(char)* module_name}},
		{q{FT_Error}, q{FT_Remove_Module}, q{FT_Library library, FT_Module module_}},
		{q{FT_Error}, q{FT_Property_Set}, q{FT_Library library, const(char)* module_name, const(char)* property_name, const(void)* value}},
		{q{FT_Error}, q{FT_Property_Get}, q{FT_Library library, const(char)* module_name, const(char)* property_name, void* value}},
		{q{FT_Error}, q{FT_Reference_Library}, q{FT_Library library}},
		{q{FT_Error}, q{FT_New_Library}, q{FT_Memory memory, FT_Library* alibrary}},
		{q{FT_Error}, q{FT_Done_Library}, q{FT_Library library}},
		{q{void}, q{FT_Set_Debug_Hook}, q{FT_Library library, uint hook_index, FT_DebugHook_Func debug_hook}},
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
