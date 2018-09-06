##################################################################
# Makefile for LaTeX
##################################################################

FILES = main
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.log *.fdb_latexmk *.fls

informe: $(FILES).tex
	pdflatex $(FILES).tex
	pdflatex $(FILES).tex
	rm -rf $(OTHER)
	clear
	echo Finished Compiling
