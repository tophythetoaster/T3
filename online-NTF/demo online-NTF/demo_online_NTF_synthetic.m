%% make data

%make random dictionary
sizes = [20, 20, 3];
R = 5;
factor_cell = initialize_factor_cell(sizes, R);
dictionary_cell = get_dictionary_cell(factor_cell);

%make data generated by this dictionary
T = 200;
data_cell = cell(1, T);
for t = 1 : T
    c = rand(1, R);
    X = lincomb(c, dictionary_cell);
    data_cell{t} = X;
end


%% apply online-NTF to learn dictionary

factor_cell_rec = online_NTF(data_cell, R);
dictionary_cell_rec = get_dictionary_cell(factor_cell_rec);


%% fit new data sample using learned dictioanry, check reconstruction error

c = rand(1, R);
X = lincomb(c, dictionary_cell);

h = code(X, dictionary_cell_rec);
Y = lincomb(h, dictionary_cell_rec);

nom = norm(X - Y) / norm(X);
disp(nom);