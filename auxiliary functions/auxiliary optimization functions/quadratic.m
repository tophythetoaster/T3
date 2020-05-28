function y = quadratic(A, b, x, varargin)

if nargin == 3
    y = (1/2) * x' * (A * x) - b' * x;
else 
    lambda = varargin{1};
    y = (1/2) * x' * (A * x) - b' * x + lambda * sum(abs(x));
end