# AJUI Animate

Composant 4D d'AJAR SA qui anime des objets de formulaire (déplacement, taille, police, couleurs, easing, floating label).

Sources du composant [AJUI_Animate](https://github.com/AJARProject/AJUI_Animate). Le wiki d'origine reste [ici](https://github.com/AJARProject/AJUI_Animate/wiki). Ce dépôt n'est pas maintenu activement ; une proposition de correction peut passer par une [pull request](https://github.com/AJARProject/AJUI_Animate_source/pulls).

**4D 21 R4**, mode projet, `compatibilityVersion` 2140. Licence MIT (`LICENSE`).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot.

Documentation : [français](Documentation/AJUI_Animate.fr.md), [English](Documentation/AJUI_Animate.en.md). Analyse du dépôt d'origine : [ANALYSIS.md](ANALYSIS.md).

## Installation rapide

**Interprété.** Ouvrir `AJUI_Animate/Project/AJUI_Animate.4DProject` avec 4D 21 R4, ou déclarer le dossier `AJUI_Animate` comme dépendance d'un hôte. Une dépendance vers les sources ne fonctionne qu'en interprété. Exemple de `dependencies.json` hôte : `"AJUI_Animate": {"github": "AJARProject/AJUI_Animate_source"}`. **AJ_Math** est déclaré dans `AJUI_Animate/Project/Sources/dependencies.json` (`github: AJARProject/AJ_Math_source`, version `^2.1.1`) : le gestionnaire de dépendances de 4D l'installe automatiquement chez l'hôte, il n'est plus nécessaire de le déclarer soi-même.

**Compilé.** Construire le composant (Développement > Générer l'application, ou `BUILD APPLICATION` sur `AJUI_Animate/Settings/buildApp.4DSettings`) et placer le `.4dbase` produit (avec `AJUI_Animate.4DZ`) dans le dossier `Components` de l'hôte, avec AJ_Math compilé. Un hôte compilé ne charge pas un composant interprété.

**Depuis GitHub.** Déclarer `"AJUI_Animate": {"github": "AJARProject/AJUI_Animate_source"}` dans le `dependencies.json` de l'hôte : 4D télécharge la Release compilée (21 R4), puis AJ_Math et 4D SVG automatiquement.

`AJUI_Animate/Components/AJ_Math.4dbase` est le composant AJ_Math **2.1.1 compilé avec 4D 21 R4** (`Contents/AJ_Math.4DZ`), utilisé pour développer AJUI_Animate lui-même. Les courbes élastiques appellent `Math()`. 4D SVG est utilisé par les graphes et les couleurs. `Project/Sources/dependencies.json` le déclare explicitement (`github: 4d/4D-SVG`) ; sur 4D 21 R4 le composant est aussi livré dans `4D.app/Contents/Components`, donc cette entrée est facultative.

---

# AJUI Animate

4D component by AJAR SA that animates form objects (move, size, font, colors, easing, floating label).

Sources of the [AJUI_Animate](https://github.com/AJARProject/AJUI_Animate) component. The original wiki is [here](https://github.com/AJARProject/AJUI_Animate/wiki). This repository is not actively maintained; fixes can be proposed with a [pull request](https://github.com/AJARProject/AJUI_Animate_source/pulls).

**4D 21 R4**, project mode, `compatibilityVersion` 2140. MIT licence (`LICENSE`).

This new version was built with the help of Cursor and Grok Bot.

Documentation: [English](Documentation/AJUI_Animate.en.md), [français](Documentation/AJUI_Animate.fr.md). Analysis of the original tree: [ANALYSIS.md](ANALYSIS.md).

## Short install

**Interpreted.** Open `AJUI_Animate/Project/AJUI_Animate.4DProject` with 4D 21 R4, or declare the `AJUI_Animate` folder as a host dependency. A dependency on sources works in interpreted mode only. Example host `dependencies.json`: `"AJUI_Animate": {"github": "AJARProject/AJUI_Animate_source"}`. **AJ_Math** is declared in `AJUI_Animate/Project/Sources/dependencies.json` (`github: AJARProject/AJ_Math_source`, version `^2.1.1`): 4D's dependency manager installs it automatically in the host, which no longer needs to declare it.

**Compiled.** Build the component (Design > Build Application, or `BUILD APPLICATION` on `AJUI_Animate/Settings/buildApp.4DSettings`) and put the resulting `.4dbase` (with `AJUI_Animate.4DZ`) in the host `Components` folder, together with compiled AJ_Math. A compiled host does not load an interpreted component.

**From GitHub.** Declare `"AJUI_Animate": {"github": "AJARProject/AJUI_Animate_source"}` in the host `dependencies.json`: 4D downloads the compiled release (21 R4), then AJ_Math and 4D SVG automatically.

`AJUI_Animate/Components/AJ_Math.4dbase` is AJ_Math **2.1.1 compiled with 4D 21 R4** (`Contents/AJ_Math.4DZ`), used to develop AJUI_Animate itself. Elastic curves call `Math()`. 4D SVG is used by the graphs and the color helpers. `Project/Sources/dependencies.json` declares it explicitly (`github: 4d/4D-SVG`). On 4D 21 R4 the component is also shipped in `4D.app/Contents/Components`, so that entry is optional.
