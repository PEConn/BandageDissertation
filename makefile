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
	$(LATEX) Dissertation
	$(BIBTEX) Dissertation
	$(LATEX) Dissertation
	$(LATEX) Dissertation

clean:
	$(RM) -f Dissertation.pdf Dissertation.ps Dissertation.dvi 
	$(RM) -f *.log *.aux *.toc *.bbl *.lot *.lof

