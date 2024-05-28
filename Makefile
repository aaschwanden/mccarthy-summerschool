# Needs the pdfnup package

all: thermodynamics-slides thermodynamics-slides-handout thermodynamics-script dynamics-slides dynamics-slides-handout dynamics-script exercise-d exercise-t solution-dynamics solution-thermodynamics

src_dir=src

exercise-d:
	latexmk -pdf -cd ${src_dir}/exercise-dynamics.tex


exercise-t:
	latexmk -pdf -cd ${src_dir}/exercise-thermodynamics.tex

solution-dynamics:
	latexmk -pdf -cd ${src_dir}/solution-dynamics.tex

solution-thermodynamics:
	latexmk -pdf -cd ${src_dir}/solution-thermodynamics.tex

thermodynamics-script:
	latexmk -pdf -cd ${src_dir}/thermodynamics-script.tex

thermodynamics-slides:
	latexmk -pdf -cd ${src_dir}/thermodynamics-slides.tex

thermodynamics-slides-handout:
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" < ${src_dir}/thermodynamics-slides.tex > ${src_dir}/thermodynamics-slides-handout.tex	
	latexmk -pdf -cd ${src_dir}/thermodynamics-slides-handout.tex
	@pdfnup --nup 2x2 --delta "1cm 1cm" ${src_dir}/thermodynamics-slides-handout.pdf

dynamics-script:
	latexmk -pdf -cd ${src_dir}/dynamics-script.tex

dynamics-slides:
	latexmk -pdf -cd ${src_dir}/dynamics-slides.tex

dynamics-slides-handout:
	sed -e "s/]{beamer}/,handout]{beamer}/" -e "s/headline,//" <  ${src_dir}/dynamics-slides.tex >  ${src_dir}/dynamics-slides-handout.tex	
	latexmk -pdf -cd ${src_dir}/dynamics-slides-handout.tex
	@pdfnup --nup 2x2 --delta "1cm 1cm"  ${src_dir}/dynamics-slides-handout.pdf

zips: all
	rm -rf aschwanden_mccarthy/	 # clean out if prior existence
	mkdir aschwanden_mccarthy/
	cp ${src_dir}/thermodynamics-script.pdf ${src_dir}/thermodynamics-slides-handout-nup.pdf  ${src_dir}/dynamics-slides-handout-nup.pdf  ${src_dir}/exercise-dynamics.pdf  ${src_dir}solution-dynamics.pdf ${src_dir}/exercise-thermodynamics.pdf ${src_dir}/solution-thermodynamics.pdf aschwanden_mccarthy/
	cp README aschwanden_mccarthy/
	zip -r aschwanden_mccarthy.zip aschwanden_mccarthy/
	tar -cvzf aschwanden_mccarthy.tar.gz aschwanden_mccarthy/*
	rm -rf aschwanden_mccarthy/

.PHONY: clean

clean:
	@rm -f  ${src_dir}/*.out  ${src_dir}/*.aux  ${src_dir}/*.log  ${src_dir}/*.bbl ${src_dir}/*.blg  ${src_dir}/*.nav  ${src_dir}/*.snm  ${src_dir}/*.synctex.gz  ${src_dir}/*.toc

distclean: clean
	@rm -f  ${src_dir}/*~  ${src_dir}/*.pdf

