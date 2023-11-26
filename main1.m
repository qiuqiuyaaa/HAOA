
clear all 
clc
N=20; 
M_Iter=100; 
LB = 0;
UB = 2;
Dim = 50;
F1 = @(x) x^2 ; 
F2 = @(x) x^4;  
F3 = @(x) sqrt(1 + x^2); 
F4 = @(x) 1/(x + 1);
F5 = @(x) sin(x);
F6 = @(x) exp(x);
F7 = @(x) x(1)^2+x(2)^2;

f = F7;
F_obj = @(x) fun(x,LB,UB);
[Best_pos,Best_F,Conv_curve]=HAOA(N,M_Iter,LB,UB,Dim,F_obj);

J1 = CalulateInf(Best_pos,f,LB,UB);
disp(['J1: ',num2str(J1)]);
figure
semilogy(Conv_curve,'Color','r','LineWidth',2);

axis tight
grid on
box on
legend('HAOA')
disp (Conv_curve);

