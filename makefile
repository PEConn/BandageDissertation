TEXS= $(shell find . -name "*.tex")
TIKZS=$(shell find . -name "*.tikz") 
	
LATEX=latex
BIBTEX=bibtex
DVIPS=dvips
PS2PDF=ps2pdf

all: Dissertation.pdf
Dissertation.pdf: Dissertation.ps
	$(PS2PDF) -dEmbedAllFonts=true Dissertation.ps test.pdf
	ps2pdf13 -dPDFSETTINGS=/prepress test.pdf Dissertation.pdf
	rm -f test.pdf

Dissertation.ps: Dissertation.dvi
	$(DVIPS) -Pdownload35 -ta4 Dissertation.dvi

Dissertation.dvi: ${TEXS} ${TIKZS} Bibliography.bib
	$(LATEX) -shell-escape Dissertation
	$(BIBTEX) Dissertation
	$(LATEX) -shell-escape Dissertation
	$(LATEX) -shell-escape Dissertation

clean:
	$(RM) -f Dissertation.pdf Dissertation.ps Dissertation.dvi 
	$(RM) -f *.log *.aux *.toc *.bbl *.lot *.lof

