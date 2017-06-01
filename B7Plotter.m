%                  ,-.                   ,-.  ,---, 
%                 /                      |  )    /  
%                 | -. ;-. ,-. . . ;-.   |-<    /   
%                 \  | |   | | | | | |   |  )  /    
%                  `-' '   `-' `-` |-'   `-'  '     
%                                  '               
% This is the master plotter for the TAS project of 2017 which include the
% following individuals, alphabetically: HARRY ALDRIDGE, LOUIS ALEN, 
% YAIR BROUWER, ANDRE VAN DAM, GLENN VAN DEKKEN, GEOFFREY GARRETT,
% SVEN GEBOERS, SIMON VAN OVEREEM, JELLE POLAND & VINIT DIGHE
% This amazing tool is given to only the members listed above for homogen-
% eous plotting. If this tool is found being used by any individuals outs-
% ide of these members, you will be prosecuted to the fullest extent of t-
% he law by Adolf Kitler. Have a good day, and may the force be with you.

%% DATA INPUT SCHEME (ANDRE'S JOB </3)

%% EXEMPLAR FOR ANDRE <3
x_values = (0.1:0.1:10);
y_values = ([0 -60*sin((pi/12)*x_values(2:end))+100]);
domain   = [0 10 0 100];
title    = 'Experience vs. Confidence';
ax_label = {'Experience (1-10)','Confidence (%)'};
legend   = 'Dunning Kruger Effect';
save_n   = 'fig1';
scale    = [1 1];

%% FIGURE#1

%% FIGURE#2 

%% FIGURE#3

%% PLOT AND SAVE TO FILE
Figure1 = NeatPlot(x_values, y_values,...
                domain,...
                [],...
                [10 0],...
                legend,...
                title,...
                scale,...
                ax_label,...
                save_n);
Figure1.SavePlot()

            
            