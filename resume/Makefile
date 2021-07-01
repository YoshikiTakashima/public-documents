# Makefile --- Makefile for PLDI2021 Summary
#
# Note: build me with `latex-build.sh`

SHELL_ESC=-halt-on-error -shell-escape
DOC=main

.SUFFIXES: .bib .pdf .tex
.PHONY:

run: $(DOC).pdf

$(DOC).pdf: $(DOC).bbl $(DOC).tex
	pdflatex $(SHELL_ESC) $(DOC).tex
	sleep 1 # sleep to allow the sync script to recover
	pdflatex $(SHELL_ESC) $(DOC).tex

$(DOC).bbl: $(DOC).aux
	-bibtex $(DOC).aux

$(DOC).aux:
	pdflatex $(SHELL_ESC) $(DOC).tex
	pdflatex $(SHELL_ESC) $(DOC).tex
	rm $(DOC).pdf

clean:
	-rm -rf *.aux *.lof *.log *.lot *.toc *.bbl *.blg *pdf *out *.ps *.dvi
	-rm -rf ./res/build
	-rm -rf ./_minted-*
