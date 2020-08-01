# modelo de referência para o estilo no word foi criado a partit de: pandoc modelo.txt -o modelo.docx
# em seguida, o modelo.docx foi editado no microsoft word 2010.
all: parcial.docx parcial.md  #clean

#copy:
#	cp -f C:\Users\Karlo\Dropbox\mendeley-backup-dropbox\library.bib C:\Users\Karlo\Dropbox\dissertacao-karlo\texto-dissertacao

#preamble.pdf: preamble.tex
#	pdflatex preamble.tex

parcial.md: scifile.tex
	pandoc scifile.tex -o parcial.md

#parcial.docx: parcial.md
#	pandoc parcial.md -o parcial.docx
#	pandoc -s -S --reference-docx=[nao-apagar]modelo.docx parcial.md --bibliography=bibliography/library.bib --filter=pandoc-citeproc --csl=ABNT.csl -o parcial.docx
#clean:
#	rm *.aux *.log *.toc *.blg *.bbl *.synctex.gz *.md *.brf *.idx *.ilg *.ind *.toc *.lof *.lot
#parcial.docx: preamble.tex
#	pandoc -s --reference-docx=others/[nao-apagar]modelo.docx preamble.tex --bibliography=bibliography/library.bib --filter=pandoc-citeproc --csl=others/ABNT.csl -o parcial.docx

parcial.docx: parcial.md
	pandoc -s --reference-docx=others/modelo-referencia.docx parcial.md --bibliography=bibliography/library.bib --filter=pandoc-citeproc --csl=others/jvs.csl -o parcial.docx

# solve issues with citations: https://tex.stackexchange.com/a/119909/105958
compile:
	if [ -f *.aux ]; then rm *.aux; fi
	if [ -f *.bbl ]; then rm *.bbl; fi
	pdflatex scifile
	bibtex scifile
	pdflatex scifile
	pdflatex scifile
