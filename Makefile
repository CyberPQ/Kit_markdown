BUILD_DIR := out

# pandoc is a handy tool for converting between numerous text formats:
# http://johnmacfarlane.net/pandoc/installing.html
PANDOC := pandoc

# pandoc options
# Liberation fonts: http://en.wikipedia.org/wiki/Liberation_fonts
#PANDOC_PDF_OPTS := --toc --chapters --base-header-level=1 --number-sections --template=virsto_doc.tex --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=12pt --variable documentclass=book
PANDOC_PDF_OPTS :=--self-contained --toc --chapters --base-header-level=1 --number-sections --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm
PANDOC_EBOOK_OPTS := --toc --epub-stylesheet=epub.css --epub-cover-image=cover.jpg --base-header-level=1 --highlight-style=zenburn

# download kindlegen from http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
md := kindlegen
KINDLEGEN_OPTS :=

MARKDOWN := $(wildcard *.md)
PDF := $(patsubst %.md,$(BUILD_DIR)/%.pdf,$(MARKDOWN))
EBOOK := $(patsubst %.md,$(BUILD_DIR)/%.epub,$(MARKDOWN))
DOCX := $(patsubst %.md,$(BUILD_DIR)/%.docx,$(MARKDOWN))
WIKI := $(patsubst %.md,$(BUILD_DIR)/%.mediawiki,$(MARKDOWN))
HTML := $(patsubst %.md,$(BUILD_DIR)/%.html,$(MARKDOWN))

.PHONY: all checkdirs pdf ebook doc wiki html clean

#all: checkdirs $(PDF) $(EBOOK) $(DOCX) $(WIKI) $(HTML)
all: checkdirs $(PDF) $(DOCX) $(HTML)

checkdirs: $(BUILD_DIR)

pdf: checkdirs $(PDF)

ebook: checkdirs $(EBOOK)

doc: checkdirs $(DOCX)

wiki: checkdirs $(WIKI)

html: checkdirs $(HTML)

$(BUILD_DIR):
	@mkdir -p $@

# generate PDF
$(BUILD_DIR)/%.pdf: %.md
	$(PANDOC) $(PANDOC_PDF_OPTS) --from markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures -o $@ $<

# generate both iBooks (.epub) and then Kindle (.mobi) formats
$(BUILD_DIR)/%.epub: %.md
	$(PANDOC) $(PANDOC_EBOOK_OPTS) --from=markdown_github --self-contained -o $@ $<
	$(KINDLEGEN) $(KINDLEGEN_OPTS) $@ > /dev/null

# generate Microsoft Word documents (.docx)
$(BUILD_DIR)/%.docx: %.md
	$(PANDOC)  --from markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures --reference-docx=ref/MDL_Tech-Med_7.docm --table-of-contents -o $@ $<

# generate files suitable for pasting into mediawiki
$(BUILD_DIR)/%.mediawiki: %.md
	$(PANDOC) -t mediawiki --from=markdown_github --highlight-style=zenburn --self-contained -o $@ $<

# generate HTML files
$(BUILD_DIR)/%.html: %.md
	$(PANDOC) --from markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures --self-contained --standalone --table-of-contents --css=ref/style.css -o $@ $<

clean:
	@rm -rf $(BUILD_DIR)


