# AJ_Math pour 4D 21 R4

Composant mathématique d'AJAR SA. Licence MIT inchangée : fichier `LICENSE` à la racine (copyright 2022 Ajar SA).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot.

Cible : **4D 21 R4**, mode projet. `compatibilityVersion` est **2140**, code court de 4D 21 R4 ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version) : caractères 1-2 = version, 3 = numéro R, 4 = révision ; `"1420"` = 14 R2, `"1430"` = 14 R3). La même valeur a été confirmée sur un export réel 21 R4 lors de la migration d'AJUI Animate.

Les sources étaient déjà en mode projet (pas de `.4DB` / `.4DC` / `.4DZ`). Aucun export « Fichier > Exporter > Structure vers le projet » n'est requis. Le dépôt ne contient aucun binaire.

## Installation interprétée

1. 4D 21 R4. Ouvrir `Project/AJ_Math.4DProject`.
2. Les réglages de structure sont dans `Project/Sources/settings.4DSettings` : `accept_dot_syntax="true"` et `store_unicode_tokens="true"` dans `<database><misc>`. Le bloc compilateur déjà présent (`default_for_numeric="1"`) est conservé. Le compilateur 21 R4 s'arrête tant que les deux options de `<misc>` ne sont pas actives (« Enregistrer les méthodes en Unicode » et « Utiliser la notation objet »). La page [Compatibilité](https://developer.4d.com/docs/21-R4/settings/compatibility) ne les nomme plus ; les clés XML sont celles qui débloquent la compilation.
3. `tokenizedText` est `false` : les méthodes sont sans jetons `:C` / `:K` ([architecture](https://developer.4d.com/docs/21-R4/Project/architecture)).

### Hôte

Ce dépôt n'a pas de base d'exemple. `folders.json` a un groupe Explorer `Unit-test` vide : ce n'est pas un projet hôte. Il n'y a donc pas de `dependencies.json` ni de `environment4d.json` ici.

Pour en charger un, la page [composants](https://developer.4d.com/docs/21-R4/Project/components) décrit :

- `Project/Sources/dependencies.json` nomme le composant (`"AJ_Math": {}`) ;
- `environment4d.json`, dans le dossier du projet hôte ou un parent, donne le chemin relatif vers ce dépôt. Les chemins relatifs sont résolus depuis le fichier `environment4d.json`.

Le dossier `Components` de l'hôte a la priorité la plus haute, puis `dependencies.json`. Une dépendance vers les sources ne fonctionne qu'en **interprété**. Un hôte compilé exige un composant compilé.

AJUI Animate appelle `Math()` depuis `easing` (`sin`, `asin`). Son `Components/AJ_Math.4dbase` est le binaire **19 R8**. Il masque toute dépendance du même nom tant qu'il est dans `Components/`. Le remplacer par un build 21 R4 de ce dépôt.

## Installation compilée

1. Ouvrir le projet avec 4D 21 R4.
2. Développement > Générer l'application, cocher la génération de composant. Le fichier `Settings/buildApp.4DSettings` a `BuildComponent` à vrai et `BuildApplicationName` à `AJ_Math`, sans chemin de licence ([générateur](https://developer.4d.com/docs/21-R4/Desktop/building), [`BUILD APPLICATION`](https://developer.4d.com/docs/21-R4/commands/build-application), clés `/Preferences4D/BuildApp/BuildComponent` et `BuildApplicationName` du manuel XML Keys BuildApplication cité par cette commande).
3. `AJ_Math_BuildComponent` appelle `AJUI_BuildComponent("AJ_Math_info")`, qui appelle `BUILD APPLICATION` sur `Get 4D folder(Database folder)+"Settings"+Folder separator+"buildApp.4DSettings"`. En `4D Remote mode` la construction est sautée. La commande ne fonctionne qu'avec 4D Developer monoposte (pas 4D Server, pas le mode distant, pas une application fusionnée).
4. Installer le `.4dbase` produit dans `Components` de l'hôte.

Le composant compilé n'est pas dans ce dépôt.

## Fiche API — méthodes partagées

Toutes sont `"shared":true` et `"invisible":true`. Le corps utilise les noms de `#DECLARE` (`$param1`, `$param2`, …), pas `$1` / `$2` ([paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `Count parameters` compte les arguments réellement passés. Les paramètres omis prennent la valeur par défaut du type. Les `Formula` construites par `Math()` gardent `$1`, `$2`, `$3` : ce sont les arguments de la formule quand l'hôte appelle `$math.sin(x)`, pas les paramètres de la méthode.

La syntaxe `C_XXX` et `var $1` est dépréciée depuis 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables), [paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `var $n : Integer` est un entier long (`C_LONGINT`). Une méthode déclare ses paramètres avec `#DECLARE`. Une fonction de classe les déclare sur la ligne `Function` : `var` sur un paramètre « will generate errors ».

Les fiches Explorer d'origine (`Documentation/Methods/`) gardent leurs exemples en `C_Object`. Ce fichier est la référence 21 R4.

### `Math` → objet de formules

```4d
#DECLARE($param1 : Text; $param2 : Object) -> $return : Object
```

`$param1` : texte optionnel. À la construction, copié dans `value`. Lors d'un appel membre, c'est le nom de fonction (`"sin"`, `"asin"`, …).

`$param2` : objet optionnel. Arguments (`num`, `y`/`x`, `num1`/`num2`, `base`/`exponent`, ou `longitude1`, `latitude1`, `longitude2`, `latitude2`, `radius`, ou `num`/`precision`/`roundType`).

Retour : objet. À la construction (`Math()` ou `Math` sans que `This[""]` soit déjà `"Math"`), l'objet porte les constantes et les formules. Un appel membre renvoie `{value; success}` (`success` vaut `True` si le nom est reconnu).

```4d
var $math : Object
var $value : Real
$math:=Math()
$value:=$math.sin(0.5)
$value:=$math.asin(1)
$value:=$math.abs(-12)
$value:=$math.roundDecimal(1.222; 0.1; "ROUND_DOWN")
```

C'est l'API qu'utilise AJUI Animate : `$math:=Math()` puis `$math.sin` et `$math.asin`. Chaque formule rappelle `Math` dans le composant ([`Formula`](https://developer.4d.com/docs/21-R4/commands/formula) : la formule s'exécute dans la base qui l'a créée). Les noms de formules ne changent pas.

| Membre | Arguments de la formule | Effet |
| --- | --- | --- |
| `E`, `LN2`, `LN10`, `LOG10E`, `LOG2E`, `PI`, `SQRT2`, `SQRT1_2`, `Degree`, `Radian` | — | Constantes numériques posées à la construction. |
| `toRadians`, `toDegrees` | réel | `* PI / 180` et `* 180 / PI`. |
| `abs`, `cos`, `sin`, `tan`, `atan`, `floor`, `ceil`, `log`, `exp`, `sqrt` | réel | `Abs`, `Cos`, `Sin`, `Tan`, `Arctan`, `Int`, `-Int(-n)`, `Log`, `Exp`, [`Square root`](https://developer.4d.com/docs/21-R4/commands/square-root). |
| `cosh`, `sinh`, `tanh`, `asinh`, `acosh`, `atanh`, `log10`, `log2`, `log1p`, `expm1`, `cbrt` | réel | Formules du fichier (pas une commande 4D du même nom). |
| `acos`, `asin` | réel | `success` faux et `value` 0 si la valeur absolue est > 1. `acos` a deux branches identiques sous `This.PI>4`. |
| `atan2` | `y`, `x` | Quadrants. Le `Else` écrit `$o.succes` (faute d'origine), pas `success`. |
| `round` | réel | [`Round`](https://developer.4d.com/docs/21-R4/commands/round) à 0 décimale. Si négatif, `+0.01` avant l'appel. |
| `sign` | réel | 1, 0 ou -1. |
| `random` | ignoré | [`Random`](https://developer.4d.com/docs/21-R4/commands/random) `/ MAXINT`. |
| `max`, `min`, `hypot` | collection dans `num` | `max()` / `min()` de la collection, ou somme des carrés puis `sqrt` pour `hypot`. `$col` n'est rempli que si `num` est une collection. |
| `pow` | `base`, `exponent` | `^`. |
| `imul` | `num1`, `num2` | Produit de deux entiers longs. |
| `clz32` | réel | `Position("1"; LongInt2BinaryString(...)) - 1`. |
| `trunc` | réel | Partie avant le séparateur décimal, via [`GET SYSTEM FORMAT`](https://developer.4d.com/docs/21-R4/commands/get-system-format) (`Decimal separator`). |
| `spherodistance` | objet passé tel quel en `$2` | Haversine. Rayon `6371` si `radius` est `Null`. |
| `roundDecimal` | `num`, `precision`, `roundType` | Arrondi AJAR (`ROUND_UP`, `ROUND_DOWN`, `ROUND_CEILING`, `ROUND_FLOOR`, `ROUND_HALF_UP`, `ROUND_HALF_DOWN`, `ROUND_HALF_CEILING`, `ROUND_HALF_FLOOR`, `ROUND_HALF_EVEN`). |

`sqrt` est écrit deux fois dans le `New object` : la seconde formule remplace la première, et les deux appellent `Math("sqrt")`. Le second `Case of` `sqrt` (copie de `sinh`) n'est pas atteint.

Attribut `preemptive: capable` inchangé.

### `AJ_Math` → classe

```4d
#DECLARE() -> $return : Object
```

La méthode retourne `cs.Math` (la classe, pas une instance). L'hôte appelle `.new()`. Le fichier classe n'a pas d'attribut `shared` : le point d'entrée publié est cette méthode.

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

Le constructeur pose `E`, `LN2`, `PI` (deux fois), `LN10`, `LOG10E`, `LOG2E`, `SQRT2`, `SQRT1_2`, `Degree`, `Radian`, `NaN` (`Log(-1)`), `POSITIVE_INFINITY` (`1/0`), `NEGATIVE_INFINITY` (`-1/0`).

Les fonctions prennent des réels (sauf mention) et renvoient un réel. Si `Count parameters` n'est pas celui attendu, le retour est `This.NaN`, sauf `toRadians` / `toDegrees` (l'`Else` affecte `$result`, qui n'est pas le retour) et `max` / `min` (pas de test).

| Fonction | Signature | Note |
| --- | --- | --- |
| `abs` | `($param1 : Real) -> Real` | [`Abs`](https://developer.4d.com/docs/21-R4/commands/theme/Math). |
| `acos`, `asin` | réel → réel | `NaN` hors [-1; 1]. Même branche `PI>4` que la méthode. |
| `acosh`, `asinh`, `atanh` | réel → réel | Via `log` / `sqrt` / `Log`. |
| `atan`, `atan2` | `atan2` : deux réels | `Arctan`, puis les quadrants. |
| `cbrt`, `ceil`, `floor` | réel → réel | Puissance `1/3`, `-Int(-n)`, `Int`. |
| `clz32` | réel → réel | `LongInt2BinaryString`. |
| `cos`, `sin`, `tan`, `cosh`, `sinh`, `tanh`, `exp`, `expm1` | réel → réel | Commandes 4D ou formules du fichier. `sinh` et `tanh` laissent `$y`, `$a`, `$b` non déclarés. |
| `hypot` | `(... : Real) -> Real` | Somme des carrés. Déclaration variadique documentée (`...`), boucle `${$i}` inchangée. |
| `imul` | deux `Integer` → réel | Le test est `Count parameters=1` (déjà ainsi). Avec deux arguments, la fonction prend la branche `NaN`. |
| `log`, `log10`, `log1p`, `log2` | réel → réel | `log2` affecte `$return` puis le réécrit avec `$result`, non affecté dans la branche normale (déjà ainsi). |
| `max`, `min` | collection → réel | `.max()` / `.min()`. |
| `pow` | deux réels → réel | `^`. |
| `random` | `-> Integer` | `Random/MAXINT`, stocké dans un entier long, comme l'ancien `var $0 : Integer`. |
| `round`, `sign`, `sqrt`, `trunc` | réel → réel | Même règles que la méthode pour `round` et `trunc`. |
| `toRadians`, `toDegrees` | réel → réel | |
| `roundDecimal` | réel, réel, texte → réel | Trois arguments obligatoires (`Count parameters#3` → `NaN`). Mêmes noms `ROUND_*`. |
| `spherodistance` | 4 ou 5 réels → réel | `$param1` longitude1, `$param2` latitude1, `$param3` longitude2, `$param4` latitude2, `$param5` rayon optionnel (défaut 6371). |

### `AJ_Math_info` → texte

```4d
var $version : Text
$version:=AJ_Math_info()
// AJ_Math (v21 R4) : 2.0.1+Build47
```

Le numéro `2.0.1+Build47` est inchangé. Le libellé passe de `v19 R8` à `v21 R4`.

### `LongInt2BinaryString` → texte

```4d
#DECLARE($param1 : Integer) -> $return : Text
```

`$param1` : entier long. Retour : 32 caractères `0`/`1`, bit 31 à gauche. Boucle `0` à `31`, test de bit `??` ([opérateurs](https://developer.4d.com/docs/21-R4/Concepts/number)), [`Choose`](https://developer.4d.com/docs/21-R4/commands/choose). Attribut `preemptive: capable` inchangé. `clz32` s'en sert.

## Méthodes non partagées

| Méthode | Note |
| --- | --- |
| `AJ_Math_BuildComponent` | Appelle `AJUI_BuildComponent("AJ_Math_info")`. |
| `AJUI_BuildComponent` | Lit le code de la méthode passée, cherche `GMT` + CR, incrémente `+Build`, puis `BUILD APPLICATION`. |
| `zero_fill_right_shift` | `#DECLARE($param1 : Integer) -> $return : Integer`. Efface les bits 31 et 30 (`?-`). Aucun appel dans le dépôt. |

## Ce qui a changé pour 21 R4

- `Project/AJ_Math.4DProject` : `compatibilityVersion` 2140, `tokenizedText` false.
- `Project/Sources/settings.4DSettings` : notation objet et méthodes Unicode, dans `<database><misc>`. Le bloc `<compiler>` d'origine est gardé.
- `Settings/buildApp.4DSettings` ajouté pour la génération du composant. Il n'existait pas sur `master`.
- Jetons `:C` et `:K` retirés. Noms de commandes et de constantes inchangés. Aucune commande `_o_` n'était présente ; aucune commande n'a été renommée.
- `C_XXX` remplacé par `var`. `C_LONGINT` devient `Integer`. Paramètres et valeur de retour des méthodes : `#DECLARE`, placé avant le premier ordre (les commentaires et `//%attributes` restent au-dessus). Le corps utilise `$param1`, `$param2` et `Count parameters`. L'ancienne valeur `$0` s'appelle `$return` et reste distincte des variables de travail (`$o`, `$string`, `$result`, …). Les `Formula` de `Math()` gardent `$1` / `$2` / `$3`.
- Fonctions de classe : paramètres sur la ligne `Function`, plus de `var $0` / `var $1`. `hypot` utilise `(... : Real)` à la place de `var ${1}` ([paramètres variadiques](https://developer.4d.com/docs/21-R4/Concepts/parameters)). La boucle `${$i}` est la même. `random` reste `-> Integer`, sans parenthèses vides (forme `Function getValue -> $v` de la même page).
- Compilation 21 R4 (build 21R4.100185) : chaque locale signalée est déclarée avec `var` (`Integer`, `Real`, `Text` ou `Boolean`). Les constantes de la classe (`E`, `PI`, `NaN`, …) sont déclarées avec `property` ([classes](https://developer.4d.com/docs/21-R4/Concepts/classes)), hors du constructeur. Le constructeur continue de les affecter.
- `AJ_Math_info` annonce `v21 R4`. Le numéro `2.0.1+Build47` ne change pas.
- `.gitignore` : `*.4DD`, `*.journal`, `*.4DIndy`, `*.4DIndx` (extension réelle des index), `*.Match`, `*.match`, `userPreferences.*/`, `Logs/`, `DerivedData/`, `.DS_Store`, `Data/`. Les `*.4DSettings` ne sont plus ignorés, sinon les réglages de compatibilité ne pourraient pas être versionnés. Les archives et caches listés par l'ancien fichier (`.4darchive`, `HDI*`, `Preferences`, `Builds`, …) ne sont plus ignorés : ce dépôt n'en a pas.
- Comportement et noms publics inchangés : `Math()`, `AJ_Math.new()`, `AJ_Math_info`, `LongInt2BinaryString`, et les noms de formules / fonctions. Les écarts déjà présents (faute `succes`, second `sqrt`, `imul`, `log2`, `random` entier) sont laissés.
- Pas de base hôte : pas de `dependencies.json`. Les fiches `Documentation/Methods/` d'origine sont conservées.

## Non testé

Pas de 4D sur la machine qui a préparé cette branche. Rien n'a été ouvert, compilé ni exécuté.

À vérifier dans 4D 21 R4 :

1. Le projet s'ouvre avec `compatibilityVersion` 2140.
2. La compilation après les deux clés de compatibilité. Avertissements possibles sur les variables encore non déclarées (`$vtype`, `$count`, `$sum`, `$str`, `$vDecSep`, `$num`, `$i`, `$test`, `$y`, `$a`, `$b`, `$lon1`, …).
3. `Math().sin` et `Math().asin` avec les valeurs qu'utilise `easing` d'AJUI Animate, puis une courbe elastic dans l'hôte.
4. `AJ_Math.new()` : `abs`, `roundDecimal`, `toDegrees`, `max`, `spherodistance` (4 puis 5 arguments), `hypot` avec plusieurs réels.
5. `random` sur la classe (retour déclaré entier) et `random` sur l'objet `Math()` (propriété d'objet, sans ce typage).
6. `imul` de la classe avec un argument et avec deux (la condition `Count parameters=1` est d'origine).
7. `log2` de la classe : la dernière affectation `$return:=$result` peut effacer le logarithme calculé.
8. `trunc` avec le séparateur décimal du système ([`GET SYSTEM FORMAT`](https://developer.4d.com/docs/21-R4/commands/get-system-format)).
9. `LongInt2BinaryString` sur 0, sur un négatif, et `clz32`.
10. Hôte interprété : dépendance `dependencies.json` + `environment4d.json`. Hôte compilé : `.4DZ` produit par 21 R4, et retrait du `.4dbase` 19 R8 dans `Components` d'AJUI Animate.
11. `AJ_Math_BuildComponent` (le marqueur de version cherche `GMT` suivi d'un CR, alors que les fichiers sont en LF). `BUILD APPLICATION` uniquement en 4D Developer monoposte.
12. Windows et client-serveur.
