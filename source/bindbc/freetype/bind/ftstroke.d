
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftstroke;

import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.ftimage,
       bindbc.freetype.bind.ftglyph,
       bindbc.freetype.bind.ftsystem,
       bindbc.freetype.bind.fttypes;

struct FT_StrokerRec;
alias FT_Stroker = FT_StrokerRec*;

alias FT_Stroker_LineJoin = int;
enum {
    FT_STROKER_LINEJOIN_ROUND = 0,
    FT_STROKER_LINEJOIN_BEVEL,
    FT_STROKER_LINEJOIN_MITER
}

alias FT_Stroker_LineCap = int;
enum {
    FT_STROKER_LINECAP_BUTT = 0,
    FT_STROKER_LINECAP_ROUND,
    FT_STROKER_LINECAP_SQUARE
}

alias FT_StrokerBorder = int;
enum {
    FT_STROKER_BORDER_LEFT = 0,
    FT_STROKER_BORDER_RIGHT
}

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        FT_StrokerBorder FT_Outline_GetInsideBorder(FT_Outline* outline);
        FT_StrokerBorder FT_Outline_GetOutsideBorder(FT_Outline* outline);
        FT_Error FT_Stroker_New(FT_Library library, FT_Stroker* astroker);
        void FT_Stroker_Set(FT_Stroker stroker, FT_Fixed radius, FT_Stroker_LineCap line_cap, FT_Stroker_LineJoin line_join, FT_Fixed miter_limit);
        void FT_Stroker_Rewind(FT_Stroker stroker);
        FT_Error FT_Stroker_ParseOutline(FT_Stroker stroker, FT_Outline* outline, FT_Bool opened);
        FT_Error FT_Stroker_BeginSubPath(FT_Stroker stroker, FT_Vector* to, FT_Bool open);
        FT_Error FT_Stroker_EndSubPath(FT_Stroker stroker);
        FT_Error FT_Stroker_LineTo(FT_Stroker stroker, FT_Vector* to);
        FT_Error FT_Stroker_ConicTo(FT_Stroker stroker, FT_Vector* control, FT_Vector* to);
        FT_Error FT_Stroker_CubicTo(FT_Stroker stroker, FT_Vector* control1, FT_Vector* control2, FT_Vector* to);
        FT_Error FT_Stroker_GetBorderCounts(FT_Stroker stroker, FT_StrokerBorder border, FT_UInt* anum_points, FT_UInt* anum_contours);
        void FT_Stroker_ExportBorder(FT_Stroker stroker, FT_StrokerBorder border, FT_Outline* outline);
        FT_Error FT_Stroker_GetCounts(FT_Stroker stroker, FT_UInt* anum_points, FT_UInt* anum_contours);
        void FT_Stroker_Export(FT_Stroker stroker, FT_Outline* outline);
        void FT_Stroker_Done(FT_Stroker stroker);
        FT_Error FT_Glyph_Stroke(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool destroy);
        FT_Error FT_Glyph_StrokeBorder(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool inside, FT_Bool destroy);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Outline_GetInsideBorder = FT_StrokerBorder function(FT_Outline* outline);
        alias pFT_Outline_GetOutsideBorder = FT_StrokerBorder function(FT_Outline* outline);
        alias pFT_Stroker_New = FT_Error function(FT_Library library, FT_Stroker* astroker);
        alias pFT_Stroker_Set = void function(FT_Stroker stroker, FT_Fixed radius, FT_Stroker_LineCap line_cap, FT_Stroker_LineJoin line_join, FT_Fixed miter_limit);
        alias pFT_Stroker_Rewind = void function(FT_Stroker stroker);
        alias pFT_Stroker_ParseOutline = FT_Error function(FT_Stroker stroker, FT_Outline* outline, FT_Bool opened);
        alias pFT_Stroker_BeginSubPath = FT_Error function(FT_Stroker stroker, FT_Vector* to, FT_Bool open);
        alias pFT_Stroker_EndSubPath = FT_Error function(FT_Stroker stroker);
        alias pFT_Stroker_LineTo = FT_Error function(FT_Stroker stroker, FT_Vector* to);
        alias pFT_Stroker_ConicTo = FT_Error function(FT_Stroker stroker, FT_Vector* control, FT_Vector* to);
        alias pFT_Stroker_CubicTo = FT_Error function(FT_Stroker stroker, FT_Vector* control1, FT_Vector* control2, FT_Vector* to);
        alias pFT_Stroker_GetBorderCounts = FT_Error function(FT_Stroker stroker, FT_StrokerBorder border, FT_UInt* anum_points, FT_UInt* anum_contours);
        alias pFT_Stroker_ExportBorder = void function(FT_Stroker stroker, FT_StrokerBorder border, FT_Outline* outline);
        alias pFT_Stroker_GetCounts = FT_Error function(FT_Stroker stroker, FT_UInt* anum_points, FT_UInt* anum_contours);
        alias pFT_Stroker_Export = void function(FT_Stroker stroker, FT_Outline* outline);
        alias pFT_Stroker_Done = void function(FT_Stroker stroker);
        alias pFT_Glyph_Stroke = FT_Error function(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool destroy);
        alias pFT_Glyph_StrokeBorder = FT_Error function(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool inside, FT_Bool destroy);
    }

    __gshared {
        pFT_Outline_GetInsideBorder FT_Outline_GetInsideBorder;
        pFT_Outline_GetOutsideBorder FT_Outline_GetOutsideBorder;
        pFT_Stroker_New FT_Stroker_New;
        pFT_Stroker_Set FT_Stroker_Set;
        pFT_Stroker_Rewind FT_Stroker_Rewind;
        pFT_Stroker_ParseOutline FT_Stroker_ParseOutline;
        pFT_Stroker_BeginSubPath FT_Stroker_BeginSubPath;
        pFT_Stroker_EndSubPath FT_Stroker_EndSubPath;
        pFT_Stroker_LineTo FT_Stroker_LineTo;
        pFT_Stroker_ConicTo FT_Stroker_ConicTo;
        pFT_Stroker_CubicTo FT_Stroker_CubicTo;
        pFT_Stroker_GetBorderCounts FT_Stroker_GetBorderCounts;
        pFT_Stroker_ExportBorder FT_Stroker_ExportBorder;
        pFT_Stroker_GetCounts FT_Stroker_GetCounts;
        pFT_Stroker_Export FT_Stroker_Export;
        pFT_Stroker_Done FT_Stroker_Done;
        pFT_Glyph_Stroke FT_Glyph_Stroke;
        pFT_Glyph_StrokeBorder FT_Glyph_StrokeBorder;
    }
}