# hxdrystal

Haxe externs for [Jérémy Anger](https://github.com/kidanger)'s [Drystal](https://github.com/kidanger/Drystal) game engine.

### Usage

1. See how to use Drystal from repo link above.
2. Use `haxelib install hxdrystal` to install the externs!
3. In your Haxe code import externs via `import hxdrystal.Drystal;`
4. In your build HXML define the main class and `-L hxdrystal` and `-D lua_vanilla`
5. Build targeting Lua and done!

### Example

```haxe
package;
import hxdrystal.Drystal;

class Main {
    public static function main() {
        Drystal.init = function() {
            trace(1);
        };
    }
}
```

### Changes

`drystal` changed to `Drystal` to comply with Haxe stuff!

### License

```
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
