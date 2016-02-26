all:
	pandoc -s -t html pandoc.md -o pandoc.html
	pandoc -t latex pandoc.md -o pandoc.pdf
	pandoc -s -t beamer pandoc.md -o pandoc.tex
	pandoc -s -t docx pandoc.md -o pandoc.docx
	pandoc -t beamer pandoc.md -o slides.pdf
	pandoc -s -t beamer pandoc.md -o slides.tex
