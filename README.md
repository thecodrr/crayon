<div align="center">
<h1>🖍️ Crayon</h1>
</div>

<p align="center">
An extremely simple way to turn your bland terminal output into beautifully styled text.
</p>

<p align="center">
<img src="https://i.imgur.com/BR0r2zr.png"/>
</p>

## Installation:

Install using `vpkg`

```bash
vpkg get https://github.com/thecodrr/crayon
```

Install using v's builtin vpm (you will need to import the module with: `import thecodrr.crayon` with this method of installation):
```bash
v install thecodrr.crayon
```



Install using `git`:

```bash
cd path/to/your/project
git clone https://github.com/thecodrr/crayon
# Or add it as a submodule
git submodule add https://github.com/thecodrr/crayon crayon && git submodule update --init --recursive
```

Then in the wherever you want to use it:

```javascript
import crayon
```

And that's it!

## Usage

### crayon.new(texts ...`string`)

Initializes a new `Crayon` for the specified text. You can pass multiple strings in the `texts` argument. Nesting `Crayon`s is supported (see example below).

`crayon.new` returns a `Chalk` by default. Turn it into a styled `string` using the `.str()` function

```javascript
crayon.new("Hello", crayon.new("world").bold().str()).cyan().underline().str()
```

### crayon.color(text `string`)

Use this to style the text using the template API.

```javascript
crayon.color("{bold.underline I am bold and underlined} and I am not")
```

Each `template` starts with `{` and ends with `}`. All styles must come at the beginning **without any spaces**. This function returns a `string` by default. You can use `rgb` function as `rgb(92,92,92)` to use custom colors.

**Nested templates** are currently not supported (WIP) so keep in mind that.

### crayon.strip_text(text `string`)

Strip a styled `string` of all the styles returning a pure & clean `string`

### The Crayon `struct`

The `template` API uses these same names just without the `()` except for the `rgb` usage.

**Styles:**

`bold()`

`italic()`

`reverse()`

`underline()`

`strikethrough()`

`dim()`

`slow_blink()`

`rapid_blink()`

**Colors:**

*For background colors just put `bg_` before each method*

`black()`

`white()`

`red()`

`green()`

`yellow()`

`blue()`

`magenta()`

`cyan()`

`light_gray()`

`dark_gray()`

`light_red()`

`light_green()`

`light_yellow()`

`light_blue()`

`light_magenta()`

`light_cyan()`

**RGB Support**

`rbg(int,int,int)`

**Other Methods:**

`strip()` Strip the `Crayon` of all styles. Returns a `string`

`len()` Get the actual length of the styled `string`. Same as doing `strip().len()`

`print()`Print the styled `string`to`terminal`.

`print_with(...string)`Print the styled `string` to terminal with some additional `strings`

### Find this library useful? :heart:

Support it by joining **[stargazers](https://github.com/thecodrr/crayon/stargazers)** for this repository. :star:or [buy me a cup of coffee]([https://ko-fi.com/thecodrr](https://ko-fi.com/thecodrr)
And **[follow](https://github.com/thecodrr)** me for my next creations! 🤩

# License

```xml
Copyright 2019 thecodrr (Abdullah Atta)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
