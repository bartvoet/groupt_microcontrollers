set terminal pngcairo dashed
set output 'single_slope_with_two_outputs.png'

set xrange [0:1100];
set yrange [0:10];



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

plot '-' using ($1*128):(($2*1)) title "Square 1" with lines, \
     '-' using ($1*128):($2*1 + 2) title "Single slope" with lines lt 1 lc 2, \
     '-' using ($1*128):($2*1 + 2) title "Compare 1" with impulses, \
     '-' using ($1*128):($2*1 + 2) title "Square 2" with lines lt 1 lc 1, \
     '-' using ($1*128):($2*1 + 2) title "Compare 2" with impulses lt 3 lc 7
	0 1
	0 2
	1.5 2
	1.5 1
	2 1
	2 2
	4 2
	5 2
	5 1
	6 1
	6 2
	7 2
	7 1
	8 1
EOF
	0 3
	2 5
	2 3
	4 5
	4 3
	6 5
	6 3
	8 5
	8 3
EOF
	1.5 4.5
	4 5
	5 4 
	7 4
EOF
	0 1
	0 2
	1 2
	1 1
	2 1
	2 2
	3 2
	3 1
	4 1
	4 2
	5.5 2
	5.5 1
	6 1
	6 2
	7.5 2
	7.5 1
	8 1
EOF
	1 4
	3 4
	5.5 4.5 
	7.5 4.5
EOF

show grid;
#pause -1;
