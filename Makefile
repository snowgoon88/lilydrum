LATEX=latexmk -pdf

help:
	@echo "make cours"
	@echo "make tabla"

cours :
	$(LATEX) cours.tex

tabla :
	$(LATEX) tabla.tex

clear :
	latexmk -c

