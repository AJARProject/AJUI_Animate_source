# AJUI Animate

Composant 4D d'AJAR SA qui anime des objets de formulaire (déplacement, taille, police, couleurs, easing, floating label).

Sources du composant [AJUI_Animate](https://github.com/AJARProject/AJUI_Animate). Le wiki d'origine reste [ici](https://github.com/AJARProject/AJUI_Animate/wiki). Ce dépôt n'est pas maintenu activement ; une proposition de correction peut passer par une [pull request](https://github.com/AJARProject/AJUI_Animate_source/pulls).

**4D 21 R4**, mode projet, `compatibilityVersion` 2140. Licence MIT (`LICENSE`).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot.

Documentation : [français](Documentation/AJUI_Animate.fr.md), [English](Documentation/AJUI_Animate.en.md). Analyse du dépôt d'origine : [ANALYSIS.md](ANALYSIS.md).

## Installation rapide

**Interprété.** Ouvrir `AJUI_Animate/Project/AJUI_Animate.4DProject` avec 4D 21 R4, ou déclarer le dossier `AJUI_Animate` comme dépendance d'un hôte (voir le labo `AJUI_AnimateLab_deprecated`). Une dépendance vers les sources ne fonctionne qu'en interprété.

**Compilé.** Construire le composant (Développement > Générer l'application, ou `BUILD APPLICATION` sur `AJUI_Animate/Settings/buildApp.4DSettings`) et placer le `.4dbase` produit dans le dossier `Components` de l'hôte. Un hôte compilé ne charge pas un composant interprété.

`AJUI_Animate/Components/AJ_Math.4dbase` est le binaire 19 R8, conservé. Le recompiler avec 4D 21 R4 avant d'utiliser les courbes élastiques (`Math()`).

---

# AJUI Animate

4D component by AJAR SA that animates form objects (move, size, font, colors, easing, floating label).

Sources of the [AJUI_Animate](https://github.com/AJARProject/AJUI_Animate) component. The original wiki is [here](https://github.com/AJARProject/AJUI_Animate/wiki). This repository is not actively maintained; fixes can be proposed with a [pull request](https://github.com/AJARProject/AJUI_Animate_source/pulls).

**4D 21 R4**, project mode, `compatibilityVersion` 2140. MIT licence (`LICENSE`).

This new version was built with the help of Cursor and Grok Bot.

Documentation: [English](Documentation/AJUI_Animate.en.md), [français](Documentation/AJUI_Animate.fr.md). Analysis of the original tree: [ANALYSIS.md](ANALYSIS.md).

## Short install

**Interpreted.** Open `AJUI_Animate/Project/AJUI_Animate.4DProject` with 4D 21 R4, or declare the `AJUI_Animate` folder as a host dependency (see the `AJUI_AnimateLab_deprecated` lab). A dependency on sources works in interpreted mode only.

**Compiled.** Build the component (Design > Build Application, or `BUILD APPLICATION` on `AJUI_Animate/Settings/buildApp.4DSettings`) and put the resulting `.4dbase` in the host `Components` folder. A compiled host does not load an interpreted component.

`AJUI_Animate/Components/AJ_Math.4dbase` is the 19 R8 binary and was kept. Rebuild it with 4D 21 R4 before using the elastic curves (`Math()`).
