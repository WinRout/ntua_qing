pkg load queueing

clc;
clear all;
close all;

a = 0.001:0.001:0.999;
lamda = 10*10^3;

m1 = (15 * 10^6) / (128 * 8);
m2 = (12 * 10^6) / (128 * 8);

lamda1 = a.*lamda;
lamda2 = (1-a).*lamda;

[U1 R1 Q1 X1 P1] = qsmm1(lamda1,m1);
[U2 R2 Q2 X2 P2] = qsmm1(lamda2,m2);

R = a.*R1 + (1-a).*R2;

figure(1);
plot(a,R,'r',"linewidth",2);
xlabel("Prob a");
ylabel("Average waiting time (sec)");
[minR,position] = min(R);
display(minR);
display(position*0.001);

