#!/bin/bash

gsed -i '/^<\/head>$/i\<style>\n<\/style>' index.html

cat un.css | while read line
do
  gsed -i "/^<\/style>$/i\\$line" index.html
done
