%% uses online-NMF on tensor data

s = 10;
r = 5;

sizes = [s, s, s];
factor_cell = initialize_factor_cell(sizes, r);
dictionary_cell = get_dictionary_cell(factor_cell);

T = 100;
data_cell_1 = get_data_cell(dictionary_cell, T);
d = length(sizes);
data_cell_2 = reshape_tensor_cell(data_cell_1, [s^d, 1]);


%%

factor_cell_1 = online_NTF(data_cell_1, r);
dictionary_cell_1 = get_dictionary_cell(factor_cell_1);

%%

factor_cell_2 = online_NTF(data_cell_2, r);     %in this case online NTF is online NMF
dictionary_cell_2 = get_dictionary_cell(factor_cell_2);
dictionary_cell_2 = reshape_tensor_cell(dictionary_cell_2, sizes);

%%

c = rand(r, 1);
x = lincomb(c, dictionary_cell);

c_1 = code(x, dictionary_cell_1);
x_1 = lincomb(c_1, dictionary_cell_1);

c_2 = code(x, dictionary_cell_2);
x_2 = lincomb(c_2, dictionary_cell_2);

nom_1 = norm(x - x_1) / norm(x);
nom_2 = norm(x - x_2) / norm(x);

disp(nom_1);
disp(nom_2);

