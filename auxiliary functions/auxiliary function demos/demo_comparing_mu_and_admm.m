m = 50;
mult = 70;
d = mult * m;
p = .05;
opts = options;
opts.lambda = 1;

A = rand(m, d);
c = (rand(d, 1) < p);
c = double(c);
b = A * c;

Q = A' * A;
v = A' * b;


x1 = mu_quadprog(Q, v, opts);
x2 = admm_quadprog(Q, v, opts);

nom1 = norm(x1 - c) / norm(c);
nom2 = norm(x2 - c) / norm(c);

disp(nom1);
disp(nom2);