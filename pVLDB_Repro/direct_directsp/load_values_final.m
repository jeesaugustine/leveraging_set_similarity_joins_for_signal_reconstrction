% function [A, b, Tg, Asp, direct, directsp] = load_values_final(a_name, asp_name, b_name, tg_name)
% Above one goes online when you need the output files
function [] = load_values_final(a_name, asp_name, b_name, tg_name, algo,th)

% **************************************** % ****************************************
%               ** This file is the driver of our code **
% **************************************** % ****************************************
% *******  =========================== Inputs ==============================  *******
% **************************************** % ****************************************
% | This code takes in the names of files which contain the topology of the network |
% | b.mat       => Individual link loads in the network                             |
% | a_XXX.txt   => Topology of the network in a trivial form (this is used)         |
% |                This is used only when netwwork size is small an for testing the |
% |                validiyt of Legrangian dual. [XXX represents the number of source|
% |                                            destination pairs in the network]    |
% | asp_XXX.txt => Topology of the network in a Sparse Representation               |
% |                This is used for large network setting where memeory could not   |
% |                house the entire toplolgy and majority of the entries are zeros  |
% | gravity.mat => This is the prior that was calcualted based on M. Roughan paper  |
% ***************************************** % ***************************************
% *******  =========================== outputs =============================  *******
% | 1. Output of our algorithm Direct as given in the paper, this gives the traffic |
% | we inferred from the prior that is closer to original solution plane            |
% | 2. We get the output on both the Direct and directsp for comparing the times    |
% | 3. We also generate the errorbar plot which produces the actual figures         |
% ***************************************** % ***************************************

% ------------------------------------------  ## ------------------------------------
% --------  This is exactly how your input should look like as given below ----------
% -we have commented this part as we directly to feed in the names of the files here-
% ------------------------------------------  ## ------------------------------------
% b = load('b.mat');
% A = importdata('A_3187.txt');
% Asp = importdata('asp_3187.txt');
% Tg = load('gravity.mat');

disp('Start: load inputs');
b = load(b_name);
A = importdata(a_name);
Asp = importdata(asp_name);
Tg = load(tg_name);
disp('Done: load inputs');

% --------    ****   ============  Begin Comments  ===========   ****    ----------
% you can see an access to --.arr-- here,  which just a way in which we have stored
% all our Matlab data, inside a .arr variable. We are pulling that information form
% that variable
% --------    ****   ===========   End Comments ==============   ****    ----------
b = b.arr();
Tg = Tg.arr();

b = double(b);
Tg = double(Tg);
A = double(A);
Asp = double(Asp);

b = transpose(b);
Tg = transpose(Tg);

% size(A)
% size(b)
% size(Tg)
% size(Asp)

% --------    ****   ============  Begin Comments ============   ****    ----------
% This invokes the Direct algorithm [Algorithm 1 DIRECT] mentioned in our paper &
%               measures the time taken for completion of the code
% --------    ****   ===========   End Comments ==============   ****    ----------
disp('Start: Direct Algorothm');
tic;
direct = Direct(A,b,Tg);
t1 = toc;
disp('Done: Direct Algorothm');

% --------    ****   ============  Begin Comments ============   ****    ----------
% This invokes the Direct algorithm [Algorithm 1 DIRECT] mentioned in our paper &
% uses a Sparse representation instead of the full topology matrix measures the
%                   time taken for completion of the code
% --------    ****   ===========   End Comments ==============   ****    ----------

% directsp = Directsp(A,b,Tg,Asp,2,th);

[Ids, Asp, ATsp, X, Tg]  = load_inputs();
disp('Start: DirectSP Algorothm');
tic;
directsp = Directsp(Asp, ATsp, X, Tg, algo, th);
t2 = toc
disp('Start: DirectSP Algorothm');
% --------    ****   ============  Begin Comments ============   ****    ----------
% All the plotting methods are actually here itself and you can generate all the
% plots from the paper here using the datasets that we provide directly using data
% generated from this code. We are also generating a errorbar.
% bucketize them for calculating the errors
% --------    ****   ===========   End Comments ==============   ****    ----------
[direct, direct_order] = sort(direct, 'descend');
directsp = directsp(direct_order,:);
save('direct.txt','direct','-ascii');
save('directsp.txt','directsp','-ascii');
val = size(Tg);
bucket = bucketization(val(1), direct, directsp);

% this is for finding threashold algorithms 
er = 0;
for i=1:length(directsp)
    er = er + abs(direct(i)-directsp(i));
end 
er = er/length(directsp)
% Graph items 
x = 1:2:100;
avg = bucket(:, 1);
err = bucket(:, 2);
avg = transpose(avg);
err = transpose(err);

errorbar(x,avg,err)

end
