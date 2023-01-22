function [rho,is_ergodic] = intensities(lamda,m)
rho(1) = lamda(1)/m(1)
rho(2) = (lamda(2) + 2*lamda(1)/7)/m(2)
rho(3) = (4*lamda(1)/7)/m(3)
rho(4) = (3*lamda(1)/7)/m(4)
rho(5) = (lamda(2) + (4/7)*lamda(1))/m(5)
is_ergodic = true;
for i=1:5
  printf('Q%d: %f\n',i,rho(i))
  is_ergodic  = is_ergodic && (rho(i) < 1)
endfor
printf("Ergodicity: %d \n",is_ergodic)
endfunction