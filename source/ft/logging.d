/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.logging;

import bindbc.freetype.config;

static if(ftSupport >= FTSupport.v2_11):
import bindbc.common.types: va_list;
import ft.types;

extern(C) nothrow alias FT_Custom_Log_Handler = void function(const(char)* ft_component, const(char)* fmt, va_list args);

static if(staticBinding){
	extern(C) nothrow @nogc{
		void FT_Trace_Set_Level(const(char)* tracing_level);
		void FT_Trace_Set_Default_Level();
		void FT_Set_Log_Handler(FT_Custom_Log_Handler handler);
		void FT_Set_Default_Log_Handler();
	}
}else{
	extern(C) nothrow @nogc{
		alias pFT_Trace_Set_Level = void function(const(char)* tracing_level);
		alias pFT_Trace_Set_Default_Level = void function();
		alias pFT_Set_Log_Handler = void function(FT_Custom_Log_Handler handler);
		alias pFT_Set_Default_Log_Handler = void function();
	}
	__gshared{
		pFT_Trace_Set_Level FT_Trace_Set_Level;
		pFT_Trace_Set_Default_Level FT_Trace_Set_Default_Level;
		pFT_Set_Log_Handler FT_Set_Log_Handler;
		pFT_Set_Default_Log_Handler FT_Set_Default_Log_Handler;
	}
}
