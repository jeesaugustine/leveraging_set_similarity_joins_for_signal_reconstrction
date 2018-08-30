% **************************************** % ****************************************
%               ** This file is the driver of our code **
% **************************************** % ****************************************
% *******  =========================== Inputs ==============================  *******
% **************************************** % ****************************************
% | This takes in the value of the number of SD pairs from config.config and reads  |
% | input topology, traffic and prior information from respective files             |
% | config.config has the number of SD pairs                                        |
% | files that should be present- [new_asp_XXX.txt, new_asp_column_XXX.txt, b.mat]  |
% | [gravity.mat]                                                                   |
% ***************************************** % ***************************************
% *******  =========================== outputs =============================  *******
% | all values that are read from file using our program                            |
% ***************************************** % ***************************************

function [Ids, Asp, ATsp, X, Tg] = load_inputs()
    sd_pairs = load('config.config');
    sd_pairs
	Ids = ones(sd_pairs, 1);
	for i=1:136099
		 Ids(i,1) = i;
	end
	Asp = load('new_asp_' + string(sd_pairs) + '.txt');
	ATsp = load('new_asp_column_' + string(sd_pairs) + '.txt');
	X = load('b.mat');
	X = X.arr();
	X = transpose(X);
	Tg = load('gravity.mat');
	Tg = Tg.arr();
	Tg = transpose(Tg);
end
