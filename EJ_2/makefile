# This makefile is inspired from: https://stackoverflow.com/questions/7004702/how-can-i-create-a-makefile-for-c-projects-with-src-obj-and-bin-subdirectories

# project name (generate executable with this name)
TARGET   = tp1

COMPILER = iverilog
CFLAGS   = 

# change these to proper directories where each file should be
SRCDIR   = src
OBJDIR	 = obj
BINDIR   = bin

SOURCES  := $(wildcard $(SRCDIR)/EJ_*/*.v)
OBJECTS  := $(SOURCES: $(SRCDIR)/%.v=$(OBJDIR)/%.o)
rm       = rm -f

$(BINDIR)/$(TARGET): $(SOURCES)
	@mkdir -p bin
	@$(COMPILER) $(SOURCES) $(CFLAGS) -o $@
	@echo "Compilation complete!"


.PHONY: clean
clean: 
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"

.PHONY: purge
purge: 
	clean
	@$(rm) -rf $(BINDIR)
	@echo "Purge complete!"

