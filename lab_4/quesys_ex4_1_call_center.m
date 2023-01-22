clc;
clear all;
close all;

r = 200 * (23/60); %service rate 
c = 1:1:200;      %phone lines

Pblocking = zeros(1,200); %initialize Pblocking array

for i = 1:1:200
  Pblocking(i) = erlangb_iterative(r,i);
endfor

figure(1)
plot(c,Pblocking)
grid on
title("Client Blocking Propability in respect to system's total phone lines", "fontsize", 8)
xlabel("phone lines", "fontsize", 8)
ylabel("Pblocking", "fontsize", 8)

threshhold_lines = 0;
for i = 1:1:200
  if (Pblocking(i) <= 0.01)
    threshhold_lines = i;
    break;
  endif
endfor

display("Minimum number of phone lines for Pblocking to be less than 1% is: ")
display(threshhold_lines)
