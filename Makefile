all:
	cd nl/chapter1 && pandoc book.md -o ../../cursus.epub
	pandoc nl/chapter1/presentation.md -o presentation.epub
clean:
	rm cursus.epub
	rm presentation.epub
