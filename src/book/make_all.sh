function system {
  "$@"
  if [ $? -ne 0 ]; then
    echo "make.sh: unsuccessful command $@"
    echo "abort!"
    exit 1
  fi
}

cp ../scripts.py .
system python -c "import scripts as s; s.compile_chapters()"
rm scripts.py
system ./make.sh
system ./make_html.sh
