# Analyse d'AJUI Animate (avant migration 4D 21 R4)

Composant 4D d'AJAR SA (Maurice Inzirillo). Dépôt `AJARProject/AJUI_Animate_source`. Licence MIT, fichier `LICENSE` (copyright 2022 Ajar SA). Release courante : **1.2.1** (4D 21 R4). `AJUI_Animate_Info` renvoie `AJUI_Animate (v21 R4) : 1.2.1`. Avant la migration, le build était `1.0.1+Build74` (commit « Build 1.1.0 for 19 R8 »).

Cette analyse décrit le dépôt **sur `master`**. Les changements de la migration sont dans `Documentation/AJUI_Animate.fr.md`.

## Ce que fait le composant

AJUI Animate anime des objets de formulaire 4D : déplacement, taille, police, couleurs, rayon de coin, clignotement, style de bordure, et un effet « floating label ».

Le moteur est `animate` puis le process `animationController` (attribut `preemptive: incapable`). Chaque animation est lancée par `New process`. Le process calcule les pas (`animationTiming`, courbes d'easing) et renvoie le dessin au formulaire par `CALL FORM` (`animationCB`, `visibleCB`). Les identifiants de process sont dans la collection partagée `Storage.AJUI_AnimateProcess_col`. `stopAnimation` vide cette collection ; `checkStopProcess` arrête alors la boucle.

Les effets publics (bounce, slide, zoom, easing nommés, floating label, etc.) sont des méthodes projet appelées depuis la classe `Animation` ou depuis des `Formula` posées par `New Animation`. Ils lisent les propriétés de `This` (cible, durée, offset, orientation, itérations, callback).

Les courbes élastiques passent par `easing`, qui appelle `Math()` (composant AJ_Math) pour `sin` et `asin`. Les autres courbes utilisent `Sin`, `Cos`, `Square root` et l'arithmétique 4D.

## Structure

**Déjà en mode projet.** Il n'y a pas de structure binaire `.4DB` ni de composant compilé `.4DC` à exporter.

| Emplacement | Rôle |
| --- | --- |
| `AJUI_Animate/Project/AJUI_Animate.4DProject` | Projet du composant. Avant migration : seulement le commentaire 4D, sans `compatibilityVersion`. |
| `AJUI_Animate/Project/Sources/Methods` | Environ 130 méthodes projet (`.4dm`), jetons `:C` / `:K`. |
| `AJUI_Animate/Project/Sources/Classes/Animation.4dm` | Classe des effets. Pas d'attribut `shared` dans le fichier. |
| `AJUI_Animate/Project/Sources/Forms` | `HDI_easing`, `HDI_Timing`, `testAnimation`, `testAnimation2`, `testEasing`. |
| `AJUI_Animate/Project/Sources/catalog.4DCatalog` | Schéma vide, pas de tables. |
| `AJUI_Animate/Documentation/Methods` | Fiches markdown d'origine (Explorer 4D), en français. |
| `AJUI_Animate/Components/AJ_Math.4dbase` | AJ_Math **2.1.1** compilé avec 4D 21 R4 (`Contents/AJ_Math.4DZ`, `Contents/Libraries/lib4d-arm64.dylib`). Copie embarquée pour le développement du composant. |
| `AJUI_AnimateLab_deprecated/` | Hôte d'exemple retiré (73 fichiers). Disponible dans la release 1.2.1 et l'historique git. |
| `AJUI_AnimationLab/` | Archive `.4DZ` de 2020 retirée (1 fichier). Disponible dans la release 1.2.1 et l'historique git. |
| `AJUI_Animate/Project/Sources/dependencies.json` | Déclare AJ_Math (`github: AJARProject/AJ_Math_source`, `^2.1.1`) et 4D SVG (`github: 4d/4D-SVG`). Plus de sous-module git. |
| Manuels `.pages` / `.numbers` à la racine | Documentation d'origine, non modifiée. |

Les `.4DZ` sont des archives zip de projets (dossier `Project/`), pas des bases binaires. Un export « Structure vers projet » n'est pas nécessaire.

Version visée avant migration : **4D 19 R8**, écrite dans `AJUI_Animate_Info` (`AJUI_Animate (v19 R8) : 1.0.1+Build74`). Les sources n'avaient pas de `settings.4DSettings` versionné (`.gitignore` ignorait `*.4DSettings`).

## API partagée

Méthodes avec `"shared":true` (et `"invisible":true`) :

| Méthode | Rôle |
| --- | --- |
| `AJUI_Animate` | Retourne la classe `cs.Animation`. L'hôte fait `AJUI_Animate.new()`. |
| `AJUI_Animate_Info` | Texte de version. `"lang":"en"`. |
| `New Animation` | Objet dont les membres sont des `Formula` vers les effets. |
| `animationTiming` | Valeur d'une courbe pour un pas. Deuxième paramètre optionnel (booléen). |
| `formGetObjectsCoordinates` | Remplit `Form.AJUI_Animate_formObjects`. |
| `formResetObjectsCoordinates` | Restaure coordonnées et couleurs depuis cette collection. |
| `stopAnimation` | Vide `Storage.AJUI_AnimateProcess_col`. |

La classe `Animation` expose les fonctions : `backIn`, `backOut`, `backInOut`, `bounce`, `bounceIn`, `bounceOut`, `bounceInOut`, `circIn`, `circOut`, `circInOut`, `cubicIn`, `cubicOut`, `cubicInOut`, `elastic`, `elasticIn`, `elasticOut`, `elasticInOut`, `expoIn`, `expoOut`, `expoInOut`, `flash`, `heartbeat`, `jump`, `pulse`, `quadIn`, `quadOut`, `quadInOut`, `quartIn`, `quartOut`, `quartInOut`, `quintIn`, `quintOut`, `quintInOut`, `shakeNo`, `shakeYes`, `sineIn`, `sineOut`, `sineInOut`, `slide`, `slideIn`, `slideOut`, `swingFromTo`, `swingFrom`, `swingTo`, `zoomIn`, `zoomOut`, `floatingLabel`.

`New AnimationItem` et `animate` sont partagées. `New AnimationItem` est `preemptive: capable`. `animationController` est `preemptive: incapable`. Les méthodes `old_*` ont été retirées ; elles restent dans la release 1.2.1 et l'historique git.

L'hôte `AJUI_AnimateLab_deprecated` a été retiré (release 1.2.1 et historique git). Il appelait `New AnimationItem` et `animate`. Ces méthodes sont partagées.

## Formulaires

Dans le composant : démonstrations d'easing et de timing, plus deux formulaires de test. Menus : « Launch test » appelle `_launch_test`.

Les formulaires du labo ont été retirés avec `AJUI_AnimateLab_deprecated` (release 1.2.1 et historique git).

## Dépendances

- **AJ_Math** : `easing` fait `$math:=Math()`. La copie embarquée `AJUI_Animate/Components/AJ_Math.4dbase` est AJ_Math **2.1.1** compilé avec 4D 21 R4 ; elle sert au développement du composant. Il n'y a plus de sous-module git. Un hôte qui déclare AJUI_Animate reçoit AJ_Math automatiquement : `dependencies.json` contient `"AJ_Math": {"github": "AJARProject/AJ_Math_source", "version": "^2.1.1"}`. Les sources sont dans `AJARProject/AJ_Math_source` (mode projet). Le dépôt `AJARProject/AJ_Math` (ancien `.4DZ`) est déprécié.
- **4D SVG** : déclaré lui aussi dans `dependencies.json` (`github: 4d/4D-SVG`). Méthodes utilisées : `SVG_New`, `SVG_New_line`, `SVG EXPORT TO PICTURE` (graphes de labo), `SVG_Color_RGB_from_long` et `SVG_Get_named_color_value` (couleurs d'animation, `calcColor` / `getColorLong`). Sur 4D 21 R4 le composant est aussi livré dans `4D.app/Contents/Components`, donc cette entrée est facultative.
- **Plugins** : aucun dossier `Plugins/`.
- Pas de tables, pas de client-serveur fonctionnel hors un test `Application type = 4D Remote mode` dans `AJUI_BuildComponent` (la construction est sautée en remote).

## Commandes et syntaxe face à 4D 21 R4

Aucune commande préfixée `_o_` et aucune commande retirée de la liste du code. Les commandes contrôlées sur la doc 21 R4 sont toujours publiées, sans mention « deprecated » :

- [`OBJECT SET RGB COLORS`](https://developer.4d.com/docs/21-R4/commands/object-set-rgb-colors) (modifiée en 17 R6, toujours présente)
- [`Macintosh option down`](https://developer.4d.com/docs/21-R4/commands/macintosh-option-down)
- [`Application type`](https://developer.4d.com/docs/21-R4/commands/application-type) et la constante `4D Remote mode`
- [`SET DATABASE PARAMETER`](https://developer.4d.com/docs/21-R4/commands/set-database-parameter) : `Debug log recording` (sélecteur 34) et `Circular log limitation` (sélecteur 90). Le jeton `:K37:76` est l'identifiant de constante, pas la valeur du sélecteur.
- [`LOG EVENT`](https://developer.4d.com/docs/21-R4/commands/log-event) (appels commentés dans `animate` / `animationController`)
- `Form event code`, `CALL FORM`, `New process`, `DELAY PROCESS`, `Storage`, `Formula`, `cs`, `This`

Ce qui est déprécié, c'est la **syntaxe** :

- Les directives `C_TEXT`, `C_LONGINT`, `C_OBJECT`, etc. : « The legacy syntax using `C_XXX` commands is deprecated as of 4D 20 R7 » ([Variables](https://developer.4d.com/docs/21-R4/Concepts/variables)). `var … : Integer` est un entier long, équivalent de `C_LONGINT`.
- Les paramètres `$1`, `$2` déclarés par `C_TEXT($1)` : dépréciés en 20 R7 ([Paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). Le remplacement est `#DECLARE`. La même page montre que `$1` reste utilisable dans le corps après un `#DECLARE` nommé, et que `Count parameters` compte les paramètres réellement passés.

Les sources étaient jetonisées (`:C`, `:K`). Le fichier projet ne fixait pas `tokenizedText`.

La page [Compatibilité](https://developer.4d.com/docs/21-R4/settings/compatibility) ne liste plus « Enregistrer les méthodes en Unicode » ni « Utiliser la notation objet ». Le compilateur 21 R4 refuse pourtant de compiler tant que `accept_dot_syntax` et `store_unicode_tokens` ne sont pas vrais dans `<database><misc>` (constaté sur JVFloatLabeledTextField, mêmes clés).

`compatibilityVersion` **2140** est le code court de 4D 21 R4 : caractères 1-2 = version, 3 = numéro R, 4 = révision ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version), exemples `"1420"` = 14 R2, `"1430"` = 14 R3). Confirmé sur un export réel 21 R4.

## Risques

1. **AJ_Math** : le risque d'un binaire 19 R8 refusé par 4D 21 R4 est clos. La copie dans `Components/` est la **2.1.1** compilée 21 R4, pour le développement du composant. Les hôtes reçoivent `^2.1.1` via `dependencies.json` (`AJARProject/AJ_Math_source`), pas via un sous-module. Les courbes `elastic*` appellent `Math()`.
2. **Labos retirés.** `AJUI_AnimateLab_deprecated` et `AJUI_AnimationLab` ne sont plus dans le dépôt (release 1.2.1 et historique git). `New AnimationItem` et `animate` sont partagées.
3. **Hôte compilé** : une dépendance vers les sources ne vaut qu'en interprété ([composants](https://developer.4d.com/docs/21-R4/Project/components)).
4. **`AJUI_BuildComponent`** cherche le marqueur `GMT` suivi d'un CR (`GMT\r`) pour incrémenter le build. Les `.4dm` du dépôt sont en LF. Ce comportement était déjà celui des sources.
5. Variables non déclarées dans plusieurs effets (`$s`, `$st`, `$isBezier`, `$evt`, etc.). Le compilateur 21 R4 peut émettre des avertissements de typage. Elles n'ont pas été typées d'office pour ne pas changer le type déduit.
6. Plusieurs méthodes déclarent une valeur de retour (`$0`) sans jamais l'affecter. La déclaration est conservée (`-> $return`).
7. Pas de 4D sur la machine d'analyse : ni ouverture, ni compilation, ni exécution d'un formulaire.
8. `AJUI_AnimationLab` a été retiré (ce n'était pas un projet : un `.4DZ` de 2020). Il reste dans la release 1.2.1 et l'historique git.

## Suite (après le premier essai de compilation 21 R4)

Le compilateur 21 R4 (build 21R4.100185) a refusé les locales non déclarées. Elles sont maintenant typées avec `var`. `$1`… dans le corps sont remplacés par les noms `#DECLARE`. `$0` est devenu `$return`. `property animType` est déclaré sur la classe. `New AnimationItem` et `animate` sont partagées. L'ancien labo qui les appelait a été retiré (release 1.2.1 et historique git). Le binaire AJ_Math 19 R8 est remplacé par AJ_Math **2.1.1** compilé avec 4D 21 R4. Il n'y a plus de sous-module git. `dependencies.json` déclare `AJARProject/AJ_Math_source` en `^2.1.1` (les hôtes l'obtiennent automatiquement) et 4D SVG (`github: 4d/4D-SVG`), explicite et facultatif car aussi présent dans `4D.app/Contents/Components`. Release courante : **1.2.1**.
