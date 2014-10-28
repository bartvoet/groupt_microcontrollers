all:
	pandoc nl/chapter1/book.txt -o cursus.epub
	pandoc nl/chapter1/presentation.txt -o presentation.epub
clean:
	rm cursus.epub
