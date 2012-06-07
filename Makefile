all: thermodynamics-slides thermodynamics-slides-handout thermodynamics-script dynamics-slides dynamics-slides-handout dynamics-script exercise solution

figures := figures/*.jpg figures/*.pdf


exercise: exercise.tex $(figures)  
	pdflatex exercise
	pdflatex exercise

solution: solution.tex $(figures)  
	pdflatex solution
	pdflatex solution

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
	@pdfnup --nup 1x2 --delta "1cm 1cm" thermodynamics-slides-handout.pdf

dynamics-script: dynamics-script.tex $(figures)  
	pdflatex dynamics-script
	bibtex dynamics-script
	pdflatex dynamics-script
	pdflatex dynamics-script

dynamics-slides: dynamics-slides.tex $(figures)  
	pdflatex dynamics-slides
	pdflatex dynamics-slides

dynamics-slides-handout: dynamics-slides.tex $(figures)  
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" < dynamics-slides.tex > dynamics-slides-handout.tex	
	pdflatex dynamics-slides-handout
	pdflatex dynamics-slides-handout
	@pdfnup --nup 1x2 --delta "1cm 1cm" dynamics-slides-handout.pdf

dynamics-script: dynamics-script.tex $(figures)  
	pdflatex dynamics-script
	bibtex dynamics-script
	pdflatex dynamics-script
	pdflatex dynamics-script

.PHONY: clean

clean:
	@rm -f *.out *.aux *.log *.bbl *.blg *.nav *.snm *.synctex.gz *.toc

distclean: clean
	@rm -f *~ *.pdf

