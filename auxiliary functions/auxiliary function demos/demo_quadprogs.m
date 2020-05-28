m = 100;
n = 10;

A = eye(n) + .1 * rand(n);
A = A' * A;
B = rand(m, n);
opts = options;

X = transposed_matrix_quadprog(A, B);

