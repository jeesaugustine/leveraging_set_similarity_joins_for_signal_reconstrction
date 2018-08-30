% **************************************** % ****************************************
%   ** This file is the driver of the [DirectSp with ApproxAAt, ApproxAAt2 & SIM]  **
%   **     We try differnt thresholds also here like 100, 1000, |SD_Pair|/10,      **
%   **  |SD_Pair|/100, |SD_Pair|/1000, |SD_Pair|/10000, and |SD_Pair|/100000 to    **
%   **         to explore the effects of differnt thresholds                       **
% **************************************** % ****************************************

clear all;
clc;

% *******  =========================== Inputs ==============================  *******
% **************************************** % ****************************************
% | This code looks up for the config.config file which contains the total numer of |
% | SD_Pair in the given topogy from which this generates the names of the files as |
% | given below. This you will write as a part of the input to our code             |
% | b.mat       => Individual link loads in the network                             |
% | new_asp_XXX.txt   => Topology of the network in a trivial form (this is used)   |
% |                This is used only when netwwork size is small an for testing the |
% |                validity of Legrangian dual. [XXX represents the number of source|
% |                                            destination pairs in the network]    |
% | new_asp_column_XXX.txt => Topology of the network in a Sparse Representation    |
% |                This is used for large network setting where memeory could not   |
% |                house the entire toplolgy and majority of the entries are zeros  |
% | gravity.mat => This is the prior that was calcualted based on M. Roughan paper  |
% ***************************************** % ***************************************

% ------------------------------------------  ## ------------------------------------
% --------  This is exactly how your input should look like as given below ----------
% -we have commented this part as we directly to feed in the names of the files here-
% ------------------------------------------  ## ------------------------------------
% Ids = ones(30536, 1);
% Asp = load('new_asp_30536.txt');
% ATsp = load('asp_column_30536.txt');
% X = load('b.mat');
% Tg = load('gravity.mat')

[Ids, Asp, ATsp, X, Tg]  = load_inputs();
disp('Done: load inputs');
load1 = 'load';
name = 'directsp_' + string(size(Ids, 1)) + '_';

% --------------  Trying DirectSp with exact multiplications of AAt -----------------
tic;
[x, lambda, ~] = Directsp(Asp,ATsp,X, Tg,1,100);
fileID = fopen('w.txt','w');
fprintf(fileID, '%f ', x);
fclose(fileID);

R3 = [x Ids];
time_1_100 = toc
direct_variable_name = name + '1_100.txt';
save(direct_variable_name ,'R3','-ascii');
% R3=zeros(1,1);

% ---- DirectSp with approximate multiplications of AAt with a threshold of 1000 ----
tic;
R4 = [Directsp(Asp,ATsp,X,Tg,2,1000) Ids];
time_2_1000 = toc
direct_variable_name = name + '2_1000.txt';
save(direct_variable_name ,'R4','-ascii');
R_1_2_1000 = get_pair_wise_distance(R3(:,1), R4(:, 1));
R4=zeros(1,1);

% --- DirectSp with approximate multiplication of AAt with threshold |SD_Pair|/10 ---
tic;
now = floor((size(Ids, 1))/10)
R5 = [Directsp(Asp,ATsp,X,Tg,2, now) Ids];
time_2_div_10 = toc
direct_variable_name = name + '2_div_10.txt';
save(direct_variable_name ,'R5','-ascii');
R_1_2_div_10 = get_pair_wise_distance(R3(:,1), R5(:, 1));
R5=zeros(1,1);

% --- DirectSp with approximate multiplication of AAt with threshold |SD_Pair|/100 --
tic;
now = floor((size(Ids, 1))/100)
R6 = [Directsp(Asp,ATsp,X,Tg,2,now) Ids];
time_2_div_100 = toc
direct_variable_name = name + '2_div_100.txt';
save(direct_variable_name ,'R6','-ascii');
R_1_2_div_100 = get_pair_wise_distance(R3(:,1), R6(:, 1));
R6=zeros(1,1);

% -- DirectSp with approximate multiplication of AAt with threshold |SD_Pair|/1000 --
tic;
now = floor((size(Ids, 1))/1000)
R7 = [Directsp(Asp,ATsp,X,Tg,2,now) Ids];
time_2_div_1000 = toc
direct_variable_name = name + '2_div_1000.txt';
save(direct_variable_name ,'R7','-ascii');
R_1_2_div_1000 = get_pair_wise_distance(R3(:,1), R7(:, 1));
R7=zeros(1,1);

% - DirectSp with approximate multiplication of AAt with threshold |SD_Pair|/10000 --
tic;
now = floor((size(Ids, 1))/10000)
R8 = [Directsp(Asp,ATsp,X,Tg,2,now) Ids];
time_2_div_10000 = toc
direct_variable_name = name + '2_div_10000.txt';
save(direct_variable_name ,'R8','-ascii');
R_1_2_div_10000 = get_pair_wise_distance(R3(:,1), R8(:, 1));
R8=zeros(1,1);

% - DirectSp with approximate multiplication of AAt with threshold |SD_Pair|/100000 -
% tic;
% R9 = [Directsp(Asp,ATsp,X,Tg,2,floor((size(Ids, 1))/100000)) Ids];
% time_2_div_100000 = toc
% direct_variable_name = name + '2_div_100000.txt';
% save(direct_variable_name ,'R9','-ascii');
% R9=zeros(1,1);

