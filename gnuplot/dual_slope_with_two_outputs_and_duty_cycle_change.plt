set terminal pngcairo dashed
set output 'dual_slope_with_two_outputs_and_duty_cycle_change.png'

set xrange [0:1100];
set yrange [0:10];

set arrow from 0,6.5 to 256 * 4 - 128 - 512 - 64,6.5 nohead ls 3 lc 7
set arrow from 0,6 to 768 - 512 + 128,6 nohead ls 3 lc 3

set arrow from 256+64,6.5 to 256 * 4 - 128 - 64,6.5 nohead ls 3 lc 3
set arrow from 256+128,6 to 768 + 128,6 nohead ls 3 lc 7

set grid xtics lt 0 lw 1 lc rgb "#880000"

set label "75/2%" center at 128-32,3 offset 0, 0.8
set label "75/2%" center at 256+128+32,3 offset 0, 0.8
set arrow from 256+64,3 to 256+128+128,3 heads
set arrow from 0,3 to 128 + 64,3 heads

set label "50/2%" center at 128-64,1 offset 0, 0.8
set label "50/2%" center at 256+128+64,1 offset 0, 0.8
set arrow from 256+128,1 to 256+128+128,1 heads
set arrow from 0,1 to 128,1 heads


set label "75/2%" center at 512+128-32,1 offset 0, 0.8
set label "75/2%" center at 512+256+128+32,1 offset 0, 0.8
set arrow from 512+256+64,1 to 512+256+128+128,1 heads
set arrow from 512+0,1 to 512+128 + 64,1 heads

set label "50/2%" center at 512+128-64,3 offset 0, 0.8
set label "50/2%" center at 512+256+128+64,3 offset 0, 0.8
set arrow from 512+256+128,3 to 512+256+128+128,3 heads
set arrow from 512+0,3 to 512+128,3 heads


set ytics ("0" 1, "1" 2, "0" 3, "1" 4,"0" 5, "127" 6, "255" 7 )

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
	2.75 4.5	
	3.25 4.5
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
EOF
	0.75 4.5	
	1.25 4.5
	2.5 4	
	3.5 4
	4.75 4.5	
	5.25 4.5
	6.75 4.5	
	7.25 4.5
EOF

show grid;
#pause -1;
