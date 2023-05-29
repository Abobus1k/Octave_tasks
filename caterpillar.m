function caterpillar(r, x0, f, numOfCircles)
    plotList = [];
    hold on
    y0 = f(x0);
    X = repmat(x0, numOfCircles, 1);
    Y = repmat(y0, numOfCircles, 1);
    t = 0:pi/100:2*pi;
    x = r * cos(t) + X(1);
    y = r * sin(t) + Y(1);
    ph = plot(x, y);
    plotList(1) = ph;
    delta = r / 10000;
    for i = 2:numOfCircles
        dfx = (f(X(i-1) + delta) - f(X(i-1))) / delta;
        angle = atan(dfx);
        X(i) = X(i-1) + 2 * r * cos(angle);
        Y(i) = Y(i-1) + 2 * r * sin(angle);
        plotList(end+1) = circle(r, X(i), Y(i), ph, x0, y0);
    end
    t = 0:pi/100:2*pi;
    pause(1);
    for i = 0:pi/1000:2*pi
        for j = 1:numOfCircles-1
            x = r * cos(t) + X(j+1);
            X(j) = X(j+1);
            y = r * sin(t) + Y(j+1);
            Y(j) = Y(j+1);
            set(plotList(j), 'YDATA', y, 'XDATA', x);
            drawnow
        end
        dfx = (f(X(numOfCircles) + delta) - f(X(numOfCircles))) / delta;
        angle = atan(dfx);
        x = x + 2 * r * cos(angle);
        X(numOfCircles) = X(numOfCircles) + 2 * r * cos(angle);
        y = y + 2 * r * sin(angle);
        Y(numOfCircles) = Y(numOfCircles) + 2 * r * sin(angle);
        set(plotList(numOfCircles), 'YDATA', y, 'XDATA', x);
        pause(0.05);
        drawnow
    end
end
function p = circle(r, x0, y0, ph, xx, yy)
    t = 0:pi/100:2*pi;
    x = r * cos(t) + x0;
    y = r * sin(t) + y0;
    p = plot(x, y);
    axis([xx xx+50 yy-25 yy+25]);
end
