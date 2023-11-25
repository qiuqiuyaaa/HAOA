%_________________________________________________________________________%
% 基于麻雀优化算法的积分计算实验             %
%_________________________________________________________________________%
clear all 
clc
N=20; %种群数量
M_Iter=100; %设定最大迭代次数
LB = 0;%上边界
UB = 2;%下边界
Dim = 50;%分的段数
F1 = @(x) x^2 ; %定义要测试的积分函数
F2 = @(x) x^4;  %定义要测试的积分函数
F3 = @(x) sqrt(1 + x^2);  %定义要测试的积分函数
F4 = @(x) 1/(x + 1);
F5 = @(x) sin(x);
F6 = @(x) exp(x);
F7 = @(x) x(1)^2+x(2)^2;
%选择积分函数
f = F7;
F_obj = @(x) fun(x,LB,UB);%定义适应度函数
[Best_pos,Best_F,Conv_curve]=HAOA(N,M_Iter,LB,UB,Dim,F_obj); %开始优化
%计算最终的积分
J1 = CalulateInf(Best_pos,f,LB,UB);
disp(['最终积分结果J1: ',num2str(J1)]);
figure
semilogy(Conv_curve,'Color','r','LineWidth',2);
title('收敛曲线')
xlabel('迭代次数');
ylabel('适应度值');
axis tight
grid on
box on
legend('AOA')
% disp (Conv_curve);

