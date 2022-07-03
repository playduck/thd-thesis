OUTPUTDIRECTORY = dist
MAINFILE = document
LC = xelatex

ifeq ($(OS),Windows_NT)
	OPEN = start texworks
	EXTRA = --extra-mem-top=2000000
else
	OPEN = open
endif

.PHONY: once
once:
	${LC} ${EXTRA} --shell-escape -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

.PHONY: all
all:
ifeq ($(OS),Windows_NT)
else
# Copy folder structure
	mkdir -p ./${OUTPUTDIRECTORYcl}
	for DIR in $(shell find . -maxdepth 1 -mindepth 1 -type d \( ! -name .vscode ! -name binary ! -name venv ! -name tools \) -exec basename '{}' \;) ; do mkdir -p ${OUTPUTDIRECTORY}/$$DIR ; done
endif
	${LC} ${EXTRA} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	makeglossaries -d ${OUTPUTDIRECTORY} ${MAINFILE}
	biber -D --output-directory ${OUTPUTDIRECTORY} ${MAINFILE}

	${LC} ${EXTRA} -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex
	${LC} ${EXTRA} --shell-escape -output-directory=${OUTPUTDIRECTORY} ${MAINFILE}.tex

.PHONY: open
open:
	${OPEN} ${OUTPUTDIRECTORY}/${MAINFILE}.pdf &

.PHONY: clean
clean:
	rm -rf ./${OUTPUTDIRECTORY}
	# rm -f .out.aux .dvi.log -blx.bib.blg .bbl.acn .acr.alg .glg.glo .gls.ist .lof.lot .bcf.run.xml .tex-e.toc ._gstmp.acn .acr.alg .aux.bbl .bcf.blg
