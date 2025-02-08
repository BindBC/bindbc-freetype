/+
+            Copyright 2023 – 2025 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.errors;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.types;

mixin(joinFnBinds((){
	FnBind[] ret;
	if(ftSupport >= FTSupport.v2_10){
		FnBind[] add = [
			{q{const(char)*}, q{FT_Error_String}, q{FT_Error errorCode}},
		];
		ret ~= add;
	}
	return ret;
}()));
