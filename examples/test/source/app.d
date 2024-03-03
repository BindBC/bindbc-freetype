
import core.stdc.stdio;
import bindbc.freetype;

void main(){
	static if(!bindbc.freetype.config.staticBinding){
		if(loadFreeType() != ftSupport){
			import bindbc.loader;
			import core.stdc.stdio: printf;
			foreach(error; errors){
				printf("%s: %s\n", error.error, error.message);
			}
			return;
		}
	}
	FT_Library ftLib;
	FT_Error err;
	err = FT_Init_FreeType(&ftLib);
	if(err){
		printf("Loading error: %s", FT_Error_String(err));
	}
	
	int maj, min, pat;
	FT_Library_Version(ftLib, &maj, &min, &pat);
	assert(maj >= 2);
	assert(min >= 13);
	
	FT_Face ftFace;
	enum fontPath = {
		version(linux)        return "/usr/share/fonts/truetype/noto/NotoSans-Regular.ttf";
		else version(OSX)     static assert(0, "No font path set for macOS"); //return "";
		else version(Windows) static assert(0, "No font path set for Windows"); //return "";
		else static assert(0, "No font path for this operating system.");
	}();
	FT_New_Face(ftLib, fontPath, 0, &ftFace);
	assert(ftFace !is null, "FreeType couldn't load font");
	
	err = FT_Load_Glyph(ftFace, FT_Get_Char_Index(ftFace, 'A'), FT_LOAD_DEFAULT);
	if(err){
		printf("Loading error: %s", FT_Error_String(err));
	}
	
	FT_GlyphSlot_Embolden(ftFace.glyph);
	
	FT_Done_Face(ftFace);
	FT_Done_FreeType(ftLib);
}