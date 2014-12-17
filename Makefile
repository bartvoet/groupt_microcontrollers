all:
	cd nl && pandoc chapter01_introduction.md course_introduction.md chapter02_getting_started.md code_introduction.md tools_editors_and_ides.md -o ../dist/cursus.epub
	#pandoc nl/chapter1/presentation.md -o presentation.epub
clean:
	rm cursus.epub
	rm presentation.epub
