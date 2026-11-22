# Compiled component kept aside

`AJUI_Animate.4DZ` is the compiled package that used to sit in `Components/AJUI_Animate.4dbase/`. The bytes are unchanged. It was moved so 4D loads the project sources instead.

The [components](https://developer.4d.com/docs/21-R4/Project/components) page gives the Components folder a higher priority than `dependencies.json`. Left in `Components/`, this 2020 archive would overload the 21 R4 source dependency declared for this host.

Interpreted mode uses `environment4d.json` (`../AJUI_Animate`). A compiled host still needs a component built with 4D 21 R4. Put that build back in `Components/`; do not put this archive back there.

# Composant compilé conservé à part

`AJUI_Animate.4DZ` est le paquet compilé qui se trouvait dans `Components/AJUI_Animate.4dbase/`. Les octets n'ont pas été modifiés. Il a été déplacé pour que 4D charge les sources du projet.

La page [composants](https://developer.4d.com/docs/21-R4/Project/components) donne au dossier Components une priorité plus haute que `dependencies.json`. Laissé dans `Components/`, cette archive de 2020 masquerait la dépendance vers les sources 21 R4 de cet hôte.

Le mode interprété utilise `environment4d.json` (`../AJUI_Animate`). Un hôte compilé a besoin d'un composant construit avec 4D 21 R4. C'est ce build qu'il faut replacer dans `Components/`, pas cette archive.
