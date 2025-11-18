SOURCES = remarks.tex
PROGRAM = remarks
TIMBIB  = /Users/ctk/tex/basics/tim.bib
OBIB  = /Users/ctk/tex/basics/others.bib

PDF = $(PROGRAM).pdf
$(PDF): $(SOURCES) $(TIMBIB) $(OBIB)
	pdflatex $(PROGRAM)
pdf:	$(PDF)
view: $(PDF) 
	open $(PDF)
bib: $(PDF)
	pdflatex $(PROGRAM); bibtex $(PROGRAM); pdflatex $(PROGRAM); pdflatex $(PROGRAM); 
