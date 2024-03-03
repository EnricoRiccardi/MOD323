#!/bin/bash
#
# bash ../make_slides.sh slides_nickname.do.txt
#
# But this script is normally run from make.sh to make both
# chapter and slides.
set -e 

dofile=$1
class=MOD323
if [ ! -f part-$dofile-$class.do.txt ]; then
  echo "No such file: class-$dofile-$class"
  exit 1
fi

filename=`echo part-$dofile-$class | sed 's/\.do\.txt//'`

# LaTeX PDF for printing
# (Smart to make this first to detect latex errors - HTML/MathJax
# gives far less errors and warnings)

preprocess -DFORMAT=pdflatex ../newcommands.p.tex > newcommands_keep.tex

# LaTeX Beamer
doconce format pdflatex $filename --latex_title_layout=beamer --latex_table_format=footnotesize --latex_admon_title_no_period --latex_code_style=pyg --no_ampersand_quote 
doconce slides_beamer $filename --beamer_slide_theme=blue_shadow
pdflatex -shell-escape $filename
pdflatex -shell-escape $filename
mv ${filename}.pdf ${filename}-beamer.pdf

# Handouts
doconce format pdflatex $filename --latex_title_layout=beamer --latex_table_format=footnotesize --latex_admon_title_no_period --latex_code_style=pyg --no_ampersand_quote 
doconce slides_beamer $filename --beamer_slide_theme=blue_shadow --handout
pdflatex -shell-escape $filename
pdfjam ${filename}.pdf --no-landscape --frame true --nup 2x3 --suffix 6up
mv ${filename}-6up.pdf ${filename}-6up.pdf
./clean.sh
