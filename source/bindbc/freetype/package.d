/+
+                Copyright 2023 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.freetype;

public import bindbc.freetype.config;
static if(staticBinding) public import bindbc.freetype.dynload;
public import
	ft,
	ft.advanc,
	ft.bbox,
	ft.bdf,
	ft.bitmap,
	ft.bzip2,
	ft.cache,
	ft.cid,
	ft.color,
	ft.driver,
	ft.errdef,
	ft.errors,
	ft.fntfmt,
	ft.gasp,
	ft.glyph,
	ft.gxval,
	ft.gzip,
	ft.image,
	ft.increm,
	ft.lcdfil,
	ft.list,
	ft.logging,
	ft.lzw,
	ft.mm,
	ft.modapi,
	ft.moderr,
	ft.otval,
	ft.outln,
	ft.pfr,
	ft.render,
	ft.sizes,
	ft.snames,
	ft.stroke,
	ft.synth,
	ft.trigon,
	ft.types,
	ft.winfnt,
	ft.t1tables,
	ft.ttnameid,
	ft.tttables,
	ft.tttags;
