set terminal pngcairo dashed
set output 'dual_slope_with_two_outputs.png'

set xrange [0:2200];
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

plot '-' using ($1*256):(($2*1)) title "Square 1" with lines, \
     '-' using ($1*256):($2*1 + 2) title "Single slope" with lines lt 1 lc 2, \
     '-' using ($1*256):($2*1 + 2) title "Compare 1" with impulses, \
     '-' using ($1*256):($2*1 + 2) title "Square 2" with lines lt 1 lc 1, \
     '-' using ($1*256):($2*1 + 2) title "Compare 2" with impulses lt 3 lc 7
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
	0 2
	0.75 2
	0.75 1
	1.25 1
	1.25 2
	2 2
	2.75 2
	2.75 1
	3.25 1
	3.25 2
	4 2
	4.75 2
	4.75 1
	5.25 1
	5.25 2
	6 2
	6.75 2
	6.75 1
	7.25 1
	7.25 2
	8 2
EOF
	0.75 4.5	
	1.25 4.5
	2.75 4.5	
	3.25 4.5
	4.75 4.5	
	5.25 4.5
	6.75 4.5	
	7.25 4.5
EOF

show grid;
#pause -1;
