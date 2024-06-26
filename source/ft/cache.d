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
alias FTC_Face_Requester = extern(C) FT_Error function(FTC_FaceID, FT_Library, FT_Pointer, FT_Face*) nothrow;

struct FTC_ManagerRec;
struct FTC_NodeRec;

alias FTC_Manager = FTC_ManagerRec*;
alias FTC_Node = FTC_NodeRec*;

struct FTC_ScalerRec{
	FTC_FaceID faceID;
	alias face_id = faceID;
	uint width;
	uint height;
	int pixel;
	uint xRes;
	uint yRes;
	alias x_res = xRes;
	alias y_res = yRes;
}

alias FTC_Scaler = FTC_ScalerRec*;

struct FTC_CMapCacheRec;
alias FTC_CMapCache = FTC_CMapCacheRec*;

struct FTC_ImageTypeRec{
	FTC_FaceID faceID;
	alias face_id = faceID;
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
	ubyte maxGrays;
	alias max_grays = maxGrays;
	short pitch;
	byte xAdvance;
	byte yAdvance;
	alias xadvance = xAdvance;
	alias yadvance = yAdvance;
	ubyte* buffer;
}

struct FTC_SBitCacheRec;
alias FTC_SBitCache = FTC_SBitCacheRec*;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{FT_Error}, q{FTC_Manager_New}, q{FT_Library library, uint maxFaces, uint maxSizes, FT_ULong maxBytes, FTC_Face_Requester requester, FT_Pointer reqData, FTC_Manager* aManager}},
		{q{void}, q{FTC_Manager_Reset}, q{FTC_Manager manager}},
		{q{void}, q{FTC_Manager_Done}, q{FTC_Manager manager}},
		{q{FT_Error}, q{FTC_Manager_LookupFace}, q{FTC_Manager manager, FTC_FaceID faceID, FT_Face* aFace}},
		{q{FT_Error}, q{FTC_Manager_LookupSize}, q{FTC_Manager manager, FTC_Scaler sacler, FT_Size* aSize}},
		{q{void}, q{FTC_Node_Unref}, q{FTC_Node node, FTC_Manager manager}},
		{q{void}, q{FTC_Manager_RemoveFaceID}, q{FTC_Manager manager, FTC_FaceID faceID}},
		{q{FT_Error}, q{FTC_CMapCache_New}, q{FTC_Manager manager, FTC_CMapCache* aCache}},
		{q{uint}, q{FTC_CMapCache_Lookup}, q{FTC_CMapCache cache, FTC_FaceID faceID, int cMapIndex, uint charCode}},
		{q{FT_Error}, q{FTC_ImageCache_New}, q{FTC_Manager manager, FTC_ImageCache* aCache}},
		{q{FT_Error}, q{FTC_ImageCache_Lookup}, q{FTC_ImageCache cache, FTC_ImageType type, uint gIndex, FT_Glyph* aGlyph, FTC_Node* aNode}},
		{q{FT_Error}, q{FTC_ImageCache_LookupScaler}, q{FTC_ImageCache cache, FTC_Scaler scaler, FT_ULong loadFlags, uint gIndex, FT_Glyph* aGlyph, FTC_Node* aNode}},
		{q{FT_Error}, q{FTC_SBitCache_New}, q{FTC_Manager manager, FTC_SBitCache* aCache}},
		{q{FT_Error}, q{FTC_SBitCache_Lookup}, q{FTC_SBitCache cache, FTC_ImageType type, uint gIndex, FTC_SBit* sBit, FTC_Node* aNode}},
		{q{FT_Error}, q{FTC_SBitCache_LookupScaler}, q{FTC_SBitCache cache, FTC_Scaler scaler, FT_ULong loadFlags, uint gIndex, FTC_SBit* sBit, FTC_Node* aNode}},
	];
	return ret;
}()));
