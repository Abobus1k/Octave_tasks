function m = fence(rows, cols)
    if nargin == 1
        cols = rows;
    end

    m = zeros(rows, cols);
    m(:, 1:2:end) = 1;

    if mod(cols, 2) == 0
        m(:, end) = 0;
    end
end
