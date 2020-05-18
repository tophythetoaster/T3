function x = basic_quad_prog(A, b, varargin)
%minimize (1/2)x^T Ax - b^T x subject to x >= 0


if nargin == 3
    x = varargin{1};
else 
    x = rand(length(b), 1);
end


num_its = 50;
%ep = 1e-4;
for it = 1 : num_its
    
    x = x .* b ./ (A * x);
    
end
