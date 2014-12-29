CHAPTER_01 += chapter01_introduction.md
CHAPTER_01 += course_introduction.md

CHAPTER_02 += chapter02_getting_started.md
CHAPTER_02 += code_what_is_programming.md
CHAPTER_02 += code_c_introduction.md
CHAPTER_02 += tools_editors_and_ides.md
CHAPTER_02 += tools_toolchain_x86_overview.md

all:
	cd nl && pandoc --filter ../graphviz.py \
			$(CHAPTER_01) $(CHAPTER_02) \
			-o ../dist/cursus.epub

clean:
	rm cursus.epub
	rm presentation.epub
