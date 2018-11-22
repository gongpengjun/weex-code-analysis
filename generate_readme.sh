#!/bin/sh
rm -f README.md
echo "# weex-study-ppt" > title && ls -l . | sed -n -e '/weex.*md/'p list.txt | sed -n -e 's/^.*\(weex.*md\)$/\1/'p | sed -n -e 's/\(\weex.*md\)/- [`\1`](\1)/'p | sed -e '1{x;p;x;}' | sed -e '1{x;p;x;}' | sed -e "1r title" | sed -e '1d' > README.md && rm title
