OUTPUTDIRECTORY = dist
MAINFILE = document

ifeq ($(OS),Windows_NT)
	OPEN = start
	EXTRA = --extra-mem-top=2000000
else
	OPEN = open
endif

build:
	xelatex ${EXTRA} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	makeglossaries -d ${OUTPUTDIRECTORY} ${MAINFILE}
	biber -D --output-directory ${OUTPUTDIRECTORY} ${MAINFILE}

	xelatex ${EXTRA} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	xelatex ${EXTRA} --shell-escape -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

open:
	${OPEN} ${OUTPUTDIRECTORY}/${MAINFILE}.pdf &

clean:
	rm -rf ./${OUTPUTDIRECTORY}
	# rm -f .out.aux .dvi.log -blx.bib.blg .bbl.acn .acr.alg .glg.glo .gls.ist .lof.lot .bcf.run.xml .tex-e.toc ._gstmp.acn .acr.alg .aux.bbl .bcf.blg