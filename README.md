# bindbc-freetype
This project provides both static and dynamic bindings to the [Freetype library](https://www.freetype.org/). They are `@nogc` and `nothrow` compatible can be compiled for compatibility with `-betterC`. This package is intended as a replacement of [DerelictFT](https://github.com/DerelictOrg/DerelictFT), which is not compatible with `@nogc`,  `nothrow`, or `-betterC`.

## Usage
By default, `bindbc-freetype` is configured to compile as a dynamic binding that is not `-betterC` compatible. The dynamic binding has no link-time dependency on the Freetype library, so the Freetype shared library must be manually loaded at runtime. When configured as a static binding, there is a link-time dependency on the Freetype library---either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use Freetype, add `bindbc-freetype` as a dependency to your project's package config file. For example, the following is configured to Freetype as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-freetype": "~>0.1.0",
}
```

__dub.sdl__
```
dependency "bindbc-freetypee" version="~>0.1.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project. There is no link-time dependency. At runtime, the Freetype shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the Freetype DLL with your program. On other systems, it usually means the user must install the Freetype runtime library through a package manager.

To load the shared library, you need to call the `loadFreetype` function. This returns a member of the `FTSupport` enumeration (See [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `FTSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `FTSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `FTSupport` indicating a version number that matches the version of Freetype that `bindbc-freetype` was configured at compile-time to load. By default, that is `FTSupport.ft26`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `ftSupport`.

```d
import bindbc.freetype;

/*
This version attempts to load the Freetype shared library using well-known variations
of the library name for the host system.
*/
FTSupport ret = loadFreetype();
if(ret != ftSupport) {

    // Handle error. For most use cases, its reasonable to use the the error handling API in
    // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
    // possible to determine the root cause via the return value:

    if(ret == FTSupport.noLibrary) {
        // Freetype shared library failed to load
    }
    else if(FTSupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-freetype was configured
        // to load (via FT_26, FT_27, etc.)
    }
}
/*
This version attempts to load the Freetype library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `freetype.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadFreetype("libs/freetype.dll")
```
By default, the `bindbc-freetype` binding is configured to compile to load Freetype 2.6. This ensures the widest level of compatibility at runtime. This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired Freetype version number. It is recommended that you always select the minimum version you require _and no higher_. In this example, the Freetype dynamic binding is compiled to support Freetype 2.7:

__dub.json__
```
"dependencies": {
    "bindbc-freetype": "~>0.1.0"
},
"versions": ["FT_27"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>0.1.0"
versions "FT_27"
```

With this example configuration, `ftSupport == FTSupport.ft27`. If Freetype 2.7 or later is installed on the user's system, `loadFreetype` will return `FTSupport.ft27`. If only Freetype 2.6 is installed, `loadFreetype` will return `FTSupport.badLibrary`. In this scenario, calling `loadedFreetypeVersion()` will return a `FTSupport` member indicating which version of Freetype, if any, actually loaded. If a lower version was loaded, it's still possible to call functions from that version of Freetype, but any calls to functions from higher versions will result in a null pointer access. For this reason, it's recommended to always specify your required version of the Freetype library at compile time and abort when you receive a `FTSupport.badLibrary` return value from `loadFreetype`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedFreetypeVersion`. It returns one of the following:

* `FTSupport.noLibrary` if `loadFreetype` returned `FTSupport.noLibrary`
* `FTSupport.badLibrary` if `loadFreetype` returned `FTSupport.badLibrary` and no version of Freetype successfully loaded
* a member of `FTSupport` indicating the version of Freetype that successfully loaded. When `loadFreetype` returns `FTSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `ftSupport`.

The function `isFreetypeLoaded` returns `true` if any version of Freetype was successfully loaded and `false` otherwise.

Following are the supported versions of Freetype, the corresponding version IDs to pass to the compiler, and the corresponding `FTSupport` members.

| Library & Version  | Version ID       | `FTSupport` Member |
|--------------------|------------------|--------------------|
|Freetype 2.6.4      | FT_26 (Default)  | `FTSupport.ft26`   |
|Freetype 2.7.1      | FT_27            | `FTSupport.ft27`   |
|Freetype 2.8.1      | FT_28            | `FTSupport.ft28`   |
|Freetype 2.9.1      | FT_29            | `FTSupport.ft29`   |
|Freetype 2.10.0     | FT_210           | `FTSupport.ft210   |

## The static binding
The static binding has a link-time dependency on either the shared or the static Freetype library. On Windows, you can link with the static library or, to use the shared library (`freetype.dll`), with the import library. On other systems, you can link with either the static library or directly with the shared library. This requires the Freetype development package be installed on your system at compile time, either by compiling the Freetype source yourself, downloading the Freetype precompiled binaries for Windows, or installing via a system package manager. [See the Freetype download page](https://www.freetype.org/download.html) for details.

When linking with the static library, there is no runtime dependency on Freetype. When linking with the shared library (or the import library on Windows), the runtime dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually---loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch or DUB's `versions` directive
Pass the `BindFT_Static` version to the compiler and link with the appropriate library.

When using the compiler command line or a build system that doesn't support DUB, this is the only option. The `-version=BindFT_Static` option should be passed to the compiler when building your program. All of the required C libraries, as well as the `bindbc-freetype` and `bindbc-loader` static libraries must also be passed to the compiler on the command line or via your build system's configuration.

When using DUB, its `versions` directive is an option. For example, when using the static binding:

__dub.json__
```
"dependencies": {
    "bindbc-freetype": "~>0.1.0"
},
"versions": ["BindFT_Static"],
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>0.1.0"
versions "BindFT_Static"
libs "freetype"
```

### Via DUB subconfigurations
Instead of using DUB's `versions` directive, a `subConfiguration` can be used. Enable the `static` subconfiguration for the `bindbc-freetype` dependency:

__dub.json__
```
"dependencies": {
    "bindbc-freetype": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-freetype": "static"
},
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>0.1.0"
subConfiguration "bindbc-freetype" "static"
libs "freetype"
```

This has the benefit that it completely excludes from the build any source modules related to the dynamic binding, i.e. they will never be passed to the compiler.

## `betterC` support

`betterC` support is enabled via the `dynamicBC` and `staticBC` subconfigurations, for dynamic and static bindings respectively. To enable the static binding with `-betterC` support:

__dub.json__
```
"dependencies": {
    "bindbc-freetype": "~>0.1.0"
},
"subConfigurations": {
    "bindbc-freetype": "staticBC"
},
"libs": ["freetype"]
```

__dub.sdl__
```
dependency "bindbc-freetype" version="~>0.1.0"
subConfiguration "bindbc-freetype" "staticBC"
libs "freetype"
```

When not using DUB to manage your project, first use DUB to compile the BindBC libraries with the `dynamicBC` or `staticBC` configuration, then pass `-betterC` to the compiler when building your project.