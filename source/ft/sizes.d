/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.sizes;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.types;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_New_Size}, q{FT_Face face, FT_Size* size}},
		{q{FT_Error}, q{FT_Done_Size}, q{FT_Size size}},
		{q{FT_Error}, q{FT_Activate_Size}, q{FT_Size size}},
	];
	return ret;
}()));
