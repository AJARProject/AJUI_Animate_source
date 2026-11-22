# AJUI Animate pour 4D 21 R4

Composant de formulaire d'AJAR SA. Licence MIT inchangée : fichier `LICENSE` à la racine (copyright 2022 Ajar SA).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot.

Cible : **4D 21 R4**, mode projet. `compatibilityVersion` est **2140**, code court de 4D 21 R4 ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version) : caractères 1-2 = version, 3 = numéro R, 4 = révision ; `"1420"` = 14 R2, `"1430"` = 14 R3). La valeur a été confirmée sur un export réel 4D 21 R4.

Les sources étaient déjà en mode projet (pas de `.4DB` / `.4DC`). Aucun export « Fichier > Exporter > Structure vers le projet » n'est requis.

## Installation interprétée

1. 4D 21 R4. Ouvrir `AJUI_Animate/Project/AJUI_Animate.4DProject`.
2. Les réglages de structure sont dans `AJUI_Animate/Project/Sources/settings.4DSettings` : `accept_dot_syntax="true"` et `store_unicode_tokens="true"` dans `<database><misc>`. Le compilateur 21 R4 s'arrête tant que ces deux options ne sont pas actives (« Enregistrer les méthodes en Unicode » et « Utiliser la notation objet »). La page [Compatibilité](https://developer.4d.com/docs/21-R4/settings/compatibility) ne les nomme plus ; les clés XML sont celles qui débloquent la compilation.
3. `tokenizedText` est `false` : les méthodes sont sans jetons `:C` / `:K` ([architecture](https://developer.4d.com/docs/21-R4/Project/architecture)).

### Hôte d'exemple

`AJUI_AnimateLab_deprecated` est l'hôte en mode projet.

- `Project/Sources/dependencies.json` nomme `AJUI_Animate`.
- `environment4d.json` (dans le dossier du projet hôte) donne le chemin relatif `../AJUI_Animate`.

Les chemins relatifs sont résolus depuis le fichier `environment4d.json`. Le dossier Components a la priorité la plus haute, puis `dependencies.json` ([composants](https://developer.4d.com/docs/21-R4/Project/components)). L'archive compilée de 2020 a été déplacée, sans modification d'octets, vers `AJUI_AnimateLab_deprecated/LegacyBinaries/AJUI_Animate.4dbase/`. La laisser dans `Components/` aurait masqué les sources.

Une dépendance vers les sources ne fonctionne qu'en **interprété**. Un hôte compilé exige un composant compilé.

`AJUI_AnimationLab/` ne contient qu'un `.4DZ` de 2020, sans `.4DProject`. Ce n'est pas une base. Le fichier n'a pas été modifié.

### AJ_Math

`easing` appelle `Math()` pour `sin` et `asin` (courbes elastic). `AJUI_Animate/Components/AJ_Math.4dbase` est le build **4D 21 R4** produit par `BUILD APPLICATION` / `BuildComponent` : `Contents/AJ_Math.4DZ`, `Contents/Libraries/lib4d-arm64.dylib`, `Contents/Info.plist`, `Contents/_CodeSignature`, `Contents/Documentation`. L'archive 19 R8 n'est plus dans `Components/` (l'historique git la conserve). Le dossier Components a la priorité la plus haute ([composants](https://developer.4d.com/docs/21-R4/Project/components)).

### 4D SVG

Depuis 4D 21, les composants 4D (dont 4D SVG) ne sont plus embarqués dans l'application ([notes de version 4D 21](https://developer.4d.com/docs/21/Notes/updates)). Sans eux, le compilateur lit `SVG_New` comme une variable et signale une erreur de syntaxe sur l'appel. `Project/Sources/dependencies.json` déclare donc :

```json
"4D SVG": { "github": "4d/4D-SVG" }
```

La clé `github` est celle de la page [composants](https://developer.4d.com/docs/21-R4/Project/components). Au premier ouverture, 4D télécharge la release. Méthodes utilisées, inchangées : `SVG_New`, `SVG_New_line`, `SVG EXPORT TO PICTURE`, `SVG_Color_RGB_from_long`, `SVG_Get_named_color_value`. Aucun plugin.

## Installation compilée

1. Ouvrir le projet composant avec 4D 21 R4.
2. Développement > Générer l'application, cocher la génération de composant. Le fichier `AJUI_Animate/Settings/buildApp.4DSettings` a `BuildComponent` à vrai et `BuildApplicationName` à `AJUI_Animate`, sans chemin de licence ([générateur](https://developer.4d.com/docs/21-R4/Desktop/building), [`BUILD APPLICATION`](https://developer.4d.com/docs/21-R4/commands/build-application)).
3. `AJUI_BuildComponent` appelle `BUILD APPLICATION` sur `Get 4D folder(Database folder)+"Settings"+Folder separator+"buildApp.4DSettings"`. En `4D Remote mode` la construction est sautée ([`Application type`](https://developer.4d.com/docs/21-R4/commands/application-type)).
4. Installer le `.4dbase` produit (idéalement avec un dossier `Contents`, `.4DZ`, `Info.plist`, `Resources`) dans `Components` de l'hôte. Retirer toute copie 19 R8 du même nom, sinon elle est chargée à la place.

Le composant compilé n'est pas dans ce dépôt.

## Fiche API — méthodes partagées

Toutes sont `"shared":true` et `"invisible":true`. Les paramètres positionnels `$1`, `$2` restent valables dans le corps après `#DECLARE` ([paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `Count parameters` compte les arguments réellement passés. Les paramètres omis prennent la valeur par défaut du type.

La syntaxe `C_XXX` et `C_TEXT($1)` est dépréciée depuis 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables)). `var $n : Integer` est un entier long (`C_LONGINT`).

### `AJUI_Animate` → classe

```4d
var $animation : Object
$animation:=AJUI_Animate.new()
$animation.target:="Rectangle1"
$animation.orientation:="up"
$animation.offset:=300
$animation.bounce()
```

La méthode retourne `cs.Animation` (la classe, pas une instance). L'hôte appelle `.new()`. Le fichier classe n'a pas d'attribut `shared` : le point d'entrée publié est cette méthode.

Fonctions de la classe : `backIn`, `backOut`, `backInOut`, `bounce`, `bounceIn`, `bounceOut`, `bounceInOut`, `circIn`, `circOut`, `circInOut`, `cubicIn`, `cubicOut`, `cubicInOut`, `elastic`, `elasticIn`, `elasticOut`, `elasticInOut`, `expoIn`, `expoOut`, `expoInOut`, `flash`, `heartbeat`, `jump`, `pulse`, `quadIn`, `quadOut`, `quadInOut`, `quartIn`, `quartOut`, `quartInOut`, `quintIn`, `quintOut`, `quintInOut`, `shakeNo`, `shakeYes`, `sineIn`, `sineOut`, `sineInOut`, `slide`, `slideIn`, `slideOut`, `swingFromTo`, `swingFrom`, `swingTo`, `zoomIn`, `zoomOut`, `floatingLabel`.

Propriétés lues par les effets (commentaires des méthodes, selon l'effet) : `target` (nom d'objet), `name`, `duration` (ms), `offset` (pixels), `orientation`, `iterations`, `hideAtTheEnd`, `callback` (nom de méthode projet de l'hôte), `callbackParams` (objet), `animType`, `delay`, `frequency`. Le détail de chaque effet reste le [wiki](https://github.com/AJARProject/AJUI_Animate/wiki).

`callback` est exécuté par `CALL FORM` sur la fenêtre du formulaire, via `execute_callback` (non partagée).

### `AJUI_Animate_Info` → texte

```4d
var $version : Text
$version:=AJUI_Animate_Info()
// AJUI_Animate (v21 R4) : 1.0.1+Build74
```

Le numéro de build `1.0.1+Build74` est inchangé. Le libellé de plateforme passe de `v19 R8` à `v21 R4`.

### `New Animation` → objet

```4d
var $animation : Object
$animation:=New Animation()
$animation.target:="Rectangle1"
$animation.orientation:="up"
$animation.iterations:=4
$animation.offset:=200
$animation.jump()
```

Même catalogue d'effets que la classe, stocké dans des `Formula`. `animType` vaut `"linear"` à la création. API historique, toujours partagée.

### `animationTiming` → réel

```4d
#DECLARE($param1 : Object; $param2 : Boolean) -> $return : Real
```

`$param1` (`$1`) : objet du pas. Champs lus par la méthode : `current_step`, `steps`, `minValue` (optionnel, défaut 0 via `Num`), `maxValue`, `animType` (texte : `linear`, `ease`, `ease-in`, `ease-out`, `ease-in-out`, ou une collection de quatre réels pour une cubique, ou un nom d'easing géré par `easing`).

`$param2` (`$2`) : booléen optionnel. S'il est passé (`Count parameters=2`) et vrai, la valeur retournée est l'écart avec le pas précédent. Sinon le booléen vaut `False`.

Retour : réel du pas courant.

### `formGetObjectsCoordinates`

Sans paramètre. Parcourt les objets du formulaire courant (`FORM GET OBJECTS`) et écrit `Form.AJUI_Animate_formObjects`, collection d'objets :

| Propriété | Contenu |
| --- | --- |
| `object` | Nom |
| `coordinates` | Collection `[gauche, haut, droite, bas]` |
| `foregroundColor` | Entier long RGB |
| `backgroundColor` | Entier long RGB |

### `formResetObjectsCoordinates`

Sans paramètre. Pour chaque élément de `Form.AJUI_Animate_formObjects` : `OBJECT SET COORDINATES` puis [`OBJECT SET RGB COLORS`](https://developer.4d.com/docs/21-R4/commands/object-set-rgb-colors) (commande toujours documentée en 21 R4, modifiée en 17 R6). À appeler après `formGetObjectsCoordinates`. `stopAnimation` ne restaure pas le formulaire tout seul.

### `stopAnimation`

Sans paramètre. Vide `Storage.AJUI_AnimateProcess_col` si elle existe. `animationController` appelle `checkStopProcess` : si l'identifiant du process n'est plus dans la collection, la boucle s'arrête. La collection est créée au premier `animate`.

## Méthodes non partagées utiles à connaître

| Méthode | Note |
| --- | --- |
| `animate` | Démarre les process. Paramètre variant : un AnimationItem, un objet `{operations}`, une collection, ou une collection de collections. Partagée. |
| `New AnimationItem` | Objet `"AnimationItem"` (opération, cible, durée, délai, fréquence, géométrie, police, couleurs). `preemptive: capable`. Partagée. |
| `animationController` | Boucle de pas. `preemptive: incapable`. |
| `easing` | Courbe nommée. Dépend de `Math()` pour elastic. |
| `old_*` | Anciens effets. Plusieurs ont `"shared":false`. |

`New AnimationItem` et `animate` sont partagées (`invisible` + `shared`), comme `stopAnimation`. Le labo `AJUI_AnimateLab_deprecated` les appelle pour construire des `AnimationItem` (courbes de timing, enchaînements, police, couleur). Les fonctions de la classe ne couvrent pas ces démonstrations. Les partager ne change pas leur comportement : l'hôte peut les appeler. `New AnimationItem` reste `preemptive: capable`.

## Ce qui a changé pour 21 R4

- `AJUI_Animate.4DProject` et `AJUI_AnimateLab.4DProject` : `compatibilityVersion` 2140, `tokenizedText` false.
- `Project/Sources/settings.4DSettings` sur le composant et sur le labo : notation objet et méthodes Unicode.
- `Settings/buildApp.4DSettings` pour la génération du composant.
- Jetons `:C` et `:K` retirés. Noms de commandes et de constantes inchangés.
- `C_XXX` remplacé par `var`. `C_LONGINT` devient `Integer`. Les tableaux `ARRAY TEXT` restent des tableaux.
- Paramètres et valeur de retour déclarés avec `#DECLARE`, placé avant le premier ordre (les commentaires et `//%attributes` restent au-dessus). Le corps continue d'utiliser `$1`, `$2` et `Count parameters`. L'ancienne valeur `$0` s'appelle `$return` et reste distincte des variables de travail.
- Chaque variable locale est déclarée avec `var` (le compilateur 21 R4 refuse une locale non déclarée). Les paramètres dans le corps sont les noms du `#DECLARE` (`$param1`, …), et non plus `$1`. `$0` n'apparaît plus : le retour est `$return` dans le `#DECLARE` (y compris le graphe d'easing, `Picture`).
- `property animType : Text` sur la classe `Animation` ([classes](https://developer.4d.com/docs/21-R4/Concepts/classes)), pour l'avertissement 550.26.
- `New AnimationItem` et `animate` sont partagées.
- AJ_Math 21 R4 dans `Components/`. Dépendance GitHub `4D SVG`.
- `AJUI_Animate_Info` annonce `v21 R4`. Le numéro `1.0.1+Build74` ne change pas.
- `.gitignore` : `*.4DD`, `*.journal`, `*.4DIndy`, `*.4DIndx` (extension réelle des index), `*.Match`, `*.match`, `userPreferences.*/`, `Logs/`, `DerivedData/`, `.DS_Store`, `Data/`. Les `*.4DSettings` ne sont plus ignorés, sinon les réglages de compatibilité ne pourraient pas être versionnés.
- Hôte : `dependencies.json` + `environment4d.json`. Le `.4DZ` de 2020 sort de `Components/` vers `LegacyBinaries/` (fichier intact).
- Aucune commande `_o_` trouvée. `OBJECT SET RGB COLORS`, `Macintosh option down`, `SET DATABASE PARAMETER` (`Debug log recording`, `Circular log limitation`), `Application type` sont toujours dans la doc 21 R4. Pas de remplacement de commande.
- Binaires non supprimés : `AJ_Math.4DZ`, `lib4d-arm64.dylib`, les deux `AJUI_Animate.4DZ` (labo déplacé, `AJUI_AnimationLab` laissé en place).

## Non testé

Pas de 4D sur la machine qui a préparé cette branche. Rien n'a été ouvert, compilé ni exécuté.

À vérifier dans 4D 21 R4 :

1. Le projet composant s'ouvre avec `compatibilityVersion` 2140.
2. La compilation (x86_64 et arm64) après les deux clés de compatibilité. Avertissements possibles sur les variables encore non déclarées (`$s`, `$st`, `$isBezier`, `$evt`, `$ref_win`, …) et sur les `$return` jamais affectés.
3. `AJUI_Animate.new()`, une animation `bounce` ou `slide`, puis `stopAnimation`.
4. `New Animation` et `animationTiming` (avec et sans le booléen).
5. `formGetObjectsCoordinates` / `formResetObjectsCoordinates` sur un formulaire qui a déjà la collection.
6. Courbes elastic avec le `AJ_Math.4DZ` 21 R4 de `Components/` (`Math().sin`, `Math().asin`).
7. Le labo en interprété charge `../AJUI_Animate`. `New AnimationItem` et `animate` sont partagées : les HDI qui les appellent doivent se compiler. 4D doit avoir téléchargé 4D SVG avant la compilation du composant.
8. Hôte compilé + composant `.4DZ` produit par 21 R4.
9. Windows, client-serveur, et `AJUI_BuildComponent` (le marqueur de version cherche `GMT` suivi d'un CR, alors que les fichiers sont en LF).
10. 4D SVG : `SVG_New`, `SVG_Color_RGB_from_long`, `SVG_Get_named_color_value` n'ont pas été rejoués.
