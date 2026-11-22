# AJ_Math for 4D 21 R4

Math component by AJAR SA. The MIT licence is unchanged: `LICENSE` at the repository root (copyright 2022 Ajar SA).

This new version was built with the help of Cursor and Grok Bot.

Target: **4D 21 R4**, project mode. `compatibilityVersion` is **2140**, the short code of 4D 21 R4 ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version): characters 1-2 = version, 3 = "R" number, 4 = revision; `"1420"` = 14 R2, `"1430"` = 14 R3). The same value was confirmed on a real 21 R4 export during the AJUI Animate migration.

The sources were already in project mode (no `.4DB` / `.4DC` / `.4DZ`). No "File > Export > Structure to project" step is required. The repository contains no binary.

## Interpreted install

1. 4D 21 R4. Open `Project/AJ_Math.4DProject`.
2. Structure settings are in `Project/Sources/settings.4DSettings`: `accept_dot_syntax="true"` and `store_unicode_tokens="true"` inside `<database><misc>`. The existing compiler block (`default_for_numeric="1"`) is kept. The 21 R4 compiler stops until both `<misc>` options are on ("Save methods in Unicode" and "Use object notation"). The [Compatibility](https://developer.4d.com/docs/21-R4/settings/compatibility) page no longer names them; the XML keys are what allow compilation.
3. `tokenizedText` is `false`: methods have no `:C` / `:K` tokens ([architecture](https://developer.4d.com/docs/21-R4/Project/architecture)).

### Host

This repository has no sample database. `folders.json` has an empty Explorer group named `Unit-test`. That is not a host project, so there is no `dependencies.json` and no `environment4d.json` here.

To load one, the [components](https://developer.4d.com/docs/21-R4/Project/components) page describes:

- `Project/Sources/dependencies.json` names the component (`"AJ_Math": {}`);
- `environment4d.json`, in the host project folder or a parent, gives the relative path to this repository. Relative paths are resolved from the `environment4d.json` file.

The host `Components` folder has the highest priority, then `dependencies.json`. A dependency on sources works in **interpreted** mode only. A compiled host needs a compiled component.

AJUI Animate calls `Math()` from `easing` (`sin`, `asin`). Its `Components/AJ_Math.4dbase` is the **19 R8** binary. It hides any dependency of the same name while it stays in `Components/`. Replace it with a 21 R4 build of this repository.

## Compiled install

1. Open the project with 4D 21 R4.
2. Design > Build Application, and build a component. `Settings/buildApp.4DSettings` sets `BuildComponent` to true and `BuildApplicationName` to `AJ_Math`, with no licence path ([builder](https://developer.4d.com/docs/21-R4/Desktop/building), [`BUILD APPLICATION`](https://developer.4d.com/docs/21-R4/commands/build-application), keys `/Preferences4D/BuildApp/BuildComponent` and `BuildApplicationName` from the XML Keys BuildApplication manual cited by that command).
3. `AJ_Math_BuildComponent` calls `AJUI_BuildComponent("AJ_Math_info")`, which calls `BUILD APPLICATION` on `Get 4D folder(Database folder)+"Settings"+Folder separator+"buildApp.4DSettings"`. The build is skipped in `4D Remote mode`. The command runs only in single-user 4D Developer (not 4D Server, not remote mode, not a merged application).
4. Install the produced `.4dbase` in the host `Components` folder.

The compiled component is not in this repository.

## API sheet — shared methods

All of them are `"shared":true` and `"invisible":true`. The body uses the `#DECLARE` names (`$param1`, `$param2`, …), not `$1` / `$2` ([parameters](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `Count parameters` counts the arguments actually passed. Omitted parameters take the default value of their type. The `Formula` values built by `Math()` still use `$1`, `$2`, `$3`: those are the formula arguments when the host calls `$math.sin(x)`, not the method parameters.

`C_XXX` and `var $1` are deprecated as of 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables), [parameters](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `var $n : Integer` is a long integer (`C_LONGINT`). A method declares parameters with `#DECLARE`. A class function declares them on the `Function` line: `var` on a parameter "will generate errors".

The original Explorer sheets (`Documentation/Methods/`) still show `C_Object` examples. This file is the 21 R4 reference.

### `Math` → formula object

```4d
#DECLARE($param1 : Text; $param2 : Object) -> $return : Object
```

`$param1`: optional text. On construction, copied into `value`. On a member call, the function name (`"sin"`, `"asin"`, …).

`$param2`: optional object. Arguments (`num`, `y`/`x`, `num1`/`num2`, `base`/`exponent`, or `longitude1`, `latitude1`, `longitude2`, `latitude2`, `radius`, or `num`/`precision`/`roundType`).

Returns an object. On construction (`Math()`, when `This[""]` is not already `"Math"`), the object carries the constants and the formulas. A member call returns `{value; success}` (`success` is `True` when the name is known).

```4d
var $math : Object
var $value : Real
$math:=Math()
$value:=$math.sin(0.5)
$value:=$math.asin(1)
$value:=$math.abs(-12)
$value:=$math.roundDecimal(1.222; 0.1; "ROUND_DOWN")
```

This is the API AJUI Animate uses: `$math:=Math()` then `$math.sin` and `$math.asin`. Each formula calls `Math` again inside the component ([`Formula`](https://developer.4d.com/docs/21-R4/commands/formula): the formula runs in the database that created it). Formula names are unchanged.

| Member | Formula arguments | Effect |
| --- | --- | --- |
| `E`, `LN2`, `LN10`, `LOG10E`, `LOG2E`, `PI`, `SQRT2`, `SQRT1_2`, `Degree`, `Radian` | — | Numeric constants set at construction. |
| `toRadians`, `toDegrees` | real | `* PI / 180` and `* 180 / PI`. |
| `abs`, `cos`, `sin`, `tan`, `atan`, `floor`, `ceil`, `log`, `exp`, `sqrt` | real | `Abs`, `Cos`, `Sin`, `Tan`, `Arctan`, `Int`, `-Int(-n)`, `Log`, `Exp`, [`Square root`](https://developer.4d.com/docs/21-R4/commands/square-root). |
| `cosh`, `sinh`, `tanh`, `asinh`, `acosh`, `atanh`, `log10`, `log2`, `log1p`, `expm1`, `cbrt` | real | Formulas in the file (not a 4D command of the same name). |
| `acos`, `asin` | real | `success` false and `value` 0 when the absolute value is > 1. `acos` has two identical branches under `This.PI>4`. |
| `atan2` | `y`, `x` | Quadrants. The `Else` writes `$o.succes` (original typo), not `success`. |
| `round` | real | [`Round`](https://developer.4d.com/docs/21-R4/commands/round) to 0 decimal places. If negative, `+0.01` before the call. |
| `sign` | real | 1, 0, or -1. |
| `random` | ignored | [`Random`](https://developer.4d.com/docs/21-R4/commands/random) `/ MAXINT`. |
| `max`, `min`, `hypot` | collection in `num` | Collection `max()` / `min()`, or sum of squares then `sqrt` for `hypot`. `$col` is filled only when `num` is a collection. |
| `pow` | `base`, `exponent` | `^`. |
| `imul` | `num1`, `num2` | Product of two long integers. |
| `clz32` | real | `Position("1"; LongInt2BinaryString(...)) - 1`. |
| `trunc` | real | Digits before the decimal separator, via [`GET SYSTEM FORMAT`](https://developer.4d.com/docs/21-R4/commands/get-system-format) (`Decimal separator`). |
| `spherodistance` | object passed through as `$2` | Haversine. Radius `6371` when `radius` is `Null`. |
| `roundDecimal` | `num`, `precision`, `roundType` | AJAR rounding (`ROUND_UP`, `ROUND_DOWN`, `ROUND_CEILING`, `ROUND_FLOOR`, `ROUND_HALF_UP`, `ROUND_HALF_DOWN`, `ROUND_HALF_CEILING`, `ROUND_HALF_FLOOR`, `ROUND_HALF_EVEN`). |

`sqrt` is written twice in the `New object`: the second formula replaces the first, and both call `Math("sqrt")`. The second `Case of` branch for `sqrt` (a copy of `sinh`) is never reached.

The `preemptive: capable` attribute is unchanged.

### `AJ_Math` → class

```4d
#DECLARE() -> $return : Object
```

The method returns `cs.Math` (the class, not an instance). The host calls `.new()`. The class file has no `shared` attribute: the published entry point is this method.

```4d
var $math : Object
var $value : Real
$math:=AJ_Math.new()
$value:=$math.roundDecimal(1.222; 0.1; "ROUND_DOWN")
$value:=$math.toDegrees(0.7853981633975)
$value:=$math.random()
$value:=$math.abs(-12)
$value:=$math.max(New collection(1; 3; 2))
```

The constructor sets `E`, `LN2`, `PI` (twice), `LN10`, `LOG10E`, `LOG2E`, `SQRT2`, `SQRT1_2`, `Degree`, `Radian`, `NaN` (`Log(-1)`), `POSITIVE_INFINITY` (`1/0`), `NEGATIVE_INFINITY` (`-1/0`).

Functions take reals (unless noted) and return a real. When `Count parameters` is not the expected count, the return is `This.NaN`, except `toRadians` / `toDegrees` (the `Else` assigns `$result`, which is not the return) and `max` / `min` (no check).

| Function | Signature | Note |
| --- | --- | --- |
| `abs` | `($param1 : Real) -> Real` | [`Abs`](https://developer.4d.com/docs/21-R4/commands/theme/Math). |
| `acos`, `asin` | real → real | `NaN` outside [-1; 1]. Same `PI>4` branch as the method. |
| `acosh`, `asinh`, `atanh` | real → real | Through `log` / `sqrt` / `Log`. |
| `atan`, `atan2` | `atan2`: two reals | `Arctan`, then the quadrants. |
| `cbrt`, `ceil`, `floor` | real → real | Power `1/3`, `-Int(-n)`, `Int`. |
| `clz32` | real → real | `LongInt2BinaryString`. |
| `cos`, `sin`, `tan`, `cosh`, `sinh`, `tanh`, `exp`, `expm1` | real → real | 4D commands or formulas in the file. `sinh` and `tanh` leave `$y`, `$a`, `$b` undeclared. |
| `hypot` | `(... : Real) -> Real` | Sum of squares. Documented variadic declaration (`...`); the `${$i}` loop is unchanged. |
| `imul` | two `Integer` → real | The test is `Count parameters=1` (already the case). With two arguments the function takes the `NaN` branch. |
| `log`, `log10`, `log1p`, `log2` | real → real | `log2` assigns `$return` and then overwrites it with `$result`, which is not assigned on the normal branch (already the case). |
| `max`, `min` | collection → real | `.max()` / `.min()`. |
| `pow` | two reals → real | `^`. |
| `random` | `-> Integer` | `Random/MAXINT`, stored in a long integer, as the old `var $0 : Integer`. |
| `round`, `sign`, `sqrt`, `trunc` | real → real | Same rules as the method for `round` and `trunc`. |
| `toRadians`, `toDegrees` | real → real | |
| `roundDecimal` | real, real, text → real | Three arguments required (`Count parameters#3` → `NaN`). Same `ROUND_*` names. |
| `spherodistance` | 4 or 5 reals → real | `$param1` longitude1, `$param2` latitude1, `$param3` longitude2, `$param4` latitude2, `$param5` optional radius (default 6371). |

### `AJ_Math_info` → text

```4d
var $version : Text
$version:=AJ_Math_info()
// AJ_Math (v21 R4) : 2.0.1+Build47
```

The number `2.0.1+Build47` is unchanged. The label moves from `v19 R8` to `v21 R4`.

### `LongInt2BinaryString` → text

```4d
#DECLARE($param1 : Integer) -> $return : Text
```

`$param1`: long integer. Returns 32 characters `0`/`1`, bit 31 on the left. Loop `0` to `31`, bit test `??` ([operators](https://developer.4d.com/docs/21-R4/Concepts/number)), [`Choose`](https://developer.4d.com/docs/21-R4/commands/choose). The `preemptive: capable` attribute is unchanged. `clz32` uses it.

## Methods that are not shared

| Method | Note |
| --- | --- |
| `AJ_Math_BuildComponent` | Calls `AJUI_BuildComponent("AJ_Math_info")`. |
| `AJUI_BuildComponent` | Reads the passed method, looks for `GMT` + CR, increments `+Build`, then `BUILD APPLICATION`. |
| `zero_fill_right_shift` | `#DECLARE($param1 : Integer) -> $return : Integer`. Clears bits 31 and 30 (`?-`). No call site in the repository. |

## What changed for 21 R4

- `Project/AJ_Math.4DProject`: `compatibilityVersion` 2140, `tokenizedText` false.
- `Project/Sources/settings.4DSettings`: object notation and Unicode methods, inside `<database><misc>`. The original `<compiler>` block is kept.
- `Settings/buildApp.4DSettings` added for the component build. It was not on `master`.
- `:C` and `:K` tokens removed. Command and constant names unchanged. There was no `_o_` command; no command was renamed.
- `C_XXX` replaced by `var`. `C_LONGINT` becomes `Integer`. Method parameters and the return value use `#DECLARE`, placed before the first statement (comments and `//%attributes` stay above). The body uses `$param1`, `$param2`, and `Count parameters`. The old `$0` is named `$return` and stays distinct from working variables (`$o`, `$string`, `$result`, …). The `Formula` values inside `Math()` still use `$1` / `$2` / `$3`.
- Class functions: parameters on the `Function` line, no more `var $0` / `var $1`. `hypot` uses `(... : Real)` instead of `var ${1}` ([variadic parameters](https://developer.4d.com/docs/21-R4/Concepts/parameters)). The `${$i}` loop is the same. `random` stays `-> Integer`, with no empty parentheses (the `Function getValue -> $v` form on the same page).
- 21 R4 compile (build 21R4.100185): every local the compiler reported is declared with `var` (`Integer`, `Real`, `Text`, or `Boolean`). Class constants (`E`, `PI`, `NaN`, …) are declared with `property` ([classes](https://developer.4d.com/docs/21-R4/Concepts/classes)), outside the constructor. The constructor still assigns them.
- `AJ_Math_info` reports `v21 R4`. The number `2.0.1+Build47` does not change.
- `.gitignore`: `*.4DD`, `*.journal`, `*.4DIndy`, `*.4DIndx` (the real index extension), `*.Match`, `*.match`, `userPreferences.*/`, `Logs/`, `DerivedData/`, `.DS_Store`, `Data/`. `*.4DSettings` is no longer ignored, otherwise the compatibility settings could not be versioned. Archives and caches listed by the old file (`.4darchive`, `HDI*`, `Preferences`, `Builds`, …) are no longer ignored: this repository has none.
- Behaviour and public names unchanged: `Math()`, `AJ_Math.new()`, `AJ_Math_info`, `LongInt2BinaryString`, and the formula / function names. Pre-existing gaps (the `succes` typo, the second `sqrt`, `imul`, `log2`, integer `random`) are left as they were.
- No host database: no `dependencies.json`. The original `Documentation/Methods/` sheets are kept.

## Untested

There is no 4D on the machine that prepared this branch. Nothing was opened, compiled, or run.

To check in 4D 21 R4:

1. The project opens with `compatibilityVersion` 2140.
2. Compilation after the two compatibility keys. Warnings are possible on variables that are still undeclared (`$vtype`, `$count`, `$sum`, `$str`, `$vDecSep`, `$num`, `$i`, `$test`, `$y`, `$a`, `$b`, `$lon1`, …).
3. `Math().sin` and `Math().asin` with the values AJUI Animate `easing` uses, then an elastic curve in the host.
4. `AJ_Math.new()`: `abs`, `roundDecimal`, `toDegrees`, `max`, `spherodistance` (4 arguments, then 5), `hypot` with several reals.
5. `random` on the class (return declared as an integer) and `random` on the `Math()` object (object property, without that typing).
6. Class `imul` with one argument and with two (the `Count parameters=1` condition is original).
7. Class `log2`: the final `$return:=$result` can wipe the computed logarithm.
8. `trunc` with the system decimal separator ([`GET SYSTEM FORMAT`](https://developer.4d.com/docs/21-R4/commands/get-system-format)).
9. `LongInt2BinaryString` on 0, on a negative, and `clz32`.
10. Interpreted host: `dependencies.json` + `environment4d.json`. Compiled host: a `.4DZ` built by 21 R4, and removal of the 19 R8 `.4dbase` in AJUI Animate `Components`.
11. `AJ_Math_BuildComponent` (the version marker looks for `GMT` followed by a CR, while the files are LF). `BUILD APPLICATION` only in single-user 4D Developer.
12. Windows and client-server.
