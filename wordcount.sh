#!/bin/bash

set -e

function WordCount {
  detex $1 | wc -w 
}

WordCount Dissertation.tex
#back=$(WordCount Background/Background.tex)
#impl=$(WordCount Implementation/Implementation.tex)
#eval=$(WordCount Evaluation/Evaluation.tex)
#total=$(WordCount Dissertation.tex)
#misc=$((eval+impl+back))
#
#printf "Background:     %4d\n" ${back}
#printf "Implementation: %4d\n" ${impl}
#printf "Evaluation:     %4d\n" ${eval}
#echo   "--------------------"
#printf "Total 1:        %4d\n" ${misc}
#printf "Total 2:        %4d\n" ${total}
