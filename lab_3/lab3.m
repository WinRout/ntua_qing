%M/M/1/10 simulation 
clc;
clear all;
close all;
rand("seed", 1)

max_clients = 10;
lamdas = [1, 5, 10];
m = 5;
num_fig = 0; #number of figure for plotting

for j=1:1:3
  lamda = lamdas(j);
  threshold = lamda / (lamda + m); # threshold to determine arrival or departure
  total_arrivals = 0; # total arrivals in the system
  arrival = zeros (1,10+1); # number of arrivals in every state
  count = 0; # number of transitions
  state = 0; # state of queue 
  P = zeros (1,10+1) # ergodic propability of every state
  index = 0; # index for points on plot of mean_clients
  previous_mean = 0; #keep previous mean_value
  points = 0; %keep points for average number of clients diagram (for plotting)
  
  while count >= 0
    if mod(count,1000) == 0
        for i=1:1:length(arrival) %calculate ergodotic propabilities of states
          P(i) = arrival(i) / total_arrivals;
        endfor
        
        Pblocking(j) = P(max_clients+1); #the last state is equal to blocking a client 
        
        mean_clients = 0;
        for i=1:1:length(arrival) %calculate mean of system
          mean_clients += (i-1)*P(i);
        endfor
        
        index +=1;
        points(index) = mean_clients;
        
        if (abs(mean_clients - previous_mean) < (0.00001) || count >=  1000000) 
          ET(j) = mean_clients / (lamda*(1-Pblocking(j)));
          break;
        endif
        
        previous_mean = mean_clients;
       
    endif
    
    #if count <= 30
    #  disp("new transition");
    #  disp ("current system state: "), disp(state);
    #endif
    
    count = count + 1;
    random = rand(1); #generate random number (0,1) uniform distribution
    if (state == 0 || random < threshold) %arrival
        
        #if count <= 30
        #  disp ("next transition: arrival ");
        #endif
        
        total_arrivals += 1;
        arrival(state + 1) += 1;
        
        if (state != 10) state += 1;
        else continue;
      endif
      
        
      #if count <= 30
      #   disp ("total arrivals in state:"), disp(arrival(state));
      #endif
      
      else # departure
  
        #if count <= 30
        #    disp ("next transition: departure ");
        #  endif
        
        state -= 1;
      
      endif
      
  endwhile

  num_fig += 1;
  figure(num_fig)
  plot (points);
  title (strjoin({"Average number of clients in the system for lamda = ", num2str(lamda)}), "fontsize", 8);
  ylabel("number of clients");
  xlabel("transitions * 1000");

  num_fig += 1;
  figure(num_fig)
  bar(P);
  title (strjoin({"Ergodotic Propabilities of system states for lamda = ", num2str(lamda)}), "fontsize", 8);
  ylabel("propability");
  xlabel("state");
  
endfor

num_fig += 1;
figure(num_fig)
bar (Pblocking)
title ("Pblocking of system for lamda = 1,5,10 respectively", "fontsize", 8)


num_fig += 1;
figure (num_fig)
bar (ET)
title ("mean delay time of system for lamda = 1,5,10 respectively", "fontsize", 8)

