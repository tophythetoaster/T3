function [x, varargout] = mu_quadprog(A, b, varargin)

if nargin == 2
    opts = options;
else
    opts = varargin{1};
end

n = length(b);
x = rand(n, 1);

if opts.lambda == 0
    for it = 1 : opts.num_its
        x = x .* b ./ (A * x);
    end  
else
    e = ones(n, 1);
    e = opts.lambda * e;
    for it = 1 : opts.num_its
        x = x .* b ./ (A * x + e);
    end  
end




if nargout == 2
    varargout{1} = quadratic(A, b, x, opts.lambda);
end

