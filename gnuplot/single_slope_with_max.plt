set terminal pngcairo dashed
set output 'single_slope_with_max.png'

set xrange [0:1100];
set yrange [0:900];

set xlabel "tijd"
set ylabel "waarde teller"

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256


set label "MAX==TOP==255" center at 384,256 offset 0, 0.8
set label "MAX<>TOP==128" center at 820,127 offset 0, 0.8

set label "256" center at 128,0 offset 0, 0.8
set arrow from 0,0 to 256,0 heads

set label "256" center at 128 + 256,0 offset 0, 0.8
set arrow from 256+0,0 to 256 + 256,0 heads

set label "128" center at 64 + (2 * 256) ,0 offset 0, 0.8
set arrow from 256+256,0 to 128 + (2 * 256) ,0 heads

set label "128" center at 64 + (2 * 256) + ( 1 * 128) ,0 offset 0, 0.8
set arrow from (2 * 256) + ( 1 * 128),0 to 128 + (2 * 256) + ( 1 * 128) ,0 heads

set label "128" center at 64 + (2 * 256) + ( 2 * 128) ,0 offset 0, 0.8
set arrow from (2 * 256) + ( 2 * 128),0 to 128 + (2 * 256) + ( 2 * 128) ,0 heads

set label "128" center at 64 + (2 * 256) + ( 3 * 128) ,0 offset 0, 0.8
set arrow from (2 * 256) + ( 3 * 128),0 to 128 + (2 * 256) + ( 3 * 128) ,0 heads

set arrow from 0,128 to (512 + 128),128 ls 3
set arrow from 0,128 to (512 + 128 * 2),128 ls 3
set arrow from 0,128 to (512 + 128 * 3),128 ls 3
set arrow from 0,128 to (512 + 128 * 4),128 ls 3

plot '-' using ($1*128):($2*256) title "Single slope" with lines lc 2,256 with lines lc 3 title "Top";
	0 0
	2 1
	2 0
	4 1
	4 0
	5 0.5
	5 0
	6 0.5
	6 0
	7 0.5
	7 0
	8 0.5
	8 0
EOF


show grid;
#pause -1;
