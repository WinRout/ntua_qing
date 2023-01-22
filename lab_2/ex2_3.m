#Queuing Systems | 6th Semester | NTUA ECE
#2nd Lab 2021
#3rd Exercise
#editor: Nikitas Tsinnas, 03118187
pkg load statistics
pkg load queueing

clc;
clear all;
close all;

#bi
states = [0, 1, 2, 3, 4]; 
lamda = 5;
m = 10;
% birth rate = arrival rate (poisson parameter)
births = [lamda, lamda/2, lamda/3, lamda/4];
# death rate = service rate (exponential parameter)
deaths = [m, m, m, m];
% calculate and print transition table of process
display (ctmcbd(births, deaths))

#bii
transition_table = ctmcbd(births, deaths)
P = ctmc(transition_table);
display (P);
#biii
display("Average number of customers in the system when on equilibrium:")
display(sum(P.*[0,1,2,3,4]))

#biv
display("Probability of blocking customer:")
display(P(5))

#bv
% plot the ergodic probabilities (bar for bar chart)
i = 0;
initial_state = [1, 0, 0, 0, 0];
for T = 0 : 0.01 : 100
  i = i + 1;
  P0 = ctmc(transition_table, T, initial_state);
  p0(i) = P0(1);
  p1(i) = P0(2);
  p2(i) = P0(3);
  p3(i) = P0(4);
  p4(i) = P0(5);
  if P0 - P < 0.01 
    break;
  endif
endfor

T = 0 : 0.01 : T; #make new time vector
figure(1);
title(strjoin({"System State Propabilities | lamda = ",num2str(lamda)," m = ",num2str(m)},""))
xlabel("sec")
ylabel("probability")
hold on;
plot(T, p0);
plot(T, p1);
plot(T, p2);
plot(T, p3);
plot(T, p4);
legend("state 0","state 1","state 2","state 3","state 4");
hold off;
%bvi
m = [1,5,20];
for i=1:columns(m)
  deaths = [m(i), m(i), m(i), m(i)];
  transition_table = ctmcbd(births, deaths);
  idx = 0;
  for T = 0 : 0.01 : 4
    idx = idx + 1;
    P0 = ctmc(transition_table, T, initial_state);
    p0(idx) = P0(1);
    p1(idx) = P0(2);
    p2(idx) = P0(3);
    p3(idx) = P0(4);
    p4(idx) = P0(5);
    if P0 - P < 0.01
      break;
    endif
  endfor

  T = 0 : 0.01 : T;
  figure(i+1);
  title(strjoin({"System State Propabilities | lamda = ",num2str(lamda)," m = ",num2str(m(i))},""))
  xlabel("sec")
  ylabel("probability")
  hold on;
  plot(T, p0);
  plot(T, p1);
  plot(T, p2);
  plot(T, p3);
  plot(T, p4);
  legend("state 0","state 1","state 2","state 3","state 4");
  hold off;
endfor
