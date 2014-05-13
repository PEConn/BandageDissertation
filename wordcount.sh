#!/bin/bash

set -e

function WordCount {
  detex $1 | wc -w 
}

back=$(WordCount Background/Background.tex)
impl=$(WordCount Implementation/Implementation.tex)
eval=$(WordCount Evaluation/Evaluation.tex)
total=$(WordCount Dissertation.tex)
misc=$((total-eval-impl-back))

printf "Background:     %4d\n" ${back}
printf "Implementation: %4d\n" ${impl}
printf "Evaluation:     %4d\n" ${eval}
printf "Misc:           %4d\n" ${misc}
#printf "-------------------\n"
printf "Total:          %4d\n" ${total}
