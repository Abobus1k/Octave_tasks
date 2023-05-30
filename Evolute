function Evolute(f)
    xRange = -10:0.01:10;
    evoluteCoords = [];
    involuteCoords = [];

    for x = -1:0.01:1
        y = f(x);
        dfTmp = calculateDerivative(f, x);
        d2fTmp = calculateSecondDerivative(f, x);

        evoluteX = x - dfTmp * (1 + dfTmp^2) / d2fTmp;
        evoluteY = y + (1 + dfTmp^2) / d2fTmp;

        involuteX = x;
        involuteY = y;

        evoluteCoords = [evoluteCoords; evoluteX, evoluteY];
        involuteCoords = [involuteCoords; involuteX, involuteY];
    end

    figure;
    hold on;
    evolutePlot = plot(evoluteCoords(:, 1), evoluteCoords(:, 2), 'r');
    involutePlot = plot(involuteCoords(:, 1), involuteCoords(:, 2), 'b');
    xlabel('x');
    ylabel('y');
    title('Evolute and Involute Curves');
    legend('Evolute', 'Involute');
    hold off;

    animateEvolute(evoluteCoords, evolutePlot);
end

function df = calculateDerivative(f, x)
    h = 1e-6;
    df = (f(x + h) - f(x - h)) / (2 * h);
end

function d2f = calculateSecondDerivative(f, x)
    h = 1e-6;
    d2f = (f(x + h) - 2 * f(x) + f(x - h)) / h^2;
end

function animateEvolute(evoluteCoords, evolutePlot)
    numFrames = size(evoluteCoords, 1);
    frameRate = 30;
    frameDelay = 1 / frameRate;

    for i = 1:numFrames
        set(evolutePlot, 'XData', evoluteCoords(1:i, 1), 'YData', evoluteCoords(1:i, 2));
        drawnow;
        pause(frameDelay);
    end
end
