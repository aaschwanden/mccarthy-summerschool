# Needs the pdfnup package

all: thermodynamics-slides thermodynamics-slides-handout thermodynamics-script dynamics-slides dynamics-slides-handout dynamics-script exercise-d exercise-t solution-dynamics solution-thermodynamics

figures := figures/*.jpg figures/*.pdf


exercise-d: exercise-dynamics.tex $(figures)  
	pdflatex exercise-dynamics
	bibtex exercise-dynamics
	pdflatex exercise-dynamics
	pdflatex exercise-dynamics

exercise-t: exercise-thermodynamics.tex $(figures)  
	pdflatex exercise-thermodynamics
	bibtex exercise-thermodynamics
	pdflatex exercise-thermodynamics
	pdflatex exercise-thermodynamics

solution-dynamics: solution-dynamics.tex $(figures)  
	pdflatex solution-dynamics
	pdflatex solution-dynamics

solution-thermodynamics: solution-thermodynamics.tex $(figures)  
	pdflatex solution-thermodynamics
	pdflatex solution-thermodynamics

thermodynamics-script: thermodynamics-script.tex $(figures)  
	pdflatex thermodynamics-script
	bibtex thermodynamics-script
	pdflatex thermodynamics-script
	pdflatex thermodynamics-script

thermodynamics-slides: thermodynamics-slides.tex $(figures)  
	pdflatex thermodynamics-slides
	pdflatex thermodynamics-slides

thermodynamics-slides-handout: thermodynamics-slides.tex $(figures)  
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" < thermodynamics-slides.tex > thermodynamics-slides-handout.tex	
	pdflatex thermodynamics-slides-handout
	pdflatex thermodynamics-slides-handout
	@pdfnup --nup 2x2 --delta "1cm 1cm" thermodynamics-slides-handout.pdf

dynamics-script: dynamics-script.tex $(figures)  
	pdflatex dynamics-script
	bibtex dynamics-script
	pdflatex dynamics-script
	pdflatex dynamics-script

dynamics-slides: dynamics-slides-2016.tex $(figures)  
	pdflatex dynamics-slides-2016
	pdflatex dynamics-slides-2016

dynamics-slides-handout: dynamics-slides-2016.tex $(figures)  
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" < dynamics-slides-2016.tex > dynamics-slides-handout.tex	
	pdflatex dynamics-slides-handout
	pdflatex dynamics-slides-handout
	@pdfnup --nup 2x2 --delta "1cm 1cm" dynamics-slides-handout.pdf

zips: all
	rm -rf aschwanden_mccarthy/	 # clean out if prior existence
	mkdir aschwanden_mccarthy/
	cp thermodynamics-script.pdf thermodynamics-slides-handout-nup.pdf dynamics-slides-handout-nup.pdf dynamics-script.pdf exercise-dynamics.pdf solution-dynamics.pdf exercise-thermodynamics.pdf solution-thermodynamics.pdf aschwanden_mccarthy/
	cp README aschwanden_mccarthy/
	zip -r aschwanden_mccarthy.zip aschwanden_mccarthy/
	tar -cvzf aschwanden_mccarthy.tar.gz aschwanden_mccarthy/*
	rm -rf aschwanden_mccarthy/

.PHONY: clean

clean:
	@rm -f *.out *.aux *.log *.bbl *.blg *.nav *.snm *.synctex.gz *.toc

distclean: clean
	@rm -f *~ *.pdf

