# Kit_markdown

Kit nécessaire pour la production de Markdown et PlantUML, en utilisant `Pandoc`

  cf. *MUL_Markdown.md* pour plus de détails
  
## Configuration pour *Visual Code Studio*

```json
    //-------- Pandoc Option Configuration --------

    // pandoc .docx output option template that you would like to use
    "pandoc.docxOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --standalone --reference-doc=\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/MDL_Tech-Med.docm\" --table-of-contents",
    
    // pandoc .html output option template that you would like to use
    "pandoc.htmlOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --standalone --table-of-contents --css=\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/style.css\" --number-sections --mathml",

    // pandoc .pdf output option template that you would like to use
    "pandoc.pdfOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --toc --top-level-division=chapter --shift-heading-level-by=1 --number-sections --variable mainfont=\"Liberation Serif\" --variable sansfont=\"Liberation Sans\" --variable monofont=\"Liberation Mono\" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm"
```
