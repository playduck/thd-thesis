OUTPUTDIRECTORY = dist
MAINFILE = document
LC = lualatex

ifeq ($(OS),Windows_NT)
	OPEN = start texworks
else
	OPEN = open
endif

.PHONEY: mk
mk:
	latexmk -${LC} --shell-escape\
		-auxdir=${OUTPUTDIRECTORY} -outdir=${OUTPUTDIRECTORY}\
		${MAINFILE}.tex

.PHONY: once
once:
	${LC} --shell-escape -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

.PHONY: all
all:
ifeq ($(OS),Windows_NT)
else
# Copy folder structure
	mkdir -p ./${OUTPUTDIRECTORYcl}
	for DIR in $(shell find . -maxdepth 1 -mindepth 1 -type d \( ! -name .vscode ! -name binary ! -name venv ! -name tools \) -exec basename '{}' \;) ; do mkdir -p ${OUTPUTDIRECTORY}/$$DIR ; done
endif
	${LC} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	makeglossaries -d ${OUTPUTDIRECTORY} ${MAINFILE}
	biber -D --output-directory ${OUTPUTDIRECTORY} ${MAINFILE}

	${LC} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	${LC} --shell-escape -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

.PHONY: open
open:
	${OPEN} ${OUTPUTDIRECTORY}/${MAINFILE}.pdf &

.PHONY: clean
clean:
	rm -rf ./${OUTPUTDIRECTORY}
	# rm -f .out.aux .dvi.log -blx.bib.blg .bbl.acn .acr.alg .glg.glo .gls.ist .lof.lot .bcf.run.xml .tex-e.toc ._gstmp.acn .acr.alg .aux.bbl .bcf.blg
