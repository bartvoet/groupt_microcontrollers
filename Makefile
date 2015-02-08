# Basics
CHAPTER_01 += chapter01_introduction.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../orientation/course_introduction.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../orientation/course_conventions.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../architecture/architecture_definition_of_microcontrollers.md
CHAPTER_01 += ../../general/pandoc_page_break.txt

CHAPTER_02 += chapter02_getting_started.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../code/code_what_is_programming.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../code/code_c_introduction.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../tools/tools_eclipse_getting_started.md
#CHAPTER_02 += ../tools/tools_toolchain_x86_overview.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../labo/x86_statements.md

#CHAPTER_03 += chapter03_mode_coding.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_03 += ../code/code_c_conditions_and_loops.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_03 += ../labo/x86_loops_and_conditionals.md 

CHAPTER_04 += chapter04_first_experience_with_mcu.md
CHAPTER_04 += ../tools/to_arduino_or_not.md
CHAPTER_04 += ../tools/tools_toolchain_avr_overview.md
CHAPTER_04 += ../code/fuctions_and_procedures.md
CHAPTER_04 += ../architecture/ports_and_pins.md
CHAPTER_04 += ../code/code_avr_helloworld.md

CHAPTER_05 += chapter05_embedded_coding.md
CHAPTER_05 += ../architecture/architecture_intro_computer_memory.md
CHAPTER_05 += ../code/code_c_bittwiddling.md

# Intermediate

CHAPTER_07 += chapter07_simple_serial_communication.md
CHAPTER_07 += ../protocols/what_is_uart.md
CHAPTER_07 += ../code/arrays_and_strings.md

CHAPTER_07 += ../code/working_with_uart_in_AVR.md

CHAPTER_08 += ../architecture/avr_interrupts.md
CHAPTER_08 += ../code/macros.md


CHAPTER += ../code/headers_and_modularity.md

CHAPTER_08 += ../code/pointers_in_c.md

graph_to_png = dot -Tpng ./graphviz/$(1).dot -o ./pictures/$(1).png

# Advanced

#debugging_code

all:
	cd nl/chapter && pandoc  \
			../title.txt $(CHAPTER_01) $(CHAPTER_02) $(CHAPTER_03)\
		-o ../../dist/cursus.epub
#		--epub-stylesheet ../../markdown.css \

	cd nl/chapter && pandoc \
			../title.txt ../../general/pandoc_page_break.txt $(CHAPTER_01) $(CHAPTER_02) $(CHAPTER_03)\
		-o ../../dist/cursus.pdf
	

clean:
	rm dist/cursus.epub

build_graphs:
	#$(foreach dotfile,$(wildcard ./graphviz/*.dot),${call graph_to_pnge,$(dotfile)})
	${call graph_to_png,"code_hierachy_of_statements"}
	${call graph_to_png,"orientation_digital_courses"}
	${call graph_to_png,"intro_in_c_2_variables_1"}
	${call graph_to_png,"intro_in_c_2_variables_2"}
	${call graph_to_png,"assembly_build"}
	${call graph_to_png,"compile_build"}
	gvpr -c 'N[name=="simple_statement" | name=="assignment" | name=="function_call"]{color="blue"}' ./graphviz/code_hierachy_of_statements.dot | dot -Tpng -o ./pictures/code_focus_on_simple_statements.png
		gvpr -c 'N[name=="block_statement" | name=="conditional_statement"]{color="blue"}' ./graphviz/code_hierachy_of_statements.dot | dot -Tpng -o ./pictures/code_focus_on_conditions.png
