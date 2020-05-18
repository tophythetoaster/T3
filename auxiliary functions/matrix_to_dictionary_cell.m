function dictionary_cell = matrix_to_dictionary_cell(W)

    [m, r] = size(W);
    dictionary_cell = cell(1, r);
    for j = 1 : r
        w = W(:, j);
        dictionary_cell{j} = w;
    end


end