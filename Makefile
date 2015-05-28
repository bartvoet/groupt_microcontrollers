# Basics
CHAPTER_01 += chapter01_introduction.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../orientation/course_introduction.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../orientation/course_conventions.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../architecture/architecture_definition_of_microcontrollers.md
CHAPTER_01 += ../../general/pandoc_page_break.txt
CHAPTER_01 += ../code/code_what_is_programming.md
CHAPTER_01 += ../../general/pandoc_page_break.txt

CHAPTER_02 += chapter02_getting_started.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../code/code_c_introduction.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../tools/tools_command_getting_started.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../tools/tools_eclipse_getting_started.md
#CHAPTER_02 += ../tools/tools_toolchain_x86_overview.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../labo/x86_statements.md

CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../code/code_c_conditions_and_loops.md
CHAPTER_02 += ../../general/pandoc_page_break.txt
CHAPTER_02 += ../labo/x86_loops_and_conditionals.md 

CHAPTER_03 += chapter03_bits_and_bytes.md
CHAPTER_03 += ../../general/pandoc_page_break.txt
CHAPTER_03 += ../code/code_c_bittwiddling.md
CHAPTER_03 += ../../general/pandoc_page_break.txt
CHAPTER_03 += ../labo/avr_x86_shift_operators.md 

CHAPTER_04 += chapter04_getting_started_with_embedded.md
CHAPTER_04 += ../../general/pandoc_page_break.txt
CHAPTER_04 += ../code/code_avr_getting_started.md
CHAPTER_04 += ../../general/pandoc_page_break.txt
CHAPTER_04 += ../tools/tools_avr_get_started.md
CHAPTER_04 += ../../general/pandoc_page_break.txt
CHAPTER_04 += ../labo/avr_arduino_firsttime.md
CHAPTER_04 += ../../general/pandoc_page_break.txt
CHAPTER_04 += ../code/avr_c_gpio_input_and_output.md
CHAPTER_04 += ../../general/pandoc_page_break.txt
CHAPTER_04 += ../labo/avr_arduino_more_complex_in_group.md
CHAPTER_04 += ../../general/pandoc_page_break.txt

CHAPTER_05 += chapter05_functions_and_macros.md
CHAPTER_05 += ../../general/pandoc_page_break.txt
CHAPTER_05 += ../code/code_c_functions_and_procedures.md
CHAPTER_05 += ../../general/pandoc_page_break.txt
CHAPTER_05 += ../code/code_preprocessor.md
CHAPTER_05 += ../../general/pandoc_page_break.txt
CHAPTER_05 += ../labo/labo_functies_en_loop.md
CHAPTER_05 += ../../general/pandoc_page_break.txt

CHAPTER_06 += chapter06_interrupts.md
CHAPTER_06 += ../../general/pandoc_page_break.txt
CHAPTER_06 += ../code/code_avr_introduction_to_interrupts.md
CHAPTER_06 += ../../general/pandoc_page_break.txt
CHAPTER_06 += ../code/code_avr_introducion_to_timers.md
CHAPTER_06 += ../../general/pandoc_page_break.txt
CHAPTER_06 += ../code/asynchronuous_programming.md
CHAPTER_06 += ../../general/pandoc_page_break.txt

CHAPTER_07 += chapter07_pointers_and_arrays.md
CHAPTER_07 += ../../general/pandoc_page_break.txt
CHAPTER_07 += ../code/code_pointers_and_arrays.md
CHAPTER_07 += ../../general/pandoc_page_break.txt
CHAPTER_07 += ../labo/x86_arrays.md
CHAPTER_07 += ../../general/pandoc_page_break.txt
CHAPTER_07 += ../code/code_c_loop_and_conditions_extended.md
CHAPTER_07 += ../../general/pandoc_page_break.txt
CHAPTER_07 += ../labo/labo_loops_extended.md

CHAPTER_08 += chapter08_analog.md
CHAPTER_08 += ../../general/pandoc_page_break.txt
CHAPTER_08 += ../code/avr_adc.md
CHAPTER_08 += ../labo/avr_arduino_adc.md
CHAPTER_08 += ../../general/pandoc_page_break.txt
CHAPTER_08 += ../code/code_avr_pwm.md
CHAPTER_08 += ../../general/pandoc_page_break.txt

