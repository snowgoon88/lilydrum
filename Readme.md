# Quelques outils pour travailler la batterie

Publié sur https://snowgoon88.github.io/lilydrum/

## partitions et cours
Surtout fait avec [lilypond (2.18.2)](http://lilypond.org/website/manuals.fr.html)

Compiler .ly -> .pdf : `lilypond <filename>`

Compiler .lytex -> .pdf : `./litex.sh <filename.lytex>

### Version HTML
- `./litex.sh -nc cours `  // compile sans nettoyer
- `./deploy_html.sh`       // passe en HTML en utilisant les images sur disk
- `./litex.sh cours `      // compile et nettoye
- éventuellement, quelques nettoyages supplémentaires...
## Cartes
voir le README du répertoire Cards :o)
