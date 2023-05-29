function m = normal (fun,point)
    h = 1e-8;
    x = linspace(-pi,pi,101);
    y = linspace(-pi,pi,101);
    [X,Y] = meshgrid(x,y);
    Z = fun(X,Y);
    hold on;
    xlabel('x');
    ylabel('y');
    zlabel('z');
    z0 = fun(point(1), point(2));
    dzdx = (fun(point(1) + h, point(2)) - fun(point(1), point(2))) / h
    dzdy = (fun(point(1), point(2) + h) - fun(point(1), point(2))) / h
    t = linspace(0,3,300);
    x_n = dzdx * t + point(1);
    y_n = dzdy * t + point(2);
    z_n = -t + z0;
    plot3(x_n, y_n, z_n);
    axis equal;
    S = surf(X, Y, Z);
    shading interp;
    colormap jet;
    hold off
endfunction
