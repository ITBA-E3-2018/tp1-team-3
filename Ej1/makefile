# This makefile is inspired from: https://stackoverflow.com/questions/7004702/how-can-i-create-a-makefile-for-c-projects-with-src-obj-and-bin-subdirectories

# project name (generate executable with this name)
TARGET   = run.o

COMPILER = g++
CFLAGS   = -w -std=c++11 -o

# change these to proper directories where each file should be
SRCDIR   = src
BINDIR   = bin

SOURCES  := $(wildcard $(SRCDIR)/*.cpp)
#OBJECTS  := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm       = rm -f

$(BINDIR)/$(TARGET): $(SOURCES)
	@mkdir -p bin
	$(COMPILER) $(SOURCES) $(CFLAGS) $@
#	$(COMPILER) $(wildcard *.v) $(CFLAGS) $@
	@echo "Compilation complete!"


.PHONY: clean
clean: 
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"

.PHONY: purge
purge: clean
	@$(rm) -rf $(BINDIR)
	@echo "Purge complete!"
	
