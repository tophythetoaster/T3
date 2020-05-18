%% basic quad prog

n = 10;
A1 = rand(2 * n, n);
A1 = A1' * A1;
b1 = rand(n, 1);

x1 = basic_quad_prog(A1, b1, b1);


%% quad prog 

m = 10;
r = 3; 
A2 = rand(2 * m, m);
A2 = A2' * A2;
B2 = rand(m, r);

X2 = quad_prog(A2, B2, B2);




%% tran quad prog

A3 = rand(2 * r, r);
A3 = A3' * A3;
B3 = rand(m, r);

X3 = quad_prog(A2, B3, B3);



%% nnls built off of quad prog

N = 100;
A = rand(m, r);
C = rand(r, N);
B = A * C;
X = nnls(A, B);
B2 = A * X;
nom = norm(B - B2) / norm(B);
disp(nom);



