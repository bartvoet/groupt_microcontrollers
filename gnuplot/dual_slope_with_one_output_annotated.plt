set terminal pngcairo dashed
set output 'dual_slope_with_one_output_annotated.png'

set xrange [0:2200];
set yrange [0:6];



#set termoption dash;
#set style line 3 lt 2 lc rgb "blue" lw 0.5;

#unset xtics;
unset ytics;

# set style line 101 lc rgb '#808080' lt 1 lw 1
# set border 3 front ls 101
# set tics nomirror out scale 0.75
# set format '%g'

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256

# Bottom is 0
# Top bepaalt frequentie
# Compare vs Top bepaalt precisie

set label "Top==Max" center at 256+512,5 offset 0, 0.8
set label "Match" center at 256+512,4 offset 0, 0.8
set label "Duty cycle" center at 256+512,4 offset 0, -1.1
set arrow from 128+512,4 to 384+512,4 heads 
set label "Bottom == 0" center at 256+512,3 offset 0, 0.8
set arrow from 512,3 to 512+512,3 heads 

plot '-' using ($1*256):(($2*1)) title "Square 1" with lines, \
     '-' using ($1*256):($2*1) title "Single slope" with lines lt 1 lc 2, \
     '-' using ($1*256):($2*1) title "Compare 1" with impulses
	0 2
	0.5 2
	0.5 1
	1.5 1
	1.5 2
	2 2
	2.5 2
	2.5 1
	3.5 1
	3.5 2
	4 2
	4.5 2
	4.5 1
	5.5 1
	5.5 2
	6 2
	6.5 2
	6.5 1
	7.5 1
	7.5 2
	8 2
EOF
	0 3
	1 5
	2 3
	3 5
	4 3
	5 5
	6 3
	7 5
	8 3
EOF
	0.5 4	
	1.5 4
	2.5 4	
	3.5 4
	4.5 4	
	5.5 4
	6.5 4
	7.5 4
EOF

show grid;
#pause -1;
