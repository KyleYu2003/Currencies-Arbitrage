E = [1 0.6390 5.3712 1.5712 98.8901;
    1.5648 1 8.4304 2.4590 154.7733;
    0.1856 0.1186 1 0.2921 18.4122;
    0.6361 0.4063 3.4233 1 62.9400;
    0.01011 0.00645 0.05431 0.01588 1];

for i = 1:5
    for j = i + 1:5
        cvx_begin
            cvx_quiet(true);
            variables x(2, 2)
            maximize sum(E([i, j], i).*x(:, 1)) - sum(x(1, :))
            subject to
                sum(E([i, j], i).*x(:, 1)) - sum(x(1, :)) <= 1;
                sum(E([i, j], i).*x(:, 1)) - sum(x(1, :)) >= 0;
                sum(E([i, j], j).*x(:, 2)) - sum(x(2, :)) >= 0;
                x >= 0;
         cvx_end
         comb = [i j];
         disp(comb)
         disp(cvx_optval);
    end
end
