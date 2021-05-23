
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftcache;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.ftglyph,
       bindbc.freetype.bind.fttypes;

alias FTC_FaceID = FT_Pointer;
extern(C) nothrow alias FTC_Face_Requester = FT_Error function(FTC_FaceID,FT_Library,FT_Pointer,FT_Face*);

struct FTC_ManagerRec;
struct FTC_NodeRec;

alias FTC_Manager = FTC_ManagerRec*;
alias FTC_Node = FTC_NodeRec*;

struct FTC_ScalerRec {
    FTC_FaceID face_id;
    FT_UInt width;
    FT_UInt height;
    FT_Int pixel;
    FT_UInt x_res;
    FT_UInt y_res;
}

alias FTC_Scaler = FTC_ScalerRec*;

struct FTC_CMapCacheRec;
alias FTC_CMapCache = FTC_CMapCacheRec*;

struct FTC_ImageTypeRec {
    FTC_FaceID face_id;
    FT_UInt width;
    FT_UInt height;
    FT_Int32 flags;
}

alias FTC_ImageType = FTC_ImageTypeRec*;

struct FTC_ImageCacheRec;
alias FTC_ImageCache = FTC_ImageCacheRec*;

alias FTC_SBit = FTC_SBitRec*;

struct FTC_SBitRec {
    FT_Byte width;
    FT_Byte height;
    FT_Char left;
    FT_Char top;
    FT_Byte format;
    FT_Byte max_grays;
    FT_Short pitch;
    FT_Char xadvance;
    FT_Char yadvance;
    FT_Byte* buffer;
}

struct FTC_SBitCacheRec;
alias FTC_SBitCache = FTC_SBitCacheRec*;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_Error FTC_Manager_New(FT_Library library, FT_UInt max_faces, FT_UInt max_sizes, FT_ULong max_bytes, FTC_Face_Requester requester, FT_Pointer req_data, FTC_Manager* amanager);
        void FTC_Manager_Reset(FTC_Manager manager);
        void FTC_Manager_Done(FTC_Manager manager);
        FT_Error FTC_Manager_LookupFace(FTC_Manager manager, FTC_FaceID face_id, FT_Face* aface);
        FT_Error FTC_Manager_LookupSize(FTC_Manager manager,FTC_Scaler sacler, FT_Size* asize);
        void FTC_Node_Unref(FTC_Node node, FTC_Manager manager);
        void FTC_Manager_RemoveFaceID(FTC_Manager manager, FTC_FaceID face_id);
        FT_Error FTC_CMapCache_New(FTC_Manager manager, FTC_CMapCache* acache);
        FT_UInt FTC_CMapCache_Lookup(FTC_CMapCache cache, FTC_FaceID face_id, FT_Int cmap_index, FT_UInt32 char_code);
        FT_Error FTC_ImageCache_New(FTC_Manager manager, FTC_ImageCache* acache);
        FT_Error FTC_ImageCache_Lookup(FTC_ImageCache cache, FTC_ImageType type, FT_UInt gindex, FT_Glyph* aglyph, FTC_Node* anode);
        FT_Error FTC_ImageCache_LookupScaler(FTC_ImageCache cache, FTC_Scaler scaler, FT_ULong load_flags, FT_UInt gindex, FT_Glyph* aglyph, FTC_Node* anode);
        FT_Error FTC_SBitCache_New(FTC_Manager manager, FTC_SBitCache* acache);
        FT_Error FTC_SBitCache_Lookup(FTC_SBitCache cache, FTC_ImageType type, FT_UInt gindex, FTC_SBit* sbit, FTC_Node* anode);
        FT_Error FTC_SBitCache_LookupScaler(FTC_SBitCache cache, FTC_Scaler scaler, FT_ULong load_flags, FT_UInt gindex, FTC_SBit* sbit, FTC_Node* anode);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFTC_Manager_New = FT_Error function(FT_Library library, FT_UInt max_faces, FT_UInt max_sizes, FT_ULong max_bytes, FTC_Face_Requester requester, FT_Pointer req_data, FTC_Manager* amanager);
        alias pFTC_Manager_Reset = void function(FTC_Manager manager);
        alias pFTC_Manager_Done = void function(FTC_Manager manager);
        alias pFTC_Manager_LookupFace = FT_Error function(FTC_Manager manager, FTC_FaceID face_id, FT_Face* aface);
        alias pFTC_Manager_LookupSize = FT_Error function(FTC_Manager manager, FTC_Scaler scaler, FT_Size* asize);
        alias pFTC_Node_Unref = void function(FTC_Node node, FTC_Manager manager);
        alias pFTC_Manager_RemoveFaceID = void function(FTC_Manager manager,FTC_FaceID face_id);
        alias pFTC_CMapCache_New = FT_Error function(FTC_Manager manager,FTC_CMapCache* acache);
        alias pFTC_CMapCache_Lookup = FT_UInt function(FTC_CMapCache cache, FTC_FaceID face_id, FT_Int cmap_index, FT_UInt32 char_code);
        alias pFTC_ImageCache_New = FT_Error function(FTC_Manager manager, FTC_ImageCache* acache);
        alias pFTC_ImageCache_Lookup = FT_Error function(FTC_ImageCache cache, FTC_ImageType type, FT_UInt gindex, FT_Glyph* aglyph, FTC_Node* anode);
        alias pFTC_ImageCache_LookupScaler = FT_Error function(FTC_ImageCache cache, FTC_Scaler scaler, FT_ULong load_flags, FT_UInt gindex, FT_Glyph* aglyph, FTC_Node* anode);
        alias pFTC_SBitCache_New = FT_Error function(FTC_Manager manager, FTC_SBitCache* acache);
        alias pFTC_SBitCache_Lookup = FT_Error function(FTC_SBitCache cache, FTC_ImageType type, FT_UInt gindex, FTC_SBit* sbit, FTC_Node* anode);
        alias pFTC_SBitCache_LookupScaler = FT_Error function(FTC_SBitCache cache, FTC_Scaler scaler, FT_ULong load_flags, FT_UInt gindex, FTC_SBit* sbit, FTC_Node* anode);
    }

    __gshared {
        pFTC_Manager_New FTC_Manager_New;
        pFTC_Manager_Reset FTC_Manager_Reset;
        pFTC_Manager_Done FTC_Manager_Done;
        pFTC_Manager_LookupFace FTC_Manager_LookupFace;
        pFTC_Manager_LookupSize FTC_Manager_LookupSize;
        pFTC_Node_Unref FTC_Node_Unref;
        pFTC_Manager_RemoveFaceID FTC_Manager_RemoveFaceID;
        pFTC_CMapCache_New FTC_CMapCache_New;
        pFTC_CMapCache_Lookup FTC_CMapCache_Lookup;
        pFTC_ImageCache_New FTC_ImageCache_New;
        pFTC_ImageCache_Lookup FTC_ImageCache_Lookup;
        pFTC_ImageCache_LookupScaler FTC_ImageCache_LookupScaler;
        pFTC_SBitCache_New FTC_SBitCache_New;
        pFTC_SBitCache_Lookup FTC_SBitCache_Lookup;
        pFTC_SBitCache_LookupScaler FTC_SBitCache_LookupScaler;
    }
}