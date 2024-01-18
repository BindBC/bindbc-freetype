/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.logging;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

static if(ftSupport >= FTSupport.v2_11):
import bindbc.common.types: va_list;
import ft.types;

alias FT_Custom_Log_Handler = extern(C) void function(const(char)* ft_component, const(char)* fmt, va_list args) nothrow;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{void}, q{FT_Trace_Set_Level}, q{const(char)* tracing_level}},
		{q{void}, q{FT_Trace_Set_Default_Level}, q{}},
		{q{void}, q{FT_Set_Log_Handler}, q{FT_Custom_Log_Handler handler}},
		{q{void}, q{FT_Set_Default_Log_Handler}, q{}},
	];
	return ret;
}()));
