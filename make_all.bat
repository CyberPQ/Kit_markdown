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
rem 
rem =======================================================================================================
 
rem -------------------------------------------------------------------
rem Chemin et configuration 
rem -------------------------------------------------------------------
SET PANDOC="%LOCALAPPDATA%\Pandoc\pandoc.exe"
SET PATH=%PATH%;c:\Users\BPR\Downloads\miktex\bin\;"c:\Program Files (x86)\Java\jre6\bin"
SET BUILD_DIR=out
set TAB=    
 
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
 
 
rem -------------------------------------------------------------------
rem Options pandoc
rem -------------------------------------------------------------------
SET INPUT_FORMAT=--from markdown_github+mmd_title_block+table_captions+multiline_tables+grid_tables+implicit_figures
 
SET HTML_OPTIONS=--self-contained --standalone --table-of-contents --css=ref\style.css

SET DOCX_OPTIONS=--reference-docx=ref\MDL_Tech-Med_7.docm --table-of-contents

SET PDF_OPTIONS=--self-contained --toc --chapters --base-header-level=1 --number-sections --variable mainfont="Liberation Serif" --variable sansfont="Liberation Sans" --variable monofont="Liberation Mono" --variable fontsize=10pt --variable documentclass=book -V geometry:margin=2cm 


rem Petit raccourcit pour ne g‚n‚rer que les documents (pas les images) en appelant le batch avec le paramŠtre 'md'
if "%1"=="md" GOTO :Make_MD

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
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t docx  -o "%BUILD_DIR%\%%~nI.docx" %DOCX_OPTIONS%
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t html5 -o "%BUILD_DIR%\%%~nI.html" %HTML_OPTIONS%
                %PANDOC% %INPUT_FORMAT% "%%~nI.md" -t latex -o "%BUILD_DIR%\%%~nI.pdf"  %PDF_OPTIONS%
)
echo.
 
:Fin 
echo ok !
