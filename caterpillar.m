## Copyright (C) 2023 GOD
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} caterpillar (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: GOD <GOD@DESKTOP-LMN0LT5>
## Created: 2023-05-29

function caterpillar(r, x0, f, numOfCircles)
    plotList = [];
    hold on
    y0 = f(x0);
    point0 = [x0,y0];
    X = repmat(x0, numOfCircles, 1)
    Y = repmat(y0, numOfCircles, 1)
    t = linspace(0,2*pi,300)
    x = r * cos(t) + X(1);
    y = r * sin(t) + Y(1);
    ph = plot(x, y);
    plotList(1) = ph;
    h = 1e-8;
    for i = 2:numOfCircles
        dfx = (f(X(i-1) + h) - f(X(i-1))) / h;
        angle = atan(dfx);
        lastX = X(i-1);
        lastY = Y(i-1);
        X(i) = lastX + 2 * r * cos(angle);
        Y(i) = lastY + 2 * r * sin(angle);
        point = [X(i),Y(i)]
        plotList(end+1) = circle(r, point, ph, point0);
    end
    t = linspace(0,2*pi,300)
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
        dfx = (f(X(numOfCircles) + h) - f(X(numOfCircles))) /h;
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
function p = circle(r, point, ph, point0)
    t = 0:pi/100:2*pi;
    x = r * cos(t) + point(1);
    y = r * sin(t) + point(2);
    p = plot(x, y);
    axis([point0(1) point0(1)+50 point0(2)-25 point0(2)+25]);
end
