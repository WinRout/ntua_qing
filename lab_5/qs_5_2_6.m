close all;
clear all;


for i=1:99
   lamda = 6 * i/100
   lamda_vector(i) = lamda
   lamdas = [lamda,1]
   m = [6,5,8,7,6]
   vec_sum(i) = sum(mean_clients(lamdas,m))/sum(lamdas)
endfor

figure(1);
plot(lamda_vector,vec_sum)
xlabel('lamda_1')
ylabel("Waiting Time")