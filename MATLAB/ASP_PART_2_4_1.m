clear;
close all;

%% 2.4.1 AUTOREGRESSIVE MODELLING PART 1

%% Parameters

M = 100;
N = 1000;

%% Random variables

a1 = 5*rand(M,1) - 2.5;
a2 = 3*rand(M,1) - 1.5;

%% Random processes

w = randn(1,N);

figure
hold on
for i = 1:M;
    a = [1, -a1(i), -a2(i)];
    x(i,:) = filter(1, a, w);
    if abs(x(i,N))<1000
        plot(a1(i), a2(i), '*');
    end
end
xlabel('a_1')
ylabel('a_2')
axis([-2.5 2.5 -1.5 1.5])

