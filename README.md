# Kit_markdown

Kit nécessaire pour la production de Markdown et PlantUML, en utilisant le logiciel [Pandoc](https://pandoc.org/).

  cf. [MUL_Markdown.md](MUL_Markdown.md) pour plus de détails.

## Utilisation du kit sous Windows

### Installation

> A faire !

### Génération des documents

On peut générer les documents dans le répertoire _out_ dans les format **HTML**, **DOCX**, et **PDF** (via latex), à l'aide de la commande suivante :

```bash
cd Kit_markdown-master
make_all.bat
dir out
```

### Configuration pour *Visual Code Studio*

> Les chemins "en dur" des lignes suivantes doivent bien évidemment être ajustés !

```json
    //-------- Pandoc Option Configuration --------

    // pandoc .docx output option template that you would like to use
    "pandoc.docxOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --standalone --reference-doc=\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/MDL_Tech-Med.docm\" --table-of-contents",
    
    // pandoc .html output option template that you would like to use
    "pandoc.htmlOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --standalone --table-of-contents --css=\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/style.css\" --number-sections --mathml",

    // pandoc .pdf output option template that you would like to use
    "pandoc.pdfOptString": "--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars --lua-filter=c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/diagram-generator.lua --metadata=plantumlPath:\"c:/Users/baptiste.pierard/Documents/Perso/Kit_markdown_from_GitHub/ref/plantuml.jar\" --metadata=dotPath:\"c:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe\" --self-contained --toc --top-level-division=chapter --shift-heading-level-by=1 --number-sections --variable mainfont=\"Liberation Serif\" --variable sansfont=\"Liberation Sans\" --variable monofont=\"Liberation Mono\" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm"
```


## Utilisation du kit sous Linux

### Installation

C'est évidemment beaucoup plus simple que sous Windows ;-) !

```bash
sudo apt update
sudo apt install pandoc graphviz texlive-latex-base texlive-full
git clone git@github.com:CyberPQ/Kit_markdown.git
```

Si aucun développement n'est prévu, on peut remplacer le `git clone ...` ci-dessus par les commandes suivantes :
```bash
wget https://github.com/CyberPQ/Kit_markdown/archive/master.zip
unzip master.zip
```

### Génération des documents 

On peut générer les documents dans le répertoire _out_ dans les format **HTML**, **DOCX**, et **PDF** (via latex), à l'aide de la commande suivante :

```bash
cd Kit_markdown
make all
ls -1 out
```

### Configuration pour *Visual Code Studio* sous Linux

> Les chemins "en dur" des lignes suivantes doivent bien évidemment être ajustés !

```json
{
    "pandoc.docxOptString": "-f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --reference-doc=/home/bpr/Documents/Kit_markdown/ref/MDL_Tech-Med_7.docm --toc ",
    "pandoc.pdfOptString": "-f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --self-contained --toc --top-level-division=chapter --base-header-level=1 --number-sections --variable mainfont=\"Liberation Serif\" --variable sansfont=\"Liberation Sans\" --variable monofont=\"Liberation Mono\" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm ",
    "pandoc.htmlOptString": "-s -t html5 --toc -N -f markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+inline_notes --css=/home/bpr/Documents/Kit_markdown/ref/style.css "
}
```