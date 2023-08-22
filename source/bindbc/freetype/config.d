/+
+                Copyright 2023 Aya Partridge
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
	
	//These will become deprecated later.
	ft26  = v2_6,
	ft27  = v2_7,
	ft28  = v2_8,
	ft29  = v2_9,
	ft210 = v2_10,
	ft211 = v2_11,
}

enum staticBinding = (){
	version(BindBC_Static)      return true;
	else version(BindFT_Static) return true;
	else return false;
}();

enum ftSupport = (){
	version(FT_2_13)      return FTSupport.v2_13;
	else version(FT_2_12) return FTSupport.v2_12;
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
