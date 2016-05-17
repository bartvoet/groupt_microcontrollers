set terminal pngcairo dashed
set output 'single_slope_with_one_output_simple_with_varying_duty_cycle.png'

set xrange [0:1100];
set yrange [0:7];

set grid xtics lt 0 lw 1 lc rgb "#880000"

set ytics ("0" 1, "1" 2, "0" 3, "127" 4, "255" 5 )
set xtics 256

set arrow from 0,4 to 256 + 128,4 nohead ls 3
set arrow from 0,4.5 to 512 + 128 + 64,4.5 nohead ls 3
set arrow from 0,5 to 1024,5 nohead ls 3

set arrow from 0,1 to 128,1 heads
set arrow from 0,0.5 to 256,0.5 heads

set arrow from 0 + 256,1 to 128 + 256 ,1 heads
set arrow from 0 + 256,0.5 to 256 + 256,0.5 heads


set arrow from 0 + (256 * 2),1 to 256 + (256 * 2)-64,1 heads
set arrow from 0 + (256 * 2),0.5 to 256 + (256 * 2),0.5 heads

set arrow from 0 + 256  + (256 * 2),1 to 256 + 256 + (256 * 2),1 heads
set arrow from 0 + 256  + (256 * 2),0.5 to 256 + 256 + (256 * 2),0.5 heads


set label "50 %" center at 64,1 offset 0, 0.8
set label "100 %" center at 128,0.5 offset 0, 0.8

set label "50 %" center at 256 + 64,1 offset 0, 0.8
set label "100 %" center at 256 + 128,0.5 offset 0, 0.8

set label "75 %" center at 512 + 96,1 offset 0, 0.8
set label "100 %" center at 512 + 128,0.5 offset 0, 0.8

set label "100 %" center at 768 + 128,0.5 offset 0, 0.8
set label "100 %" center at 768 + 128,1 offset 0, 0.8


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
	5.5 2
	5.5 1
	6 1
	6 2
	8 2
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
	1 4
	3 4
	5.5 4.5 
	8 4
EOF

show grid;
#pause -1;
