set terminal pngcairo dashed
set output 'single_slope.png'

set xrange [0:1100];
set yrange [2:6];

unset ytics;

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256

set label "Top==Max" center at 768,5 offset 0, 0.8
set label "Match" center at 704,4 offset 0, 0.8
set label "Duty cycle" center at 704,4 offset 0, -0.8
set arrow from 128+512,4 to 768,4 heads 
set label "Bottom == 0" center at 640,3 offset 0, 0.8
set arrow from 512,3 to 768,3 heads 
set label "Frequency" center at 640,3 offset 0, -0.8

plot '-' using ($1*128):($2*1) title "Single slope" with lines lc 2;
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

show grid;
#pause -1;
