set terminal pngcairo dashed
set output 'single_slope.png'

set xrange [0:1100];
set yrange [0:900];

set xlabel "tijd"
set ylabel "waarde teller"

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256

set label "Top=0xFF" center at 512,256 offset 0, 0.8
set label "Bottom=0x00" center at 512,0 offset 0, 0.8

plot '-' using ($1*128):($2*256) title "Single slope" with lines lc 2,256 with lines lc 3 title "Top";
	0 0
	2 1
	2 0
	4 1
	4 0
	6 1
	6 0
	8 1
	8 0
EOF


show grid;
#pause -1;
