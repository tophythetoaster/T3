%%

s = 10;
m = s * s;
r = 5;
W = rand(m, r);

T = 100;
data_cell_1 = get_data_cell(W, T);
data_cell_2 = reshape_tensor_cell(data_cell_1, [s, s]);


%%

W_1 = online_NMF(data_cell_1, r);

%%

factor_cell = online_NTF(data_cell_2, r);
dictionary_cell = get_dictionary_cell(factor_cell);
dictionary_cell = reshape_tensor_cell(dictionary_cell, [s^2, 1]);
W_2 = dictionary_cell_to_matrix(dictionary_cell);


%%

c = rand(r, 1);
x = W * c;

c_1 = code(x, W_1);
x_1 = W_1 * c_1;

c_2 = code(x, W_2);
x_2 = W_2 * c_2; 

nom_1 = norm(x - x_1) / norm(x);
nom_2 = norm(x - x_2) / norm(x);

disp(nom_1);
disp(nom_2);















