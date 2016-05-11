set xrange [0:9];
set yrange [0:15];

#set termoption dash;
#set style line 3 lt 2 lc rgb "blue" lw 0.5;

unset xtics;
unset ytics;

plot '-' using 1:2 title "Single slope" with lines lt 1, \
     '-' using 1:2 title "Square" with lines , \
     '-' using 1:2 title "Compare" with impulses, \
     '-' using 1:2 title "Square 2" with lines, \
     '-' using 1:2 title "Compare 2" with impulses
	0 1
	0 2
	1.5 2
	1.5 1
	2 1
	2 2
	4 2
	4 1
	5 1
	5 2
	6 2
	6 1
	7 1
	7 2
	8 2
	8 1
EOF
	0 7
	2 9
	2 7
	4 9
	4 7
	6 9
	6 7
	8 9
	8 7
EOF
	1.5 8.5
	4 9
	5 8 
	7 8
EOF
	0 4
	0 5
	1 5
	1 4
	2 4
	2 5
	4 5
	4 4
	5 4
	5 5
	6 5
	6 4
	7 4
	7 5
	8 5
	8 4
EOF
	1 8
	4 9
	5 8 
	7 8
EOF
pause -1;
