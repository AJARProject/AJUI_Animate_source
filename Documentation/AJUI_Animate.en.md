# AJUI Animate for 4D 21 R4

Form component by AJAR SA. The MIT licence is unchanged: `LICENSE` at the repository root (copyright 2022 Ajar SA).

This new version was built with the help of Cursor and Grok Bot.

Target: **4D 21 R4**, project mode. `compatibilityVersion` is **2140**, the short code for 4D 21 R4 ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version): characters 1-2 = version, 3 = R number, 4 = revision; `"1420"` = 14 R2, `"1430"` = 14 R3). The value was confirmed on a real 4D 21 R4 export.

Sources were already project mode (no `.4DB` / `.4DC`). No File > Export > Structure to project step is required.

## Interpreted install

1. 4D 21 R4. Open `AJUI_Animate/Project/AJUI_Animate.4DProject`.
2. Structure settings are in `AJUI_Animate/Project/Sources/settings.4DSettings`: `accept_dot_syntax="true"` and `store_unicode_tokens="true"` in `<database><misc>`. The 21 R4 compiler stops until both are on ("Save methods in Unicode" and "Use object notation"). The [Compatibility](https://developer.4d.com/docs/21-R4/settings/compatibility) page no longer names them; these XML keys are the ones that clear that compiler stop.
3. `tokenizedText` is `false`: methods have no `:C` / `:K` tokens ([architecture](https://developer.4d.com/docs/21-R4/Project/architecture)).

### Example host

`AJUI_AnimateLab_deprecated` is the project-mode host.

- `Project/Sources/dependencies.json` names `AJUI_Animate`.
- `environment4d.json` (in the host project folder) sets the relative path `../AJUI_Animate`.

Relative paths are resolved from the `environment4d.json` file. The Components folder has the highest priority, then `dependencies.json` ([components](https://developer.4d.com/docs/21-R4/Project/components)). The 2020 compiled archive was moved, bytes unchanged, to `AJUI_AnimateLab_deprecated/LegacyBinaries/AJUI_Animate.4dbase/`. Leaving it in `Components/` would have hidden the sources.

A dependency on sources works in **interpreted** mode only. A compiled host needs a compiled component.

`AJUI_AnimationLab/` contains only a 2020 `.4DZ` and no `.4DProject`. It is not a database. That file was not modified.

### AJ_Math

`easing` calls `Math()` for `sin` and `asin` (elastic curves). `AJUI_Animate/Components/AJ_Math.4dbase` is the **4D 21 R4** build produced by `BUILD APPLICATION` / `BuildComponent`: `Contents/AJ_Math.4DZ`, `Contents/Libraries/lib4d-arm64.dylib`, `Contents/Info.plist`, `Contents/_CodeSignature`, `Contents/Documentation`. The 19 R8 archive is no longer in `Components/` (git history still has it). The Components folder has the highest priority ([components](https://developer.4d.com/docs/21-R4/Project/components)).

### 4D SVG

Starting with 4D 21, 4D's own components (including 4D SVG) are no longer embedded in the application ([4D 21 release notes](https://developer.4d.com/docs/21/Notes/updates)). Without that component the compiler reads `SVG_New` as a variable and reports a syntax error on the call. `Project/Sources/dependencies.json` therefore declares:

```json
"4D SVG": { "github": "4d/4D-SVG" }
```

The `github` key is the one documented on the [components](https://developer.4d.com/docs/21-R4/Project/components) page. 4D downloads the release the first time the project opens. Methods used, unchanged: `SVG_New`, `SVG_New_line`, `SVG EXPORT TO PICTURE`, `SVG_Color_RGB_from_long`, `SVG_Get_named_color_value`. No plugin.

## Compiled install

1. Open the component project with 4D 21 R4.
2. Design > Build Application, and turn component generation on. `AJUI_Animate/Settings/buildApp.4DSettings` sets `BuildComponent` true and `BuildApplicationName` to `AJUI_Animate`, with no licence path ([builder](https://developer.4d.com/docs/21-R4/Desktop/building), [`BUILD APPLICATION`](https://developer.4d.com/docs/21-R4/commands/build-application)).
3. `AJUI_BuildComponent` calls `BUILD APPLICATION` on `Get 4D folder(Database folder)+"Settings"+Folder separator+"buildApp.4DSettings"`. In `4D Remote mode` the build is skipped ([`Application type`](https://developer.4d.com/docs/21-R4/commands/application-type)).
4. Install the produced `.4dbase` (preferably a `Contents` folder with `.4DZ`, `Info.plist`, and `Resources`) in the host `Components` folder. Remove any 19 R8 copy of the same name, or that copy is loaded instead.

The compiled component is not committed.

## API sheet — shared methods

All of them are `"shared":true` and `"invisible":true`. Positional `$1`, `$2` still work in the body after `#DECLARE` ([parameters](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `Count parameters` counts arguments that were actually passed. Omitted parameters keep the default value of their type.

`C_XXX` and `C_TEXT($1)` are deprecated as of 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables)). `var $n : Integer` is a long integer (`C_LONGINT`).

### `AJUI_Animate` → class

```4d
var $animation : Object
$animation:=AJUI_Animate.new()
$animation.target:="Rectangle1"
$animation.orientation:="up"
$animation.offset:=300
$animation.bounce()
```

The method returns `cs.Animation` (the class, not an instance). The host calls `.new()`. The class file has no `shared` attribute: the published entry point is this method.

Class functions: `backIn`, `backOut`, `backInOut`, `bounce`, `bounceIn`, `bounceOut`, `bounceInOut`, `circIn`, `circOut`, `circInOut`, `cubicIn`, `cubicOut`, `cubicInOut`, `elastic`, `elasticIn`, `elasticOut`, `elasticInOut`, `expoIn`, `expoOut`, `expoInOut`, `flash`, `heartbeat`, `jump`, `pulse`, `quadIn`, `quadOut`, `quadInOut`, `quartIn`, `quartOut`, `quartInOut`, `quintIn`, `quintOut`, `quintInOut`, `shakeNo`, `shakeYes`, `sineIn`, `sineOut`, `sineInOut`, `slide`, `slideIn`, `slideOut`, `swingFromTo`, `swingFrom`, `swingTo`, `zoomIn`, `zoomOut`, `floatingLabel`.

Properties read by the effects (from the method comments; not every effect uses all of them): `target` (object name), `name`, `duration` (ms), `offset` (pixels), `orientation`, `iterations`, `hideAtTheEnd`, `callback` (host project method name), `callbackParams` (object), `animType`, `delay`, `frequency`. Per-effect detail stays on the [wiki](https://github.com/AJARProject/AJUI_Animate/wiki).

`callback` runs through `CALL FORM` on the form window, via `execute_callback` (not shared).

### `AJUI_Animate_Info` → text

```4d
var $version : Text
$version:=AJUI_Animate_Info()
// AJUI_Animate (v21 R4) : 1.0.1+Build74
```

The build number `1.0.1+Build74` is unchanged. The platform label changed from `v19 R8` to `v21 R4`.

### `New Animation` → object

```4d
var $animation : Object
$animation:=New Animation()
$animation.target:="Rectangle1"
$animation.orientation:="up"
$animation.iterations:=4
$animation.offset:=200
$animation.jump()
```

Same effect catalogue as the class, stored as `Formula` members. `animType` is `"linear"` at creation. Historical API, still shared.

### `animationTiming` → real

```4d
#DECLARE($param1 : Object; $param2 : Boolean) -> $return : Real
```

`$param1` (`$1`): step object. Fields the method reads: `current_step`, `steps`, `minValue` (optional, default 0 through `Num`), `maxValue`, `animType` (text: `linear`, `ease`, `ease-in`, `ease-out`, `ease-in-out`, or a collection of four reals for a cubic, or an easing name handled by `easing`).

`$param2` (`$2`): optional boolean. When it is passed (`Count parameters=2`) and true, the result is the difference from the previous step. Otherwise the boolean is `False`.

Return: real for the current step.

### `formGetObjectsCoordinates`

No parameter. Walks the current form (`FORM GET OBJECTS`) and writes `Form.AJUI_Animate_formObjects`, a collection of objects:

| Property | Contents |
| --- | --- |
| `object` | Name |
| `coordinates` | Collection `[left, top, right, bottom]` |
| `foregroundColor` | RGB long integer |
| `backgroundColor` | RGB long integer |

### `formResetObjectsCoordinates`

No parameter. For each element of `Form.AJUI_Animate_formObjects`: `OBJECT SET COORDINATES` then [`OBJECT SET RGB COLORS`](https://developer.4d.com/docs/21-R4/commands/object-set-rgb-colors) (still documented in 21 R4, modified in 17 R6). Call it after `formGetObjectsCoordinates`. `stopAnimation` does not restore the form by itself.

### `stopAnimation`

No parameter. Clears `Storage.AJUI_AnimateProcess_col` when that collection exists. `animationController` calls `checkStopProcess`: if the process id is no longer in the collection, the loop stops. The collection is created on the first `animate`.

## Non-shared methods worth knowing

| Method | Note |
| --- | --- |
| `animate` | Starts the processes. Variant parameter: one AnimationItem, an `{operations}` object, a collection, or a collection of collections. Shared. |
| `New AnimationItem` | `"AnimationItem"` object (operation, target, duration, delay, frequency, geometry, font, colors). `preemptive: capable`. Shared. |
| `animationController` | Step loop. `preemptive: incapable`. |
| `easing` | Named curve. Depends on `Math()` for elastic. |
| `old_*` | Older effects. Several are `"shared":false`. |

`New AnimationItem` and `animate` are shared (`invisible` + `shared`), same as `stopAnimation`. The `AJUI_AnimateLab_deprecated` host calls them to build `AnimationItem` values (timing curves, sequences, font, color). The class functions do not cover those demos. Sharing them does not change their behaviour: the host can call them. `New AnimationItem` stays `preemptive: capable`.

## What changed for 21 R4

- `AJUI_Animate.4DProject` and `AJUI_AnimateLab.4DProject`: `compatibilityVersion` 2140, `tokenizedText` false.
- `Project/Sources/settings.4DSettings` on the component and the lab: object notation and Unicode methods.
- `Settings/buildApp.4DSettings` for the component build.
- `:C` and `:K` tokens removed. Command and constant names unchanged.
- `C_XXX` replaced with `var`. `C_LONGINT` becomes `Integer`. `ARRAY TEXT` arrays stay arrays.
- Parameters and the return value use `#DECLARE`, placed before the first statement (comments and `//%attributes` stay above it). The body still uses `$1`, `$2`, and `Count parameters`. The old `$0` is named `$return` and stays distinct from the working variables.
- Every local is declared with `var` (the 21 R4 compiler rejects an undeclared local). Parameters in the body are the `#DECLARE` names (`$param1`, …), not `$1`. `$0` is gone: the return value is `$return` on the `#DECLARE` (including the easing graph, `Picture`).
- `property animType : Text` on the `Animation` class ([classes](https://developer.4d.com/docs/21-R4/Concepts/classes)), for warning 550.26.
- `New AnimationItem` and `animate` are shared.
- 21 R4 AJ_Math in `Components/`. GitHub dependency `4D SVG`.
- `AJUI_Animate_Info` reports `v21 R4`. The number `1.0.1+Build74` does not change.
- `.gitignore`: `*.4DD`, `*.journal`, `*.4DIndy`, `*.4DIndx` (the real index extension), `*.Match`, `*.match`, `userPreferences.*/`, `Logs/`, `DerivedData/`, `.DS_Store`, `Data/`. `*.4DSettings` is no longer ignored, so the compatibility settings can be committed.
- Host: `dependencies.json` + `environment4d.json`. The 2020 `.4DZ` left `Components/` for `LegacyBinaries/` (file unchanged).
- No `_o_` command was found. `OBJECT SET RGB COLORS`, `Macintosh option down`, `SET DATABASE PARAMETER` (`Debug log recording`, `Circular log limitation`), and `Application type` are still in the 21 R4 docs. No command was replaced.
- Binaries were not deleted: `AJ_Math.4DZ`, `lib4d-arm64.dylib`, both `AJUI_Animate.4DZ` files (lab archive moved, `AJUI_AnimationLab` left in place).

## Untested

There is no 4D on the machine that prepared this branch. Nothing was opened, compiled, or run.

Check these in 4D 21 R4:

1. The component project opens with `compatibilityVersion` 2140.
2. Compile (x86_64 and arm64) after the two compatibility keys. Possible warnings on variables that are still undeclared (`$s`, `$st`, `$isBezier`, `$evt`, `$ref_win`, …) and on `$return` values that are never assigned.
3. `AJUI_Animate.new()`, a `bounce` or `slide`, then `stopAnimation`.
4. `New Animation` and `animationTiming` (with and without the boolean).
5. `formGetObjectsCoordinates` / `formResetObjectsCoordinates` on a form that already has the collection.
6. Elastic curves with the 21 R4 `AJ_Math.4DZ` in `Components/` (`Math().sin`, `Math().asin`).
7. The lab in interpreted mode loads `../AJUI_Animate`. `New AnimationItem` and `animate` are shared, so the HDI methods that call them should compile. 4D must have downloaded 4D SVG before the component is compiled.
8. A compiled host plus a `.4DZ` produced by 21 R4.
9. Windows, client-server, and `AJUI_BuildComponent` (the version bump looks for `GMT` followed by a CR, while the files use LF).
10. 4D SVG: `SVG_New`, `SVG_Color_RGB_from_long`, and `SVG_Get_named_color_value` were not run.
