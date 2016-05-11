set terminal pngcairo dashed
set output 'single_slope_with_one_output.png'

set xrange [0:1100];
set yrange [0:7];

unset ytics;

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256

set label "Top==Max" center at 768,5 offset 0, 0.8
set label "Match" center at 704,4 offset 0, 0.8
set label "Duty cycle" center at 704,4 offset 0, -0.8
set arrow from 128+512,4 to 768,4 heads 
set label "Bottom == 0" center at 640,3 offset 0, 0.8
set arrow from 512,3 to 768,3 heads 

plot '-' using ($1*128):($2*1) title "Single slope" with lines, \
     '-' using ($1*128):($2*1) title "Square" with lines lt 1 lc 2, \
     '-' using ($1*128):($2*1) title "Compare" with impulses
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

show grid;
#pause -1;
