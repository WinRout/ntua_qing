#Queuing Systems | 6th Semester | NTUA ECE
#2nd Lab 2021
#2nd Exercise
#editor: Nikitas Tsinnas, 03118187
pkg load statistics
pkg load queueing

clc;
clear all;
close all;

#b
lamda = 5;
m = [6:1:10];

U=[0,length(m)]; #server utiliaztion 
R=[0,length(m)]; #server responce time
Q=[0,length(m)]; #average number of requests in the system
X=[0,length(m)]; #server throughput
#Calculating U,R,Q,X with gsmm1 from queueing package
for i=1:length(m)
  [U(i),R(i),Q(i),X(i)] = qsmm1(lamda, m(i));
endfor

#Plotting Diagrams...
#Utiliaztion
figure(1);
plot (m,U);
title("Utiliaztion in respect to service rate 'm'");
ylabel("Utilaztion");
xlabel("'m'");
saveas(1, "figure1.jpg")
#responce time
figure(2);
plot (m,R);
title("responce time in respect to service rate 'm'");
ylabel("responce time");
xlabel("'m'");
saveas(2, "figure2.jpg")
#average number of requests
figure(3);
plot (m,Q);
title("average number of requests in respect to service rate 'm'");
ylabel("average number of requests");
xlabel("'m'");
saveas(3, "figure3.jpg")
#throughput
figure(4);
plot (m,X);
title("throughput in respect to service rate 'm'");
ylabel("throughput");
xlabel("'m'");
saveas(4, "figure4.jpg")


