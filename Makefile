all: slides slides-handout script exercise solution

figures := figures/*.jpg figures/*.pdf

# On Andy's computer only:
# Get bib file from source
getbib: 
	@cp ~/Library/texmf/bibtex/bib/mccarthy.bib .

exercise: exercise.tex $(figures)  
	pdflatex exercise
	pdflatex exercise

solution: solution.tex $(figures)  
	pdflatex solution
	pdflatex solution

slides: slides.tex $(figures)  
	pdflatex slides
	pdflatex slides

slides-handout: slides.tex $(figures)  
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" < slides.tex > slides-handout.tex	
	pdflatex slides-handout
	pdflatex slides-handout
	@pdfnup --nup 1x2 --delta "1cm 1cm" slides-handout.pdf

script: script.tex $(figures)  
	pdflatex script
	bibtex script
	pdflatex script
	pdflatex script


.PHONY: clean

clean:
	@rm -f *.out *.aux *.log *.bbl *.blg *.nav *.snm *.synctex.gz *.toc

distclean: clean
	@rm -f *~ *.pdf

