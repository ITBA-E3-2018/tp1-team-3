# This makefile is inspired from: https://stackoverflow.com/questions/7004702/how-can-i-create-a-makefile-for-c-projects-with-src-obj-and-bin-subdirectories

# project name (generate executable with this name)
TARGET = main#compile .tex file with this name
NAME = electro3-tp1-grupo3-informe# generate pdf with this name 

SRCDIR = src#source code path
AUXDIR = aux#aux files path (*.log, *.aux)
PDFDIR = ..

SOURCES  = $(wildcard $(SRCDIR)/*.tex)
AUX      = $(wildcard $(PDFDIR)/*.aux)
AUX     += $(wildcard $(PDFDIR)/*.log)
rm       = rm -f

informe: $(SOURCES)
	@mkdir -p $(AUXDIR)
	@mkdir -p $(PDFDIR)
	@cd $(SRCDIR); pdflatex --interaction=batchmode --jobname=$(NAME) -halt-on-error -output-directory ../$(PDFDIR) $(TARGET).tex
	@echo "PDF generated"
ifneq ($(strip $(AUX)),)
	mv -f $(NAME).* $(AUXDIR)
endif

.PHONY: clean
clean:
	$(rm) $(AUXDIR)/*.*
	$(rm) $(PDFDIR)/$(NAME).pdf
	@echo "PDF and auxiliary files removed"

.PHONY: purge
purge: 
	clean
	@$(rm) -rf $(AUXDIR)
	@echo "Purge complete"

