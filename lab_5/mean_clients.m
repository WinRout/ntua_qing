function [answer] = mean_clients(lamda,m)
[rho,is_ergodic] = intensities(lamda,m)
answer = rho ./ (1-rho)
for i=1:5 
  printf("Mean Clients at Q%d: %d\n",i,answer(i))
endfor
endfunction