TEMPLATE_FOLDERS := $(shell find . -mindepth 1 -type d \( -name '.*' -prune -o -print \) )
TEMPLATE_FILES := commitlint.config.js

TEMPLATE_DESTINATION := $(HOME)/Templates

all: 
	mkdir -p $(TEMPLATE_DESTINATION)
	cp -r $(TEMPLATE_FILES) $(TEMPLATE_DESTINATION)
	cp -r $(TEMPLATE_FOLDERS) $(TEMPLATE_DESTINATION)

