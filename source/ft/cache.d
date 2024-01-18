/+
+            Copyright 2023 – 2024 Aya Partridge
+          Copyright 2019 - 2022 Michael D. Parker
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module ft.cache;

import bindbc.freetype.config;
import bindbc.freetype.codegen;

import ft;
import ft.glyph;
import ft.types;

alias FTC_FaceID = FT_Pointer;
extern(C) alias FTC_Face_Requester = FT_Error function(FTC_FaceID, FT_Library, FT_Pointer, FT_Face*) nothrow;

struct FTC_ManagerRec;
struct FTC_NodeRec;

alias FTC_Manager = FTC_ManagerRec*;
alias FTC_Node = FTC_NodeRec*;

struct FTC_ScalerRec{
	FTC_FaceID face_id;
	uint width;
	uint height;
	int pixel;
	uint x_res;
	uint y_res;
}

alias FTC_Scaler = FTC_ScalerRec*;

struct FTC_CMapCacheRec;
alias FTC_CMapCache = FTC_CMapCacheRec*;

struct FTC_ImageTypeRec{
	FTC_FaceID face_id;
	uint width;
	uint height;
	int flags;
}

alias FTC_ImageType = FTC_ImageTypeRec*;

struct FTC_ImageCacheRec;
alias FTC_ImageCache = FTC_ImageCacheRec*;

alias FTC_SBit = FTC_SBitRec*;

struct FTC_SBitRec{
	ubyte width;
	ubyte height;
	byte left;
	byte top;
	ubyte format;
	ubyte max_grays;
	short pitch;
	byte xadvance;
	byte yadvance;
	ubyte* buffer;
}

struct FTC_SBitCacheRec;
alias FTC_SBitCache = FTC_SBitCacheRec*;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FTC_Manager_New}, q{FT_Library library, uint max_faces, uint max_sizes, FT_ULong max_bytes, FTC_Face_Requester requester, FT_Pointer req_data, FTC_Manager* amanager}},
		{q{void}, q{FTC_Manager_Reset}, q{FTC_Manager manager}},
		{q{void}, q{FTC_Manager_Done}, q{FTC_Manager manager}},
		{q{FT_Error}, q{FTC_Manager_LookupFace}, q{FTC_Manager manager, FTC_FaceID face_id, FT_Face* aface}},
		{q{FT_Error}, q{FTC_Manager_LookupSize}, q{FTC_Manager manager, FTC_Scaler sacler, FT_Size* asize}},
		{q{void}, q{FTC_Node_Unref}, q{FTC_Node node, FTC_Manager manager}},
		{q{void}, q{FTC_Manager_RemoveFaceID}, q{FTC_Manager manager, FTC_FaceID face_id}},
		{q{FT_Error}, q{FTC_CMapCache_New}, q{FTC_Manager manager, FTC_CMapCache* acache}},
		{q{uint}, q{FTC_CMapCache_Lookup}, q{FTC_CMapCache cache, FTC_FaceID face_id, int cmap_index, uint char_code}},
		{q{FT_Error}, q{FTC_ImageCache_New}, q{FTC_Manager manager, FTC_ImageCache* acache}},
		{q{FT_Error}, q{FTC_ImageCache_Lookup}, q{FTC_ImageCache cache, FTC_ImageType type, uint gindex, FT_Glyph* aglyph, FTC_Node* anode}},
		{q{FT_Error}, q{FTC_ImageCache_LookupScaler}, q{FTC_ImageCache cache, FTC_Scaler scaler, FT_ULong load_flags, uint gindex, FT_Glyph* aglyph, FTC_Node* anode}},
		{q{FT_Error}, q{FTC_SBitCache_New}, q{FTC_Manager manager, FTC_SBitCache* acache}},
		{q{FT_Error}, q{FTC_SBitCache_Lookup}, q{FTC_SBitCache cache, FTC_ImageType type, uint gindex, FTC_SBit* sbit, FTC_Node* anode}},
		{q{FT_Error}, q{FTC_SBitCache_LookupScaler}, q{FTC_SBitCache cache, FTC_Scaler scaler, FT_ULong load_flags, uint gindex, FTC_SBit* sbit, FTC_Node* anode}},	];
	return ret;
}()));
