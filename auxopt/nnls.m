function X = nnls(A, B)

X = quad_prog(A' * A, A' * B);