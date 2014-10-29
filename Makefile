all:
	pandoc nl/chapter1/book.md -o cursus.epub
	pandoc nl/chapter1/presentation. -o presentation.epub
clean:
	rm nl/chapter1/cursus.epub
  rm nl/chapter1/presentation.epub
