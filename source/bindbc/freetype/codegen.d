/+
+            Copyright 2023 – 2025 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.freetype.codegen;

import bindbc.freetype.config;
import bindbc.common;

mixin(makeFnBindFns(staticBinding, Version(1,0,0)));
mixin(makeEnumBindFns(cStyleEnums, dStyleEnums));
