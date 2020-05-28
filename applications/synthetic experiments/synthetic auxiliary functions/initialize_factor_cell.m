function factor_cell = initialize_factor_cell(sizes, R)

n = length(sizes);
factor_cell = cell(1, n);
for j = 1 : n
    m = sizes(j);
    U = rand(m, R);
    factor_cell{j} = U;
end