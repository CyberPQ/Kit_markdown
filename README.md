# Kit_markdown

Kit nécessaire pour la production de Markdown et PlantUML, en utilisant `Pandoc`

  cf. *MUL_Markdown.md* pour plus de détails
  
## Configuration pour *Visual Code Studio*

```json
    //-------- Pandoc Option Configuration --------

    // pandoc .pdf output option template that you would like to use
    "pandoc.pdfOptString": "-f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --self-contained --toc --top-level-division=chapter --base-header-level=1 --number-sections --variable mainfont=\"Liberation Serif\" --variable sansfont=\"Liberation Sans\" --variable monofont=\"Liberation Mono\" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm ",

    // pandoc .docx output option template that you would like to use
    "pandoc.docxOptString": "-f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --reference-doc=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/MDL_Tech-Med_7.docm --toc ",

    // pandoc .html output option template that you would like to use
    //"pandoc.htmlOptString": "--self-contained"
    "pandoc.htmlOptString": "-s -t html5 --toc -N -f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --css=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/style.css ",

    //"markdown.styles": [
    //     "style.css"
    // ],
```
