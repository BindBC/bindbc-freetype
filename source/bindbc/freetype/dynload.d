/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.freetype.dynload;

import bindbc.freetype;

static if(!staticBinding):

import bindbc.loader;

private{
	SharedLib lib;
	FTSupport loadedVersion;
}

@nogc nothrow:
void unloadFreeType(){
	if(lib != invalidHandle){
		lib.unload();
	}
}

FTSupport loadedFreeTypeVersion() @safe{ return loadedVersion; }

bool isFreeTypeLoaded() @safe{
	return lib != invalidHandle;
}

FTSupport loadFreeType(){
	enum libNamesCT = mixin(makeLibPaths(
		["freetype"],
		[
			"Windows": ["freetype-6"],
			"OSX": ["freetype.6"],
		],
		[
			"OSX": ["/usr/X11/lib/", "/opt/X11/lib/"],
		],
	));
	const(char)[][libNamesCT.length] libNames = libNamesCT;
	
	FTSupport ret;
	foreach(name; libNames){
		ret = loadFreeType(name.ptr);
		if(ret != FTSupport.noLibrary && ret != FTSupport.badLibrary) break;
	}
	return ret;
}

FTSupport loadFreeType(const(char)* libName){
	lib = bindbc.loader.load(libName);
	if(lib == invalidHandle){
		return FTSupport.noLibrary;
	}
	
	auto errCount = errorCount();
	loadedVersion = FTSupport.badLibrary;
	
	static foreach(mod; [
		"ft.advanc", "ft.bbox", "ft.bdf", "ft.bitmap", "ft.bzip2", "ft.cache",
		"ft.cid", "ft.color", "ft.driver", "ft.errdef", "ft.errors",
		"ft.fntfmt", "ft.gasp", "ft.glyph", "ft.gxval", "ft.gzip", "ft.image",
		"ft.increm", "ft.lcdfil", "ft.list", "ft.logging", "ft.lzw", "ft.mm",
		"ft.modapi", "ft.moderr", "ft.otval", "ft.outln", "ft", "ft.params",
		"ft.pfr", "ft.render", "ft.sizes", "ft.snames", "ft.stroke",
		"ft.synth", "ft.system", "ft.t1tables", "ft.trigon", "ft.ttnameid",
		"ft.tttables", "ft.tttags", "ft.types", "ft.winfnt",
	]){
		mixin(mod ~ ".bindModuleSymbols(lib);");
	}
	
	if(errCount == errorCount()) loadedVersion = ftSupport; //this is a white-lie in order to maintain some backwards-compatibility :(
	return loadedVersion;
}
