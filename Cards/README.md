# Génération de cartes de rythme

## dépendances
- lilypond
- latex
- python3 avec yaml (pyyaml)

## générer les cartes
- préparer un fichier yaml : filename.yaml
- générer du litex : '''python3 make_cards.py filename.yaml > filename.lytex'''
- générer le pdf : '''./litex.sh filename'''

## Définir les cartes => fichier .yaml
Un exemple de fichier structuré est dans example.yaml (tiré de Rock12)
- les types de cartes ("UnTrois", "Et", "DeuxQuatre"), la façon dont c'est affiché (1/3, &, 2/4). Attention au \\ avant le &.
- les complexité (simple, moyen, complexe)
- les couleurs des combinaison type x complexité
- la lettre de la carte (A) et le code lilypond associé (<hh sn>8)

## Les templates des cartes => noyé dans make_cards.py
- dimension cartes : tikz_header => pgfmathsetmacro
- dimension cartouche type : tikz_header => pgfmathsetmacro
- style cartes : tikz_header => cardconersty
- style cadre intérieur carte : tikz_header => contentsty
- détail cadre type : tikz_header => newcommand => cardtype
- détail fond carte : tikz_header => newcommand => cardbackground
- détail lettre carte : card_template => letter
- détail type dans coin : card_template => display_type 
- détail cadre notes : notes_nodes

La fonction qui écrit une carte est '''card_template''', appelée par '''make_latex'''


