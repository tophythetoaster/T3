function dictionary_cell = out(factor_cell)
%returns cell consisting outer product of respective columns 

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


