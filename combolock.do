force clock 0
force reset     1 
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force reset     0
force clock     1
force ld0       1
force ld1       0
force ld2       0
force value     1100
force enter     1
run 2 
examine code key_pad value ld0 ld1 ld2 unlock

force clock 0
run 2

force reset     0
force ld0       0
force ld1       1
force ld2       0
force clock     1
force value     0011
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force clock 0
run 2

force reset     0
force ld0       0
force ld1       1
force ld2       0
force clock     1
force value     1011
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force clock 0
run 2

force reset     0
force ld0       0
force ld1       0
force ld2       1
force clock     1
force value     1111
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force clock 0
run 2

force reset     0
force ld0       1
force ld1       0
force ld2       0
force clock     1
force value     0111
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force clock 0
run 2

force reset     0
force ld0       0
force ld1       1
force ld2       0
force clock     1
force value     0101
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

force clock 0
run 2

force reset     0
force ld0       0
force ld1       0
force ld2       1
force clock     1
force value     1001
force enter     1
run 2
examine code key_pad value ld0 ld1 ld2 unlock 

 

quit
