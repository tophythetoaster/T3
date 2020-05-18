function X = quad_prog(A, B, varargin)
%minimizes (1/2)<X, AX> - <B, X> subject to X >= 0 
%implemented through quad_prog by vectorizing

[m, n] = size(B);
if nargin == 3
    X = varargin{1};
else 
    X = rand(m, n);
end


c = {};
for j = 1 : n
    c{end + 1} = A;
end
A_til = blkdiag(c{:});          %mn x mn block diagonal matrix 

B_til = B(:);
X_til = X(:);

X_til = basic_quad_prog(A_til, B_til, X_til);
X = reshape(X_til, [m, n]);


















