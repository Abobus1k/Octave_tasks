function m = diagsn(rows, cols)
    if nargin == 1
        cols = rows;
    end

    m = zeros(rows, cols, 'uint32');


    num = 1;
    row = 1;
    col = 1;
    dir = -1;

    while num <= rows * cols
        m(row, col) = num;

        if dir == -1
            if row == rows
                col = col + 1;
                dir = 1;
            elseif col == 1
                row = row + 1;
                dir = 1;
            else
                row = row + 1;
                col = col - 1;
            end
        else
            if col == cols
                row = row + 1;
                dir = -1;
            elseif row == 1
                col = col + 1;
                dir = -1;
            else
                row = row - 1;
                col = col + 1;
            end
        end

        num = num + 1;
    end
end
