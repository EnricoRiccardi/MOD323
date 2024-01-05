#!/bin/sh
cp ../scripts.py .
python -c 'import scripts; scripts.clean()'
rm -rf scripts.py
rm -rf runestone sphinx-* *.pyc automake*
rm -rf _build __pycache__
rm -rf *.aux *.dlog *.html *.idx *.log *.out tmp_* *.old* *.tex
