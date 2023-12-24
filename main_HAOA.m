

clear all 
clc
SearchAgents_no=30; % Number of search agents

Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper) 

Max_iteration=1000; % Maximum numbef of iterations 

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);  

[Best_score,Best_pos,AOA_curve]=AOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); 

[Best_score1,Best_pos1,HAOA_curve]=HAOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj); 


figure('Position',[269   240   660   290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
semilogy(AOA_curve,'Color','b','linewidth',1.5)
hold on 
semilogy(HAOA_curve,'Color','r','linewidth',1.5)
grid on;
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('AOA','HAOA')

display(['The best solution obtained by AOA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by AOA is : ', num2str(Best_score)]);

display(['The best solution obtained by HAOA is : ', num2str(Best_pos1)]);
display(['The best optimal value of the objective funciton found by HAOA is : ', num2str(Best_score1)]);




