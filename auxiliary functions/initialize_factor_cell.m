function factor_cell = initialize_factor_cell(sizes, R)

n = length(sizes);
factor_cell = cell(1, n);
for j = 1 : n
    I_j = sizes(j);
    factor = rand(I_j, R);
    factor_cell{j} = factor;
end
