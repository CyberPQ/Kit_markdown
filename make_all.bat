@echo off
rem =======================================================================================================
rem                   GENERATION DE LA DOCUMENTATION DEPUIS LES FICHIERS MARKDOWN
rem =======================================================================================================
rem
rem  Il faut au pr‚alable avoir installer le logiciel pandoc. Le programme d'installation 
rem  est disponible ici :
rem
rem    - https://github.com/jgm/pandoc/releases/download/1.15.0.6/pandoc-1.15.0.6-windows.msi
rem    - T:\Outils\_Conversion Fichier\Kit_markdown  <============== A FAIRE !!!
rem
rem  Paramètres d'appel :
rem     - 'make_all.bat md'    Ne genere QUE les fichiers issues du markdown (pas les images PlantUML)
rem     - 'make_all.bat uml'   Ne genere QUE les images PlantUML (pas les fichiers issues du markdown)
rem     - 'make_all.bat vsc'   Affiche les options pour le plugin 'vscode-pandoc' dans Visual Studio Code
rem 
rem =======================================================================================================
 
rem -------------------------------------------------------------------
rem Chemin et configuration 
rem -------------------------------------------------------------------
SET PANDOC="pandoc.exe"
rem SET PANDOC="%LOCALAPPDATA%\Pandoc\pandoc.exe"
SET PATH=%PATH%;"C:\Program Files (x86)\MiKTeX 2.9\miktex\bin";"c:\Program Files (x86)\Java\jre6\bin"
SET BUILD_DIR=out
set TAB=    
 
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
 
 
rem -------------------------------------------------------------------
rem Options pandoc
rem -------------------------------------------------------------------
SET INPUT_FORMAT=--from markdown+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures+task_lists+lists_without_preceding_blankline+tex_math_dollars
SET LUA_FILTER=--lua-filter=ref\diagram-generator.lua --metadata=plantumlPath:"ref\plantuml.jar" --metadata=dotPath:"c:\Program Files (x86)\Graphviz2.38\bin\dot.exe"
SET HTML_OPTIONS=--self-contained --standalone --table-of-contents --css=ref\style.css --number-sections --mathjax
SET DOCX_OPTIONS=--self-contained --standalone --reference-doc=ref\MDL_Tech-Med.docm --table-of-contents
SET ODT_OPTIONS=--self-contained --standalone --reference-doc=ref\MDL_Tech-Med.odt --table-of-contents
SET PDF_OPTIONS=--self-contained --toc --top-level-division=chapter --shift-heading-level-by=1 --number-sections --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm

rem Petit raccourcit pour ne g‚n‚rer que les documents (pas les images) en appelant le batch avec le paramŠtre 'md'
if "%1"=="md" GOTO :Make_MD

rem Petit raccourcit pour afficher les options pour Visual Studio Code avec le paramŠtre 'vsc'
if "%1"=="vsc" GOTO :Make_VSC

echo.
echo === Generation complete de la documentation dans le repertoire "%BUILD_DIR%" ===
echo.

rem -------------------------------------------------------------------
rem  G‚n‚ration des images
rem -------------------------------------------------------------------
:Make_image
echo Generation des images UML :
FOR %%I in (*.plantuml) DO (
                echo %TAB%- %%~nI...
                java -jar ref\plantuml.jar  -charset UTF-8 -o "images" %%I
)
echo.

rem Petit raccourcit pour ne g‚n‚rer que les images (pas les documents) en appelant le batch avec le paramŠtre 'uml'
if "%1"=="uml" GOTO :Fin
 
rem -------------------------------------------------------------------
rem G‚n‚ration des doc aux diff‚rents formats
rem -------------------------------------------------------------------
:Make_MD
echo Generation des doc aux differents formats :
FOR %%I in (*.md) DO (
                echo %TAB%- %%I...
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t docx  -o "%BUILD_DIR%\%%~nI.docx" %LUA_FILTER% %DOCX_OPTIONS%
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t odt   -o "%BUILD_DIR%\%%~nI.odt"  %LUA_FILTER% %ODT_OPTIONS%
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t html5 -o "%BUILD_DIR%\%%~nI.html" %LUA_FILTER% %HTML_OPTIONS%
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t latex -o "%BUILD_DIR%\%%~nI.pdf"  %LUA_FILTER% %PDF_OPTIONS%
)
echo.
GOTO :Fin

:Make_VSC
rem --------------------------------------------------------------------------
rem G‚n‚ration des options du plugin 'vscode-pandoc' dans Visual Studio Code
rem --------------------------------------------------------------------------
:Make_MD
echo Option pour le plugin 'vscode-pandoc' dans Visual Studio Code :

rem remplacement de "ref\" par le bon chemin, sp‚cifique à l'installation
setlocal ENABLEDELAYEDEXPANSION
SET NEWPATH=%~dp0ref\
SET "INPUT_FORMAT=%INPUT_FORMAT:ref\=!NEWPATH!%"
SET "LUA_FILTER=%LUA_FILTER:ref\=!NEWPATH!%"
SET "DOCX_OPTIONS=%DOCX_OPTIONS:ref\=!NEWPATH!%"
SET "HTML_OPTIONS=%HTML_OPTIONS:ref\=!NEWPATH!%"
SET "PDF_OPTIONS=%PDF_OPTIONS:ref\=!NEWPATH!%"

rem remplacement des backslashes par des slashes (compatible JSON)
SET "INPUT_FORMAT=%INPUT_FORMAT:\=/%"
SET "LUA_FILTER=%LUA_FILTER:\=/%"
SET "DOCX_OPTIONS=%DOCX_OPTIONS:\=/%"
SET "HTML_OPTIONS=%HTML_OPTIONS:\=/%"
SET "PDF_OPTIONS=%PDF_OPTIONS:\=/%"

rem echapement des guillemets doubles (compatible JSON)
SET "INPUT_FORMAT=%INPUT_FORMAT:"=\"%"
SET "LUA_FILTER=%LUA_FILTER:"=\"%"
SET "DOCX_OPTIONS=%DOCX_OPTIONS:"=\"%"
SET "HTML_OPTIONS=%HTML_OPTIONS:"=\"%"
SET "PDF_OPTIONS=%PDF_OPTIONS:"=\"%"

rem echo.
rem echo INPUT_FORMAT : %INPUT_FORMAT%
rem echo LUA_FILTER   : %LUA_FILTER%
rem echo DOCX_OPTIONS : %DOCX_OPTIONS%
rem echo HTML_OPTIONS : %HTML_OPTIONS%
rem echo PDF_OPTIONS  : %PDF_OPTIONS%
rem echo.

echo.

echo %TAB%"pandoc.docxOptString": "%INPUT_FORMAT% %LUA_FILTER% %DOCX_OPTIONS%",
echo %TAB%"pandoc.htmlOptString": "%INPUT_FORMAT% %LUA_FILTER% %HTML_OPTIONS%",
echo %TAB%"pandoc.pdfOptString": "%INPUT_FORMAT% %LUA_FILTER% %PDF_OPTIONS%"
echo.

GOTO :Fin
 
:Fin 
