HTML_FILE=$(ls *.html)
cat $HTML_FILE| pandoc --from html --to markdown_strict -o ${HTML_FILE:s/.html/.md/}
