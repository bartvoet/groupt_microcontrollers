set terminal pngcairo dashed
set output 'single_slope_with_one_output_varying_freq.png'

set xrange [0:1100];
set yrange [0:7];

set grid xtics lt 0 lw 1 lc rgb "#880000"

set ytics ("0" 1, "1" 2, "0" 3, "127" 4, "255" 5 )
set xtics 256

set arrow from 0,4 to 768 - 128,4 nohead ls 3
set arrow from 0,3.75 to 768 + 32,3.75 nohead ls 3


set arrow from 0,1 to 128,1 heads
set arrow from 0,0.5 to 256,0.5 heads

set arrow from 0 + 256,1 to 128 + 256 ,1 heads
set arrow from 0 + 256,0.5 to 256 + 256,0.5 heads


set arrow from 0 + (256 * 2),1 to 256 + (256 * 2)-64-32-32,1 heads
set arrow from 0 + (256 * 2),0.5 to 256 + (256 * 2)-64,0.5 heads

set arrow from 0 + 256  + (256 * 2)-64,1 to 256 + 256 + (256 * 2) -128 - 64 - 32,1 heads
set arrow from 0 + 256  + (256 * 2)-64,0.5 to 256 + 256 + (256 * 2) -128,0.5 heads


set label "50 %" center at 64,1 offset 0, 0.8
set label "100 %" center at 128,0.5 offset 0, 0.8

set label "50 %" center at 256 + 64,1 offset 0, 0.8
set label "100 %" center at 256 + 128,0.5 offset 0, 0.8

set label "75 %" center at 512 + 76,1 offset 0, 0.8
set label "100 %" center at 512 + 128 - 32,0.5 offset 0, 0.8

set label "100 %" center at 768 + 32,0.5 offset 0, 0.8
set label "50 %" center at 768 -16 ,1 offset 0, 0.8


plot '-' using ($1*128):($2*1) title "Single slope" with lines, \
     '-' using ($1*128):($2*1) title "Square" with lines lt 1 lc 2, \
     '-' using ($1*128):($2*1) title "Compare" with impulses
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
	5 2
	5 1
	5.5 1
	5.5 2
	6.25 2
	6.25 1
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
	1 4
	3 4
	5 4 
	6.25 3.75
EOF

show grid;
#pause -1;
