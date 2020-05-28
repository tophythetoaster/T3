sizes = [10, 10, 10];
R = 5;
dictionary_cell = initialize_dictionary_cell(sizes, R);

T = 200;
data_cell = get_data_cell(dictionary_cell, T);


%%
opts = options;
opts.num_its = 20;
opts.key = 'mu';


%%
D = online_NTF(data_cell, R, opts);


%%
c = rand(R, 1);
X = lincomb(D, c);

[X_rec, nom] = code(D, X);
disp(nom);