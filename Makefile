all:
	cd nl && pandoc book.md -o ../dist/cursus.epub
	#pandoc nl/chapter1/presentation.md -o presentation.epub
clean:
	rm cursus.epub
	rm presentation.epub
