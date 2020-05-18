function W = online_NMF(vector_cell, r)

T = length(vector_cell);
x = vector_cell{1};
m = length(x);

A = zeros(r);
B = zeros(m, r);


W = rand(m, r);
for t = 1 : T
    
    disp(t);
    
    x = vector_cell{t};
    h = nnls(W, x);
    
    A = (t - 1) * A + h * h';
    A = A / t;
    B = (t - 1) * B + x * h';
    B = B / t;
    
    W = tran_quad_prog(A, B, W);
    

    
end