m = 11 * 11 * 3;
r = 5;
W = rand(m, r);
T = 200;

data_cell = get_data_cell(W, T);

%%

W_rec = online_NMF(data_cell, r);


%%

c = rand(r, 1);
x = W * c;

h = code(x, W_rec);
x_rec = W_rec * h;

nom = norm(x - x_rec) / norm(x);
disp(nom);