CHAPTER_09 += chapter09_serial.md
CHAPTER_09 += ../../general/pandoc_page_break.txt
CHAPTER_09 += ../protocols/protocol_USART.md
CHAPTER_09 += ../../general/pandoc_page_break.txt
CHAPTER_09 += ../protocols/protocol_I2C.md
CHAPTER_09 += ../labo/labo_i2c.md

graph_to_png = dot -Tpng ./graphviz/$(1).dot -o ./pictures/$(1).png
grap_convert = gvpr -c '$(1)' ./graphviz/$(2).dot | dot -Tpng -o ./pictures/$(3).png

pagebreak = ../../general/pandoc_page_break.txt

# Advanced

#debugging_code

all:
	cd nl/chapter && pandoc  \
			../title.txt part01_minimal_knowledge.md $(CHAPTER_01) $(CHAPTER_02) $(CHAPTER_03) $(CHAPTER_04) part02_foundation.md $(CHAPTER_05) $(CHAPTER_06) $(CHAPTER_07) $(CHAPTER_08) $(CHAPTER_09)\
		-o ../../dist/cursus.epub
#		--epub-stylesheet ../../markdown.css \

	cd nl/chapter && pandoc  \
			../title.txt $(pagebreak) part01_minimal_knowledge.md $(CHAPTER_01) $(CHAPTER_02) $(CHAPTER_03) $(CHAPTER_04) part02_foundation.md $(pagebreak) $(CHAPTER_05) $(CHAPTER_06) $(CHAPTER_07)  $(CHAPTER_08) $(CHAPTER_09)\
		-o ../../dist/cursus.html
#		--epub-stylesheet ../../markdown.css \

	cd nl/chapter && pandoc -S \
			../title.txt $(pagebreak) part01_minimal_knowledge.md ../../general/pandoc_page_break.txt $(CHAPTER_01) $(CHAPTER_02) $(CHAPTER_03) $(CHAPTER_04) part02_foundation.md $(pagebreak) $(CHAPTER_05) $(CHAPTER_06) $(CHAPTER_07)  $(CHAPTER_08) $(CHAPTER_09)\
		-o ../../dist/cursus.pdf
	
labos:
	cd nl/labo && pandoc  \
labo_header.md $(pagebreak) x86_statements.md $(pagebreak) x86_loops_and_conditionals.md $(pagebreak) avr_x86_shift_operators.md $(pagebreak) avr_arduino_firsttime.md $(pagebreak) avr_arduino_more_complex_in_group.md $(pagebreak) labo_functies_en_loop.md $(pagebreak) x86_arrays.md $(pagebreak) avr_arduino_adc.md $(pagebreak) labo_loops_extended.md labo_i2c.md\
		-o ../../dist/labos.epub
	
		cd nl/labo && pandoc  \
			labo_header.md $(pagebreak) x86_statements.md $(pagebreak) x86_loops_and_conditionals.md $(pagebreak) avr_x86_shift_operators.md $(pagebreak) avr_arduino_firsttime.md $(pagebreak) avr_arduino_more_complex_in_group.md $(pagebreak) labo_functies_en_loop.md $(pagebreak) x86_arrays.md $(pagebreak) avr_arduino_adc.md $(pagebreak) labo_loops_extended.md labo_i2c.md\
		-o ../../dist/labos.html
	
	cd nl/labo && pandoc  \
		labo_header.md $(pagebreak) x86_statements.md $(pagebreak) x86_loops_and_conditionals.md $(pagebreak) avr_x86_shift_operators.md $(pagebreak) avr_arduino_firsttime.md $(pagebreak) avr_arduino_more_complex_in_group.md $(pagebreak) labo_functies_en_loop.md $(pagebreak) x86_arrays.md $(pagebreak) avr_arduino_adc.md $(pagebreak) labo_loops_extended.md labo_i2c.md\
		-o ../../dist/labos.pdf

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
