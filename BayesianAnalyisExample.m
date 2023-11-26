clear, clc, close all


prior = 0.5; 
r = 1; % rope

% Load the data ----------------------------------------------------------
z = xlsread('AOA_HAOA.xlsx','Data','P1:P12');

-
T = 150000; % number of repetitions
S = signed_rank_test_diff(z,0,prior,T); % rope = 0

figure('Un','N','Pos',[0.05,0.4,0.4,0.25])
h2 = histogram(S(:,1),500);
set (h2,'EdgeColor','none','FaceColor',[0.3 0.8 1],'FaceAlpha',1);
xlabel('Pleft')
title('AOA vs HAOA (Signed Rank Test)')
grid on
axis([0.5 1 0 1500])

% Barycentric coordinates (Figure 11 in the paper) -----------------------
T = 50000; % number of repetitions
[R,probs] = signed_rank_test_diff(-z,r,prior,T); 
% Need AODE-NBC, hence use -z

barycentric_plot(R, probs,{'AOA','HAOA'},14);

