function m = chess(rows, cols)
    if nargin == 1
        cols = rows;
    end

    m = false(rows, cols);
    m(1:2:end, 1:2:end) = true;
    m(2:2:end, 2:2:end) = true;
end
