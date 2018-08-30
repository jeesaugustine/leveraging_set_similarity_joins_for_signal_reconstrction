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
