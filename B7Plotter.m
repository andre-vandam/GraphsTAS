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
qty_figs = 1;

%% EXEMPLAR FOR ANDRE <3
% x_values = (0.1:0.01:10);
% y_values = ([0 -60*sin((pi/12)*x_values(2:end))+100]);
% y_values = [y_values;y_values+10];
% % y_values = sinc(2*pi*x_values);
% domain   = [0 10 0 100];
% title    = 'Experience vs. Confidence';
% ax_label = {'Experience (1-10)','Confidence (%)'};
% legend   = {'Dunning Kruger Effect','t2'};
% save_n   = 'fig1';
% scale    = [1 1];

[p1, p2, u1, u2, h1, h2] = VProfile('set1.csv','set2.csv');

%% FIGURE#1
y11 = interp1(h1' , u1' , h2' ,'spline' );
Y_VAL1 = [y11;u2'];
X_VAL1 = h2;
WINDO1 = [0 11 -0.2 6];
TITLE1 = {'Velocity (U) vs. Height (y)'};
INTER1 = [];% [zeros(3,1) p11'];
AXESL1 = {'Height (y), [m]','Velocity (U), [m/s]'};
LEGEN1 = {'Upstream Velocity','Downstream Velocity'};
SCALE1 = [1 1];
LINES1 = [];
SAVEN1 = 'fig1';

%% FIGURE#2 
% Y_VAL2 = y12';
% X_VAL2 = x12';
% WINDO2 = [];
% TITLE2 = {'Downstream Velocity (U_d) vs. Height (y)'};
% INTER2 = [];%[zeros(3,1) p12'];
% AXESL2 = {'Velocity (U), [m/s]','Height (y), [m]'};
% LEGEN2 = {'CFD Model'};
% SCALE2 = [1 1];
% LINES2 = [];
% SAVEN2 = 'fig2';

%% FIGURE#3

%% POINTER SETUP

%% PLOT AND SAVE TO FILE
para = { 'X_VAL' ,...
         'Y_VAL' ,...
         'WINDO' ,...
         'LINES' ,...
         'INTER' ,... 
         'LEGEN' ,...
         'TITLE' ,...
         'SCALE' ,...
         'AXESL' ,...
         'SAVEN'};
Figure = zeros(1,qty_figs);

for j = 1:qty_figs
    p_list =[];
    
    str_list = [];
    str1 = '0';
    
    for i = 1:length(para)

        str = [para{i} num2str(j)];
    
%         if isempty(eval(str))==0
%             if  i==6 || i==9 || i==3
%                 str1 = str;
%             elseif i==7 || i==10
%                 para_var = eval(str);
%                 para_var = para_var';
%                 p = libpointer('voidPtr',int8(cell2mat(para_var)));
%             else
%                 para_var = eval(str);
%                 para_var = para_var';
%                 p = libpointer('doublePtr',para_var);
%                 
%             end
% 
%         else
%             p = libpointer('doublePtr',[]);
%         end
        str_list{i} = str;
%         p_list = [p_list p];
    end
    
    Figure = NeatPlot(   eval(str_list{1}),...
                            eval(str_list{2}),...
                            eval(str_list{3}),...
                            eval(str_list{4}),...
                            eval(str_list{5}),...
                            eval(str_list{6}),...
                            eval(str_list{7}),...
                            eval(str_list{8}),...
                            eval(str_list{9}),...
                            eval(str_list{10}));
    Figure.SavePlot()
end

            
            