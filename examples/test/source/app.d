
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
}