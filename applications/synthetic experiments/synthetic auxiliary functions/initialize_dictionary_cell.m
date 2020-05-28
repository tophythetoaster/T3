function dictionary_cell = initialize_dictionary_cell(sizes, R)

n = length(sizes);
factor_cell = cell(1, n);
for j = 1 : n
    I_j = sizes(j);
    factor = rand(I_j, R);
    factor_cell{j} = factor;
end
dictionary_cell = out(factor_cell);

end