set term png
set out 'hello.png'
set key top left
set style line 1 lt 3 lw 4 lc rgb '#990042'
set style line 2 lt 7 lw 3 lc rgb '#31f120'
set style line 3 lt 2 lw 3 lc rgb '#0044a5'
set style line 4 lt 9 lw 4 lc rgb '#888888'
plot [0:1] x**0.5 ls 1, x ls 2, x**2 ls 3, x**3 ls 4
pause -1
