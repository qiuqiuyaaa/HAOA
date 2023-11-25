%_________________________________________________________________________%
% ������ȸ�Ż��㷨�Ļ��ּ���ʵ��             %
%_________________________________________________________________________%
clear all 
clc
N=20; %��Ⱥ����
M_Iter=100; %�趨����������
LB = 0;%�ϱ߽�
UB = 2;%�±߽�
Dim = 50;%�ֵĶ���
F1 = @(x) x^2 ; %����Ҫ���ԵĻ��ֺ���
F2 = @(x) x^4;  %����Ҫ���ԵĻ��ֺ���
F3 = @(x) sqrt(1 + x^2);  %����Ҫ���ԵĻ��ֺ���
F4 = @(x) 1/(x + 1);
F5 = @(x) sin(x);
F6 = @(x) exp(x);
F7 = @(x) x(1)^2+x(2)^2;
%ѡ����ֺ���
f = F7;
F_obj = @(x) fun(x,LB,UB);%������Ӧ�Ⱥ���
[Best_pos,Best_F,Conv_curve]=HAOA(N,M_Iter,LB,UB,Dim,F_obj); %��ʼ�Ż�
%�������յĻ���
J1 = CalulateInf(Best_pos,f,LB,UB);
disp(['���ջ��ֽ��J1: ',num2str(J1)]);
figure
semilogy(Conv_curve,'Color','r','LineWidth',2);
title('��������')
xlabel('��������');
ylabel('��Ӧ��ֵ');
axis tight
grid on
box on
legend('AOA')
% disp (Conv_curve);

