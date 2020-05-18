function X = tran_quad_prog(A, B, varargin)
%minimizes (1/2)<X, XA> - <B, X> subject to X >= 0


[m, n] = size(B);
if nargin == 3
    X = varargin{1};
else 
    X = rand(m, n);
end

A_til = A;
B_til = B';
X_til = X';


Y = quad_prog(A_til, B_til, X_til);
X = Y';