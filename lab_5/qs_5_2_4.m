lamda = [4,1]
m = [6,5,8,7,6]
Rho = mean_clients(lamda,m)
av_service_time = sum(Rho)/sum(lamda)
printf("Average service time: %d\n", av_service_time)