% -- DirectSp with approximate multiplication of AAt with [SIM] and threshold 1000 --
R10 = [Directsp(Asp,ATsp,X,Tg,3,1000) Ids];
time_3_1000 = toc
direct_variable_name = name + '3_1000.txt';
save(direct_variable_name ,'R10','-ascii');
R_1_3_1000 = get_pair_wise_distance(R3(:,1), R10(:, 1));
R10=zeros(1,1);

% ----------------- Write Down the time take for differnt runtimes  -----------------
% t = string(time_1_100) + '\r\n' + string(time_2_1000) + ' '+  ...
%     string(time_2_div_10) + ' '+ string(time_2_div_100) + ' '+ ...
%     string(time_2_div_1000) + ' '+ string(time_2_div_10000) + ' ' + ...
%     string(time_2_div_100000)+ ' ' + string(time_3_1000);


direct_variable_name = 'directsp_timings_' + string(size(Ids, 1)) + ...
    '_' + 'times.txt';

fid = fopen(direct_variable_name,'w');
fprintf(fid, '%s\t\t %s \t\t %s \n ', 'time_1_100: ', time_1_100, '1000');
fprintf(fid, '%s\t\t %s \t\t %s \n', 'time_2_1000: ', time_2_1000, '1000');
fprintf(fid, '%s\t\t %s \t\t %s \n', 'time_2_div_10: ', time_2_div_10, ...
        string(floor((size(Ids, 1))/10)));
fprintf(fid, '%s\t   %s \t   %s \n', 'time_2_div_100: ', time_2_div_100, ...
        string(floor((size(Ids, 1))/100)));
fprintf(fid, '%s\t   %s \t   %s \n', 'time_2_div_1000: ', time_2_div_1000, ...
        string(floor((size(Ids, 1))/1000)));
fprintf(fid, '%s\t   %s \t   %s \n', 'time_2_div_10000: ', time_2_div_10000, ...
        string(floor((size(Ids, 1))/10000)));
%fprintf(fid, '%s\t   %s \t   %s \n', 'time_2_div_100000: ', time_2_div_100000, ...
%        string(floor((size(Ids, 1))/100000)));
fprintf(fid, '%s\t   %s \t   %s \n', 'time_3_1000: ', time_3_1000, '1000');
fclose(fid);

direct_variable_name = 'yy_time_directsp_' + string(size(Ids, 1)) + '.txt';
fid = fopen(direct_variable_name,'w');
fprintf(fid, '%s', time_2_1000);
fprintf(fid, '%s', time_2_div_10);
fprintf(fid, '%s', time_2_div_100);
fprintf(fid, '%s', time_2_div_1000);
fprintf(fid, '%s', time_2_div_10000);
fprintf(fid, '%s', time_3_1000);
fclose(fid);

direct_variable_name = 'abs_difference_directsp_' + string(size(Ids, 1));
save(direct_variable_name+'_2_1000' ,'R_1_2_1000','-ascii');
save(direct_variable_name+'_2_div_10000' ,'R_1_2_div_10000','-ascii');
save(direct_variable_name+'_2_div_1000' ,'R_1_2_div_1000','-ascii');
save(direct_variable_name+'_2_div_100' ,'R_1_2_div_100','-ascii');
save(direct_variable_name+'_2_div_10' ,'R_1_2_div_10','-ascii');
save(direct_variable_name+'_3_1000' ,'R_1_3_1000','-ascii');

% --------------- Finds the mean error for differnt output traffic    ---------------
error_mean_2_1000 = mean(R_1_2_1000);
error_mean_2_div_10000 = mean(R_1_2_div_10000);
error_mean_2_div_1000 = mean(R_1_2_div_1000);
error_mean_2_div_100 = mean(R_1_2_div_100);
error_mean_2_div_10 = mean(R_1_2_div_10);
error_mean_3_1000 = mean(R_1_3_1000);


thre = [1000, floor((size(Ids, 1))/10000),floor((size(Ids, 1))/1000), ...
        floor((size(Ids, 1))/100), floor((size(Ids, 1))/10), 1000];
avg_err = [error_mean_2_1000, error_mean_2_div_10000, error_mean_2_div_1000, ...
           error_mean_2_div_100, error_mean_2_div_10, error_mean_3_1000];
thre = transpose(thre);
avg_err = transpose(avg_err);
size(thre)
size(avg_err)
[thre, direct_order] = sort(thre, 'ascend');
thre
avg_err
avg_err = avg_err(direct_order,:);
avg_err
    
fid = fopen('yy_avg_error_directsp_' + string(size(Ids, 1)) + '.txt','w');
    for i = 1:size(avg_err, 1)
        avg_err(i);
        fprintf(fid, '%s \n', avg_err(i));
    end
    
fclose(fid);fid = fopen('yy_threshold_directsp_' + string(size(Ids, 1)) + ...
                        '.txt','w');
    for i = 1:size(avg_err, 1)
        fprintf(fid, '%s \n', string(thre(i)));
    end
fclose(fid);
