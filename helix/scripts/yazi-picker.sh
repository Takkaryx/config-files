#!/bin/bash

# open_in_helix_from_yazi.sh
tmpfile=/tmp/yazi-choice.txt
rm -f $tmpfile
yazi --chooser-file=$tmpfile
zellij action toggle-floating-panes
zellij action write 27 # send escape-key
zellij action write-chars ":open $(tr '\n' ' ' < $tmpfile)"
zellij action write 13 # send enter-key
zellij action toggle-floating-panes
zellij action close-pane
