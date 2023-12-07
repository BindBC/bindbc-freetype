
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

If using static bindings, then you will also need to add the name of each library you're using to `libs`.

Example __dub.json__
```json
"versions": [
	"FT_2_12",
],
"libs": [
	"freetype",
],
```
Example __dub.sdl__
```sdl
versions "FT_2_12"
libs "freetype"
```

**If you're using static bindings**: `import bindbc.freetype` in your code, and then you can use all of SDL just like you would in C. That's it!
```d
import bindbc.freetype;

void main(){
	FT_Library lib;
	FT_Init_FreeType(&lib);
	
	//etc.
	
	FT_Done_FreeType(lib);
}
```

# ---------

With this example configuration, `ftSupport == FTSupport.v2_7` after a successful load. If FreeType 2.7 or later is installed on the user's system, `loadFreeType` will return `FTSupport.v2_7`. If FreeType 2.6 is installed, `loadFreeType` will return `FTSupport.badLibrary`. In this scenario, calling `loadedFreeTypeVersion()` will return a `FTSupport` member indicating which version of FreeType, if any, actually loaded. If a lower version was loaded, it's still possible to call functions from that version of FreeType, but any calls to functions from higher versions will result in a null pointer access. For this reason, it's recommended to always specify your required version of the FreeType library at compile time and abort when you receive a `FTSupport.badLibrary` return value from `loadFreeType`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedFreeTypeVersion`. It returns one of the following:

* `FTSupport.noLibrary` if `loadFreeType` returned `FTSupport.noLibrary`
* `FTSupport.badLibrary` if `loadFreeType` returned `FTSupport.badLibrary` and no version of FreeType successfully loaded
* a member of `FTSupport` indicating the version of FreeType that successfully loaded. When `loadFreeType` returns `FTSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `ftSupport`.

The function `isFreeTypeLoaded` returns `true` if any version of FreeType was successfully loaded and `false` otherwise.

Following are the supported versions of FreeType, the corresponding version identifiers to pass to the compiler, and the corresponding `FTSupport` members.

## Library versions

| Version |Version Identifier|
|---------|------------------|
| 2.6.X   | Default          |
| 2.7.X   | FT_27            |
| 2.8.X   | FT_28            |
| 2.9.X   | FT_29            |
| 2.10.X  | FT_210           |
| 2.11.X  | FT_211           |
| 2.12.X  | FT_2_12          |
| 2.13.X  | FT_2_13          |

### The static bindings
The static binding has a link-time dependency on either the shared or the static FreeType library. On Windows, you can link with the static library or, to use the shared library (`freetype.dll`), you can link with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the FreeType development package be installed on your system at compile time, either by compiling the FreeType source yourself, downloading the FreeType precompiled binaries for Windows, or installing via a system package manager. [See the FreeType download page](https://www.freetype.org/download.html) for details.

When linking with the static library, there is no run-time dependency on FreeType. When linking with the shared library (or the import library on Windows), the run-time dependency is the same as that of the dynamic binding, the difference being that the shared library is no longer loaded manually&mdash;loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindFT_Static` version to the compiler and link with the appropriate library.

When using the compiler command line or a build system that doesn't support DUB, this is the only choice. The `-version=BindFT_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the BindBC-FreeType and BindBC-Loader static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, set the `BindFT_Static` version via `versions` in your DUB recipe. For example:

__dub.json__
```
"dependencies": {
	"bindbc-freetype": "~>1.2.0"
},
"versions": ["BindFT_Static"],
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>1.2.0"
versions "BindFT_Static"
libs "freetype"
```

> [!NOTE]\
> The version identifier `BindBC_Static` can be used to configure all of the _official_ BindBC packages used in your program. (i.e. those maintained in [the BindBC GitHub organisation](https://github.com/BindBC)) Some third-party BindBC packages may support it as well.

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. To enable the `static` subconfiguration for the BindBC-FreeType dependency:

__dub.json__
```
"dependencies": {
	"bindbc-freetype": "~>1.2.0"
},
"subConfigurations": {
	"bindbc-freetype": "static"
},
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>1.2.0"
subConfiguration "bindbc-freetype" "static"
libs "freetype"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e., they will never be passed to the compiler.

## BetterC support

BetterC support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the dynamic binding with BetterC support:

__dub.json__
```
"dependencies": {
	"bindbc-freetype": "~>1.2.0"
},
"subConfigurations": {
	"bindbc-freetype": "dynamicBC"
},
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>1.2.0"
subConfiguration "bindbc-freetype" "dynamicBC"
libs "freetype"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.
