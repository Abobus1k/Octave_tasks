function m = fence(rows, cols)
    if nargin == 1
        cols = rows;
    end

    m = false(rows, cols);
    m(:, 1:2:end) = true;
end
