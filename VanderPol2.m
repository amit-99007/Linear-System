% AMIT RANJAN
% 222EE3184
% Q(i)
clear all
close all
clc;
[x,y]= meshgrid(-3:0.1:3,-3:0.1:3);          %S1 :forming meshgrid
mu = input('Enter the value of mu \n ');     %S2 :taking mu as input from user
c = [];                                      %S3 :defining tracking variables as c,d,e,f
d = [];
e = [];
f = [];
kmax = 1000000;                              %S4 :initializing kmax (step number)
size = 0.001;                                %S5 :step size(0.001)taken
a = mu*(x-(1/3)*x.^3-y);                     %S6 :writing van_dar_pol equation(a)
b = (1/mu)*x;                                %   :writing van_dar_pol equation(a)
L = sqrt(a.^2+b.^2);                         %S7 :for calculating unit of a vector

for i = 1:2                                  %S8 :for loop starting indicating if-else function
   if i== 1;
    x0 = [0.1,1];                            %S9 :tracking 1st vector from point
    c(1) = x0(1);                            %S10:initializing tracking point
    d(1) = x0(2);
       for k = 2:kmax                        %S11:execution for loop for tracking 1st point
        x0 = [x0(1) + size*(mu*(x0(1)-(1/3)*(x0(1))^3-x0(2))); x0(2)+size*(1/mu)*x0(1)];
        c(k,1) = x0(1);
        d(k,1) = x0(2);
        k=k+1;                           
       end
   else
       x0 = [3,3];                          %S12 :tracking 1st vector from point
       e(1) = x0(1);                        %S13:initializing tracking point
       f(1) = x0(2);                    
        for k = 2:kmax                      %S14:execution for loop for tracking 1st point
          x0 = [x0(1) + size*(mu*(x0(1)-(1/3)*(x0(1))^3-x0(2))); x0(2)+size*(1/mu)*x0(1)];
          e(k,1) = x0(1);
          f(k,1) = x0(2);
          k=k+1;
        end
       
   end
end
%------------------------------------------------------------------------------------------------
c; d; e; f;
quiver(x,y,a./L,b./L)                       %S15:plotting quiver
hold on
axis([-3 3 -3 3])                           %S16:setting axis range
hold on
p1 = plot(c,d);                             %S17:plotting tracking of point
p1.Color='black';                           %S18:choosing plot parameters
p1.LineWidth = 0.8;
p1.LineStyle='--';
hold on
p2 = plot(e,f);                             %same as S17
p2.Color='red';
p2.LineWidth = 0.8;
p2.LineStyle='--';
hold on
grid on
