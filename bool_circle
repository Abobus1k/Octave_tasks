function m = bool_circle(n, r, a)
    if nargin < 3
        a = [floor(n/2)+1, floor(n/2)+1];
    end

    [X, Y] = meshgrid(1:n, 1:n);

    distance = sqrt((X - a(1)).^2 + (Y - a(2)).^2);

    m = false(n, n);
    m(distance <= r) = true;
end
