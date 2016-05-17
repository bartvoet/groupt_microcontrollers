set terminal pngcairo dashed
set output 'single_slope.png'

set xrange [0:1100];
set yrange [0:400];

set xlabel "tijd"
set ylabel "waarde teller"

set grid xtics lt 0 lw 1 lc rgb "#880000"

set xtics 256


set label "Top==Max==0xFF" center at 384,256 offset 0, 0.8
set label "Top<>Max==0x7F" center at 820,127 offset 0, 0.8
#set arrow from 256,256 to 512,256 heads

#set label "Match" center at 704,4 offset 0, 0.8
#set label "Duty cycle" center at 704,4 offset 0, -0.8
 
#set label "Bottom == 0" center at 640,3 offset 0, 0.8
#set arrow from 512,3 to 768,3 heads 
#set label "Frequency" center at 640,3 offset 0, -0.8

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
