CHAPTER_01 += chapter01_introduction.md
CHAPTER_01 += course_introduction.md

CHAPTER_02 += chapter02_getting_started.md
CHAPTER_02 += code/code_what_is_programming.md
CHAPTER_02 += code/code_c_introduction.md
CHAPTER_02 += tools/tools_editors_and_ides.md
CHAPTER_02 += tools/tools_toolchain_x86_overview.md

CHAPTER_03 += chapter03_more_coding.md
CHAPTER_03 += code/code_conditionals_and_loops.md
CHAPTER_03 += code/code_avr_helloworld.md

CHAPTER_04 += chapter04_embedded_programming.md
CHAPTER_04 += architecture/architecture_bits_and_bytes.md
CHAPTER_04 += code/code_c_bittwiddling.md

all:
	cd nl && pandoc --filter ../graphviz.py \
			$(CHAPTER_01) $(CHAPTER_02) \
			-o ../dist/cursus.epub

clean:
	rm dist/cursus.epub
