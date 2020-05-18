function W = dictionary_cell_to_matrix(dictionary_cell)

r = length(dictionary_cell);
w = dictionary_cell{1};
w = w(:);
m = length(w);

W = zeros(m, r);
for j = 1 : r
    
    w = dictionary_cell{j};
    w = w(:);
    W(:, j) = w;
    
end