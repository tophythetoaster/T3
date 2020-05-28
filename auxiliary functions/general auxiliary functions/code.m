function [c, varargout] = code(dictionary_cell, X, varargin)

switch nargin
    case 2
        opts = options;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT!!!!!');
end


R = length(dictionary_cell);
w = dictionary_cell{1};
M = prod(size(w));

W = zeros(M, R);
x = X(:);

for r = 1 : R
    w = dictionary_cell{r};
    w = w(:);
    W(:, r) = w;
end

A = W' * W;
b = W' * x;


switch opts.key
    case 'mu'
        c = mu_quadprog(A, b, opts);    %check that initialization has same shape as B_til, which should be mn x 1
    case 'admm'
        c = admm_quadprog(A, b, opts);
    otherwise
        error('INVALID SOLVER NAME');
end


if nargout == 2
    nom = norm(W * c - x) / norm(x);
    varargout{1} = nom;
end