#!/bin/sh
cp ../scripts.py .
python -c 'import scripts; scripts.clean()'
rm -rf scripts.py
rm -rf runestone sphinx-* *.pyc automake*
rm -rf _build __pycache__
rm -rf *.out *.log *.toc *.pdf *.log *.dlop *.toc *.bbl
rm -rf tmp_* *aux *idx *blg *dlog *.tex 
