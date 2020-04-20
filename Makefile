BUILD_DIR := out
IMAGES_DIR := images

# pandoc is a handy tool for converting between numerous text formats:
# http://johnmacfarlane.net/pandoc/installing.html
PANDOC := pandoc

# pandoc options
# Liberation fonts: http://en.wikipedia.org/wiki/Liberation_fonts
EBOOK_OPTIONS := --toc --epub-stylesheet=epub.css --epub-cover-image=cover.jpg --base-header-level=1 --highlight-style=zenburn
INPUT_FORMAT :=--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars
LUA_FILTER :=--lua-filter=ref/diagram-generator.lua --metadata=plantumlPath:"ref/plantuml.jar" #--metadata=dotPath:"c:\Program Files (x86)\Graphviz2.38\bin\dot.exe"
HTML_OPTIONS :=--self-contained --standalone --table-of-contents --css=ref/style.css --number-sections --mathml
DOCX_OPTIONS :=--self-contained --standalone --reference-doc=ref/MDL_Tech-Med.docm --table-of-contents
PDF_OPTIONS :=--self-contained --toc --top-level-division=chapter --shift-heading-level-by=1 --number-sections --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm

# download kindlegen from http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
KINDLEGEN := kindlegen
KINDLEGEN_OPTS :=

MARKDOWN := $(wildcard *.md)
PDF   := $(patsubst %.md, $(BUILD_DIR)/%.pdf       ,$(MARKDOWN))
EBOOK := $(patsubst %.md, $(BUILD_DIR)/%.epub      ,$(MARKDOWN))
DOCX  := $(patsubst %.md, $(BUILD_DIR)/%.docx      ,$(MARKDOWN))
WIKI  := $(patsubst %.md, $(BUILD_DIR)/%.mediawiki ,$(MARKDOWN))
HTML  := $(patsubst %.md, $(BUILD_DIR)/%.html      ,$(MARKDOWN))
PLANTUML := $(wildcard *.plantuml)
PNG  := $(patsubst %.plantuml, images/%.png        ,$(PLANTUML))

.PHONY: all checkdirs pdf ebook doc wiki html clean png

#all: checkdirs  $(HTML) $(PDF) $(EBOOK) $(DOCX) $(WIKI)
all: checkdirs png $(HTML) $(DOCX) $(PDF)

checkdirs: $(BUILD_DIR) $(IMAGES_DIR)

pdf: checkdirs png $(PDF)

ebook: checkdirs png $(EBOOK)

doc: checkdirs png $(DOCX)

wiki: checkdirs png $(WIKI)

html: checkdirs png $(HTML)

png:  checkdirs $(PNG)

$(BUILD_DIR):
	@mkdir -p $@

$(IMAGES_DIR):
	@mkdir -p $@
	
# generate PlantUML diagramms
$(IMAGES_DIR)/%.png: %.plantuml
	java -jar ref/plantuml.jar -charset UTF-8  -o $(IMAGES_DIR) $<
	
# generate PDF
$(BUILD_DIR)/%.pdf: %.md
	$(PANDOC) $(INPUT_FORMAT)  $< -t latex -o $@ $(LUA_FILTER%)  $(PDF_OPTIONS)

# generate both iBooks (.epub) and then Kindle (.mobi) formats
$(BUILD_DIR)/%.epub: %.md
	$(PANDOC) $(EBOOK_OPTIONS) --from=markdown_github --self-contained -o $@ $<
	$(KINDLEGEN) $(KINDLEGEN_OPTS) $@ > /dev/null

# generate Microsoft Word documents (.docx)
$(BUILD_DIR)/%.docx: %.md
	$(PANDOC) $(INPUT_FORMAT)  $< -t docx -o $@ $(LUA_FILTER%)  $(DOCX_OPTIONS)

# generate files suitable for pasting into mediawiki
$(BUILD_DIR)/%.mediawiki: %.md
	$(PANDOC) -t mediawiki --from=markdown_github --highlight-style=zenburn --self-contained -o $@ $<

# generate HTML files
$(BUILD_DIR)/%.html: %.md
	$(PANDOC) $(INPUT_FORMAT)  $< -t html5 -o $@ $(LUA_FILTER%)  $(HTML_OPTIONS)

clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(IMAGES_DIR)
