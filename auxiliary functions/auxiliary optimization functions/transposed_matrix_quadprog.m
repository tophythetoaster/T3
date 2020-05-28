function X = transposed_matrix_quadprog(A, B, varargin)

[m, n] = size(B);

switch nargin
    case 2
        opts = options;
        opts.initialization = rand(m, n);
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!!!');
end


X = opts.initialization;
Y = X';
opts.initialization = Y;
Y = matrix_quadprog(A, B', opts);
X = Y';
