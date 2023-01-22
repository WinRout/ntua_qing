function Pblocking = erlangb_iterative (r, n)
  B = 1;
  for i=0:n
    B = (r*B)/((r*B)+i);
  endfor
  Pblocking = B;
endfunction 