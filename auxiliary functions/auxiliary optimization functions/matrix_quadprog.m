function X = matrix_quadprog(A, B, varargin)

[m, n] = size(B);

switch nargin
    case 2
        opts = options;
        opts.initialization = rand(m * n, 1);
    case 3
        opts = varargin{1};
        X0 = opts.initialization;
        opts.initialization = reshape(X0, [m * n, 1]);
    otherwise
        error('INVALID INPUT ARGUMENTS!!!!!');
end


c = {};
for j = 1 : n
    c{end + 1} = A;
end
A_til = blkdiag(c{:});          %mn x mn block diagonal matrix 
B_til = B(:);


X = mu_quadprog(A_til, B_til, opts);
X = reshape(X, [m, n]);
    

    