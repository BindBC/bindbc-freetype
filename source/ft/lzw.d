/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.lzw;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft.system;
import ft.types;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FT_Stream_OpenLZW}, q{FT_Stream stream, FT_Stream source}},
	];
	return ret;
}()));
