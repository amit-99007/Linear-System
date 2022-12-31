% AMIT RANJAN
% 222EE3184
% Q(iii)(b)
clear all
close all
clc
size=0.08;                                   %time interval
t=0.01:size:6;                               %time range
Y=t;
k=1;
for n=1:length(t)                            %S1: taking length of n
    N = t(n)/size;
    K = 0;                                   %S2 : initializing k value
    for j = 0:N                              %S3 : for loop starting
        K = K + G(t(n) - j*size)*U(j*size)*size;  %S4 : writing equation
    end
    x = K;
    Y(n)= x;                                 %S5 : getting output convolved response
    n = n+1;                                 %S6 : increment in n
end                                          %S7 : getting out of loop

bar(t,Y);                                    %S8 : using bar function for plotting
title('Ramp  Response');
xlabel('Time');
ylabel('Magnitude');
hold on
plot(t,Y)                                    %S9 :plotting of graph 
hold on



    


    
