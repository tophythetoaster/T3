function [x, varargout] = admm_quadprog(A, b, varargin)


if nargin == 2
    opts = options;
else
    opts = varargin{1};
end



n = length(b);
x = rand(n, 1);
y = x;
u = ones(n, 1);
e = ones(n, 1);
for it = 1 : opts.num_its
    
    x = x .* (b + opts.rho * y) ./ (A * x + opts.rho * x + u);
    y = y .* (u + opts.rho * x) ./ (opts.lambda * e + opts.rho * y);
    u = u .* x ./ y;
    
    
end




if nargout == 2
    varargout{1} = quadratic(A, b, x, opts.lambda);
end

