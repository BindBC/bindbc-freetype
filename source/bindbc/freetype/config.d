/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.freetype.config;

import bindbc.common: Version;

enum FTSupport: Version{
	noLibrary   = Version.none,
	badLibrary  = Version.bad,
	v2_6        = Version(2,6,4),
	v2_7        = Version(2,7,1),
	v2_8        = Version(2,8,1),
	v2_9        = Version(2,9,1),
	v2_10       = Version(2,10,4),
	v2_11       = Version(2,11,1),
	v2_12       = Version(2,12,1),
	v2_13       = Version(2,13,1),
	
	deprecated("Please use `FTSupport.v2_6` instead") ft26  = v2_6,
	deprecated("Please use `FTSupport.v2_7` instead") ft27  = v2_7,
	deprecated("Please use `FTSupport.v2_8` instead") ft28  = v2_8,
	deprecated("Please use `FTSupport.v2_9` instead") ft29  = v2_9,
	deprecated("Please use `FTSupport.v2_10` instead") ft210 = v2_10,
	deprecated("Please use `FTSupport.v2_11` instead") ft211 = v2_11,
}

enum staticBinding = (){
	version(BindBC_Static)      return true;
	else version(BindFT_Static) return true;
	else return false;
}();

enum cStyleEnums = (){
	version(FT_C_Enums_Only)          return true;
	else version(BindBC_D_Enums_Only) return false;
	else version(FT_D_Enums_Only)     return false;
	else return true;
}();

enum dStyleEnums = (){
	version(FT_D_Enums_Only)          return true;
	else version(BindBC_C_Enums_Only) return false;
	else version(FT_C_Enums_Only)     return false;
	else return true;
}();

enum ftSupport = (){
	version(FT_2_13)      return FTSupport.v2_13;
	else version(FT_2_12) return FTSupport.v2_12;
	else version(FT_2_11) return FTSupport.v2_11;
	else version(FT_2_10) return FTSupport.v2_10;
	else version(FT_2_9)  return FTSupport.v2_9;
	else version(FT_2_8)  return FTSupport.v2_8;
	else version(FT_2_7)  return FTSupport.v2_7;
	
	else version(FT_211)  return FTSupport.v2_11;
	else version(FT_210)  return FTSupport.v2_10;
	else version(FT_29)   return FTSupport.v2_9;
	else version(FT_28)   return FTSupport.v2_8;
	else version(FT_27)   return FTSupport.v2_7;
	else                  return FTSupport.v2_6;
}();

enum enableBZIP2 = (){
	version(OpenBSD)       return false;
	else version(Posix)    return true;
	else version(FT_BZIP2) return true;
	else return false;
}();

// config/ftconfg.h
deprecated("Please use `short` instead") alias FT_Int16 = short;
deprecated("Please use `ushort` instead") alias FT_UInt16 = ushort;
deprecated("Please use `int` instead") alias FT_Int32 = int;
deprecated("Please use `uint` instead") alias FT_UInt32 = uint;
alias FT_Fast = int;
alias FT_UFast = uint;
deprecated("Please use `long` instead") alias FT_Int64 = long;
deprecated("Please use `ulong` instead") alias FT_Uint64 = ulong;
