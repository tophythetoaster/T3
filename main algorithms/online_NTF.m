function [dictionary_cell, varargout] = online_NTF(data_cell, R, varargin)

switch nargin
    case 2
        opts = options;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT!!!!!');
end


sizes = size(data_cell{1});                         %sizes = [I_1, ..., I_n]
Sizes = [sizes, 1];                                 %needed to keep my notation with paper consistent, please ignore
n = length(sizes);                                  %data are n-tensors
factor_cell = initialize_factor_cell(sizes, R);     %factor_cell = {U_1, ..., U_n}, U_j are I_j x R matrices
dictionary_cell = out(factor_cell);                 %dictionary cell is cell consisting of R n-tensors, formed by taking outer products of respective columns of the U_j matrices


A = zeros(R);                                       %A is R x R matrix
B = zeros(prod(sizes), R);                          %B is prod(sizzle) x R matrix
T = length(data_cell);
for t = 1 : T
    
    disp(t);
    
    %given new data and previous dictionary, get code   
    X = data_cell{t};                               %X is an n-tensor of size I_1 x ... x I_n
    c = code(dictionary_cell, X, opts);                   
    c = c';                                         %c is now a 1 x R code vector
    
    
    %aggregate 
    X = tensor(X(:), Sizes);                           
    X = tenmat(X, n + 1);                           %should have shape 1 x (prod(sizzle)) 
    X = double(X);
    
    A = (t - 1) * A + c' * c;
    A = A / t;
    B = (t - 1) * B + X' * c;
    B = B / t;
    

    %update dictionary factor by factor: first U_1, then U_2, all the way up to U_n        
    for j = 1 : n
        
        A_U = get_A_U(A, factor_cell, sizes, j);
        B_U = get_B_U(B, factor_cell, sizes, j);
        U = factor_cell{j};
        opts.initialization = U;
        U = transposed_matrix_quadprog(A_U, B_U, opts);
        factor_cell{j} = U;
        
    end 
    dictionary_cell = out(factor_cell);
    
    
end


if nargout == 2
    varargout{1} = factor_cell;
end




end






function A_U = get_A_U(A, factor_cell, sizzle, j)
    
    n = length(sizzle);
    A_U = A;
    for k = 1 : n
        
        if k ~= j
            
            U = factor_cell{k};
            U = U' * U;
            A_U = A_U .* U;
            
        end
        
    end
    


end



function B_U = get_B_U(B, factor_cell, sizzle, j)

    n = length(sizzle);
    I_j = sizzle(j);
    R = length(B(1, :));
    B_U = zeros(I_j, R);
    
    for r = 1 : R
        
        b = B(:, r);
        b = reshape(b, sizzle);
        b = tensor(b);
       
        col_cell_r = {};
        for k = 1 : n
            if k ~= j
                 factor = factor_cell{k};
                 col  = factor(:, r);
                 col_cell_r{end + 1} = col; 
            end
        end
        
        idx = [1 : j - 1, j + 1 : n];
        b = ttv(b, col_cell_r, idx);
        B_U(:, r) = b;
        
    end
    
end
