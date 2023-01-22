function Pblocking_factorial = erlangb_factorial (r, c)
  div = 0;
  for i=0:c
    div = (div + (r^i/factorial(i)));
  endfor
  Pblocking_factorial = ((r^c / factorial(c))/div);
endfunction