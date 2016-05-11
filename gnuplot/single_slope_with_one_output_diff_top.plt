set terminal pngcairo dashed
set output 'single_slope_with_one_output_diff_top.png'

set xrange [0:1100];
set yrange [0:7];

unset ytics;

set label "Top==Max==Match" center at 256,5 offset 0, 0.8
set label "Match==0x7F" center at 384,4 offset 0, 0.8
set label "Top==Max" center at 512,5 offset 0, 0.8
set label "Match==0x7F" center at 640,4 offset 0, 0.8
set label "Top==0xBF" center at 704,4.5 offset 0, 0.8
set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256

plot '-' using ($1*128):($2*1) title "Single slope" with lines, \
     '-' using ($1*128):($2*1) title "Square" with lines lt 1 lc 2, \
     '-' using ($1*128):($2*1) title "Compare" with impulses
	0 1
	0 2
	2 2
	3 2
	3 1
	4 1
	4 2
	5 2
	5 1
	5.5 1
	5.5 2
	6.5 2
	6.5 1
	7 1
EOF
	0 3
	2 5
	2 3
	4 5
	4 3
	5.5 4.5
	5.5 3
	7 4.5
	7 3
EOF
	2 5
	3 4
	5 4 
	6.5 4
EOF

show grid;
#pause -1;
