clc;
clear all;
close all;

%TASK 1: PDF of exponential distribution of mean values [0.5, 1, 1.3]
k = 0:0.00001:8;
mean = [0.5 1 3];
for i=1:length(mean)
    exp_pdf(i,:) = exppdf(k, mean(i));
end

colors = "rbkm";
figure(1);
hold on;
for i=1:length(mean)
    plot(k,exp_pdf(i,:),"linewidth",1.2)
end
hold off

title("Probability Density Funtion of Exponential processes");
xlabel("k values");
ylabel("value");
legend("mean = 0.5","mean = 1","mean = 3");

%TASK 2: CDF of exponential distribution of mean values [0.5, 1, 1.3]

for i=1:length(mean)
    exp_cdf(i,:) = expcdf(k, mean(i));
end

colors = "rbkm";
figure(2);
hold on;
for i=1:length(mean)
    plot(k,exp_cdf(i,:),"linewidth",1.2)
end
hold off

title("Cumulative Distribution Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("mean = 0.5","mean = 1","mean = 1.3");

%TASK 3: Propability Calculation using the exponential cdf function

Fx = expcdf(k, 2.5); %calculating Exponential CDF of 1/lamda = 2.5

%The cumulative distribution function (CDF) of random variable X is defined as
%FX(x)=P(X<=x)
%so, P(X>30000) = 1 - P(X<=30000) = 1 - FX(30000)
propability_1 = 1 - Fx(30000);

%Pr(X>a + b)|X>a) = P(X>b) : exponential distribution feauture
propability_2 = (1-Fx(50000))/(1-Fx(20000));
