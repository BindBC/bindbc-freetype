/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.fntfmt;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{const(char)*}, q{FT_Get_Font_Format}, q{FT_Face face}},
	];
	return ret;
}()));
