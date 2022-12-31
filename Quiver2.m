% AMIT RANJAN
% 222EE3184
% Q(ii)
clear all
close all
clc;
[x,y]= meshgrid(-1:0.1:1,-1:0.1:1);           %S1 :forming meshgrid
A = [1 0;-4 -1];                              %S2 :enter matrix by user
M = sqrt(x.^2 + y.^2);                        %S3 :for calculating unit vector
c = [];                                       %S4 :defining trackinig variables
d = [];
if det(A) == 0                                %S5 :checking for singularity
    print('No Solution')
else        
    [v,e] = eig(A);                           %S6 :calculating eigenvalues/eigenvectors
     a = (A(1,1)*x + A(1,2)*y)./M;
     b = (A(2,1)*x + A(2,2)*y)./M;
       quiver(x,y,a,b)                        %S7 :plotting quiver using a and b
       xlabel('Quiver');
       title('Unstable node');
    hold on
    axis([-1 1 -1 1])
    hold on
    plot([-v(1,1)*e(1,1),v(1,1)*e(1,1)],[-v(2,1)*e(1,1),v(2,1)*e(1,1)]);
    hold on
    plot([-v(1,2)*e(2,2),v(1,2)*e(2,2)],[-v(2,2)*e(2,2),v(2,2)*e(2,2)]);
    hold on
    %------------------------------------------------------------------------------------------------------
x0 = [0;0.9];                                  %S8 :taking any arbitrary tracking point
c(1,1)= x0(1);                                 %S9 :initializing tracking points
d(1,1)= x0(2);
step_size=0.01;                                %S10:setting size of step
kmax=1000;                                     %S11:setting step length to kmax
for k=2:kmax                                   %S12:calculating new point from k=2 to kmax
    x0=[x0(1) + step_size*(A(1,1)*x0(1) + A(1,2)*x0(2)); x0(2) + step_size*(A(2,1)*x0(1) + A(2,2)*x0(2))];
    c(k) = x0(1);                              %S13:updating tracking points
    d(k) = x0(2);
    k = k + 1;
end
p1= plot(c,d);                                 %S14:plot tracking point
p1.Color='red';
p1.LineWidth = 1.2;
p1.LineStyle='--';
hold on
p2=plot(c(1,1),d(1,1));                        %S15:plot tracking point starting
p2.Color='black';
p2.LineWidth = 2;
p2.Marker='+';
hold on
grid on
end