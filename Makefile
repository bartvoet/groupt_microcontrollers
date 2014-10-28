all:
	pandoc nl/mybook.txt -o cursus.epub
clean:
	rm cursus.epub
