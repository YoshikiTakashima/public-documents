# Makefile -- top-level makefile of the paper. Uses latexmk as sub-command

LATEXMKFLAGS = -shell-escape -pdf -xelatex -interaction=nonstopmode
MAINFILE = main.tex

.PHONY: main clean check-and-compile-loop-forever FORCE

main: build
	open main.pdf
build:
	latexmk $(LATEXMKFLAGS) $(MAINFILE)

# This command runs the latexmk command in the "check-and-compile"
# loop (-pvs). This command will never terminate.
check-and-compile-loop-forever:
	latexmk -pvs $(LATEXMKFLAGS) $(MAINFILE)

clean:
	latexmk -C $(LATEXMKFLAGS) $(MAINFILE)
