
# BindBC-FreeType
This project provides a set of both static and dynamic bindings to
[the FreeType library](https://www.freetype.org/). They are compatible with `@nogc` and `nothrow`, and can be compiled with BetterC compatibility. This package is intended to replace [DerelictFT](https://github.com/DerelictOrg/DerelictFT), which does not provide the same level of compatibility.

| Table of Contents |
|-------------------|
|[License](#license)|
|[FreeType documentation](#freetype-documentation)|
|[Quickstart guide](#quickstart-guide)|
|[Configurations](#configurations)|
|[Library versions](#library-versions)|

## License
BindBC-FreeType&mdash;as well as every other binding in the [BindBC project](https://github.com/BindBC)&mdash;is licensed under the [Boost Software License](https://www.boost.org/LICENSE_1_0.txt).

Bear in mind that you still need to abide by [one of FreeType's licenses](https://freetype.org/license.html) if you use it through these bindings.

## FreeType documentation
This readme describes how to use BindBC-FreeType, *not* FreeType itself. BindBC-FreeType is a direct D binding to the FreeType API, so any existing FreeType documentation and tutorials can be adapted with only minor modifications.
* [The FreeType API reference](https://freetype.org/freetype2/docs/reference/index.html) has official documentation of the FreeType API.
* [The official FreeType tutorials](https://freetype.org/freetype2/docs/tutorial/index.html) provide good references for how to use the API.

## Quickstart guide
To use BindBC-FreeType in your dub project, add it to the list of `dependencies` in your dub configuration file. The easiest way is by running `dub add bindbc-freetype` in your project folder. The result should look like this:

Example __dub.json__
```json
"dependencies": {
	"bindbc-freetype": "~>1.2.0",
},
```
Example __dub.sdl__
```sdl
dependency "bindbc-freetype" version="~>1.2.0"
```

By default, BindBC-FreeType is configured to compile as a dynamic binding that is not BetterC-compatible. If you prefer static bindings or need BetterC compatibility, they can be enabled via `subConfigurations` in your dub configuration file. For configuration naming & more details, see [Configurations](#configurations).

Example __dub.json__
```json
"subConfigurations": {
	"bindbc-freetype": "staticBC",
},
```
Example __dub.sdl__
```sdl
subConfiguration "bindbc-freetype" "staticBC"
```

If you need to use versions of FreeType newer than 2.6.X, then you will have to add the appropriate version identifiers to `versions` in your dub configuration. For a list of library version identifiers, see [Library versions](#library-versions).

If using static bindings, then you will also need to add FreeType to `libs`.

Example __dub.json__
```json
"versions": [
	"FT_2_13",
],
"libs": [
	"freetype",
],
```
Example __dub.sdl__
```sdl
versions "FT_2_13"
libs "freetype"
```

**If you're using static bindings**: `import bindbc.freetype` in your code, and then you can use all of FreeType just like you would in C. That's it!
```d
import bindbc.freetype;

void main(){
	FT_Library lib;
	FT_Init_FreeType(&lib);
	
	//etc.
	
	FT_Done_FreeType(lib);
}
```

**If you're using dynamic bindings**: you need to load FreeType with `loadFreeType()`. 

For most use cases, it's best to use BindBC-Loader's [error handling API](https://github.com/BindBC/bindbc-loader#error-handling) to see if there were any errors while loading the library. This information can be written to a log file before aborting the program.

The load function will also return a member of the `LoadMsg` enum, which can be used for debugging:

* `noLibrary` means the library couldn't be found.
* `badLibrary` means there was an error while loading the library.
* `success` means that FreeType was loaded without any errors.

Here's a simple example using only the load function's return value:

```d
import bindbc.freetype;
import bindbc.loader;

/*
This code attempts to load the FreeType shared library using
well-known variations of the library name for the host system.
*/
LoadMsg ret = loadFreeType();
if(ret != LoadMsg.success){
	/*
	Error handling. For most use cases, it's best to use the error handling API in
	BindBC-Loader to retrieve error messages for logging and then abort.
	If necessary, it's possible to determine the root cause via the return value:
	*/
	if(ret == LoadMsg.noLibrary){
		//The FreeType shared library failed to load
	}else if(ret == LoadMsg.badLibrary){
		/*
		One or more symbols failed to load. The likely cause is
		that the shared library is for a lower version than
		BindBC-FreeType was configured to load.
		*/
	}
}

/*
This code attempts to load the FreeType library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this
example which attempts to load `FreeType.dll` from the `libs` subdirectory,
relative to the executable, only on Windows.
*/
version(Windows) loadFreeType("libs/FreeType.dll");
```

[The error handling API](https://github.com/BindBC/bindbc-loader#error-handling) in BindBC-Loader can be used to log error messages:
```d
import bindbc.freetype;

/*
Import the sharedlib module for error handling. Assigning an alias ensures that the
function names do not conflict with other public APIs. This isn't strictly necessary,
but the API names are common enough that they could appear in other packages.
*/
import loader = bindbc.loader.sharedlib;

bool loadLib(){
	LoadMsg ret = loadFreeType();
	if(ret != LoadMsg.success){
		//Log the error info
		foreach(info; loader.errors){
			/*
			A hypothetical logging function. Note that `info.error` and
			`info.message` are `const(char)*`, not `string`.
			*/
			logError(info.error, info.message);
		}
		
		//Optionally construct a user-friendly error message for the user
		string msg;
		if(ret == LoadMsg.noLibrary){
			msg = "This application requires the FreeType library.";
		}
		//A hypothetical message box function
		showMessageBox(msg);
		return false;
	}
	return true;
}
```

## Configurations
BindBC-FreeType has the following configurations:

|      ┌      |  DRuntime  |   BetterC   |
|-------------|------------|-------------|
| **Dynamic** | `dynamic`  | `dynamicBC` |
| **Static**  | `static`   | `staticBC`  |

For projects that don't use dub, if BindBC-FreeType is compiled for static bindings then the version identifier `BindFT_Static` must be passed to your compiler/linker when building your project.

> [!NOTE]\
> The version identifier `BindBC_Static` can be used to configure all of the _official_ BindBC packages used in your program. (i.e. those maintained in [the BindBC GitHub organisation](https://github.com/BindBC)) Some third-party BindBC packages may support it as well.

### Dynamic bindings
The dynamic bindings have no link-time dependency on the FreeType library, so the FreeType shared library must be manually loaded at runtime from the shared library search path of the user's system.

The function `isFreeTypeLoaded` returns `true` if any version of the shared library has been loaded and `false` if not. `unloadFreeType` can be used to unload a successfully loaded shared library.

### Static bindings
Static _bindings_ do not require static _linking_. The static bindings have a link-time dependency on either the shared _or_ static FreeType library. On Windows, you can link with the static library or, to use the DLLs, the import library. On other systems, you can link with either the static library or directly with the shared library.

Static linking requires the FreeType development packages be installed on your system. You can build them yourself, or you can also install them via your system's package manager. For example, on Debian-based Linux distributions `sudo apt install libfreetype-dev` will install both the development and runtime packages.

When linking with the shared (or import) library, there is a runtime dependency on the shared library just as there is when using the dynamic bindings. The difference is that the shared library is no longer loaded manually&mdash;loading is handled automatically by the system when the program is launched. Attempting to call `loadFreeType` with the static bindings enabled will result in a compilation error.


## Library versions
These are the supported versions of each FreeType, along with the corresponding version identifiers to add to your dub configuration or pass to the compiler.

| Version |Version identifier|
|---------|------------------|
| 2.6.X   | (none; default)  |
| 2.7.X   | `FT_27`          |
| 2.8.X   | `FT_28`          |
| 2.9.X   | `FT_29`          |
| 2.10.X  | `FT_210`         |
| 2.11.X  | `FT_211`         |
| 2.12.X  | `FT_2_12`        |
| 2.13.X  | `FT_2_13`        |
