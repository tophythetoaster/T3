%% make dictioanry bank from factors U, V

I = 20;
J = 30;
R = 5; 

U = rand(I, R);
V = rand(J, R);
factor_cell = {U, V};

dictionary_cell = get_dictionary_cell(factor_cell);


%% generate random data point 

c = rand(1, R);
X = lincomb(c, dictionary_cell);


%% find code, check reconstruction is correct

h = code(X, dictionary_cell);
Y = lincomb(h, dictionary_cell);
nom = norm(X - Y) / norm(X);
disp(nom);





