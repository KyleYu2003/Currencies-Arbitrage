E = [1 0.6390 5.3712 1.5712 98.8901;
    1.5648 1 8.4304 2.4590 154.7733;
    0.1856 0.1186 1 0.2921 18.4122;
    0.6361 0.4063 3.4233 1 62.9400;
    0.01011 0.00645 0.05431 0.01588 1];

cvx_begin
cvx_quiet(true);
variables x(5, 5)
maximize sum(E(:, 1).*x(:, 1)) - sum(x(1, :))
subject to
    sum(E(:, 1).*x(:, 1)) - sum(x(1, :)) <= 1;
    sum(E(:, 1).*x(:, 1)) - sum(x(1, :)) >= 0;
    sum(E(:, 2).*x(:, 2)) - sum(x(2, :)) >= 0;
    sum(E(:, 3).*x(:, 3)) - sum(x(3, :)) >= 0;
    sum(E(:, 4).*x(:, 4)) - sum(x(4, :)) >= 0;
    sum(E(:, 5).*x(:, 5)) - sum(x(5, :)) >= 0;
    x >= 0;
cvx_end
disp(cvx_optval);