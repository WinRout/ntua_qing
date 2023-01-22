clc;
clear all;
close all;

%TASK 1: Poisson Counting Proccess N(t)

N = poisson_pr(100, 5); %function to calculate Nt of 100 events and lamda = 5

%plotting N(t) with stairs function
figure(1)
stairs(N, 1:length(N), "linewidth", 1.3);
title("Poisson Counting Proccess N(t)")
xlabel("t in sec")
ylabel("events occured")

%TASK 2: Mean of events in time unit

events_number = [100 200 300 500 1000 10000];
average_events=[];

for i=1:length(events_number)
    N = poisson_pr(events_number(i),5); %calculation of N(t)
    average_events(i) = length(N)/N(end) 
end

for i=1:length(events_number)
    poisson_mean(i) = mean(poissrnd(5,[1,events_number(i)]))
end


%---------------------FUNCTIONS-------------------------------------------%
function N = poisson_pr(n_events, lamda) %poisson process fun (number of events, lamda)
    events_timespam = exprnd(1/lamda,[1,n_events]);
for i=1:length(events_timespam)
    N(i)=sum(events_timespam(1:i));
end
end