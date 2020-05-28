function X = lincomb(tensor_cell, c)
%forms linear combination with coefficients c of tensors in cell bank

R = length(c);
X = c(1) * tensor_cell{1};
for r = 2 : R
    Y = tensor_cell{r};
    Y = c(r) * Y;
    X = X + Y;
end

