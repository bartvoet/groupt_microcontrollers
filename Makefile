# Basics
CHAPTER_01 += chapter01_introduction.md
CHAPTER_01 += ../orientation/course_introduction.md

CHAPTER_02 += chapter02_getting_started.md
CHAPTER_02 += ../code/code_what_is_programming.md
CHAPTER_02 += ../code/code_c_introduction.md
CHAPTER_02 += ../tools/tools_editors_and_ides.md
CHAPTER_02 += ../tools/tools_toolchain_x86_overview.md
CHAPTER_02 += ../labo/x86_statements.md

CHAPTER_03 += chapter03_mode_coding.md
CHAPTER_03 += ../code/integer_data_types.ùd
CHAPTER_03 += ../code/code_input_and_output_in_c.md
CHAPTER_03 += ../code/code_basic_loops_and_conditions.md

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

# Advanced

#debugging_code

all:
	cd nl/chapter && pandoc \
			$(CHAPTER_01) $(CHAPTER_02) \
		--epub-stylesheet ../../markdown.css \
		-o ../../dist/cursus.epub

clean:
	rm dist/cursus.epub

build_graphs:
	dot -Tpng ./graphviz/code_hierachy_of_statements.dot -o ./pictures/code_hierachy_of_statements.png
	gvpr -c 'N[name=="declaration"]{color = "blue"}' ./graphviz/code_hierachy_of_statements.dot | dot -Tpng -o ./pictures/code_hierachy_of_statementsi_declaration.png
