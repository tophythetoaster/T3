function dictionary_cell = get_dictionary_cell(factor_cell)

n = length(factor_cell);
fact = factor_cell{1};
R = length(fact(1, :));

dictionary_cell = cell(1, R);
for r = 1 : R
    U = cell(1, n);
    for j = 1 : n
        fact = factor_cell{j};
        u = fact(:, r);
        U{j} = u;
    end
    vault = ktensor(U);
    vault = tensor(vault);
    dictionary_cell{r} = vault;
    
end


