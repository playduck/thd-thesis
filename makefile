OUTPUTDIRECTORY = dist
MAINFILE = document
EXTRA_MEM = 2000000
OPEN_CMD = open

build:
# initial compilation
	xelatex --extra-mem-top=${EXTRA_MEM} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	makeglossaries -d ${OUTPUTDIRECTORY} ${MAINFILE}
	biber -D --output-directory ${OUTPUTDIRECTORY} ${MAINFILE}
# post compilation
	xelatex --extra-mem-top=${EXTRA_MEM} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	xelatex --shell-escape --extra-mem-top=${EXTRA_MEM} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

open:
	${OPEN_CMD} ${OUTPUTDIRECTORY}/${MAINFILE}.pdf

clean:
	rm -rf ./${OUTPUTDIRECTORY}
	# rm -f *.out *.aux *.dvi *.log *-blx.bib *.blg *.bbl *.acn *.acr *.alg *.glg *.glo *.gls *.ist *.lof *.lot *.bcf *.run.xml *.tex-e *.toc *._gstmp *.acn *.acr *.alg *.aux *.bbl *.bcf *.blg
