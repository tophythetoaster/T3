function c = code(X, dictionary)
%X is an n-tensor, dictionary_bank is a cell of n-tensors


if ~iscell(dictionary)
    
    W = dictionary;
    x = X;
    c = nnls(W, x);
    
else
    

    dictionary_cell = dictionary;

    X = X(:);
    R = length(dictionary_cell);
    m = length(X);

    W = zeros(m, R);
    for r = 1 : R
        w = dictionary_cell{r};
        w = w(:);
        W(:, r) = w;
    end

    c = nnls(W, X);
    
end