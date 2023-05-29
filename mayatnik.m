function [t, theta] = mayatnik(L, a, b, theta0, omega0, tspan)
y0 = [theta0; omega0];
odefun = @(t, y) [y(2); -9.81/L*sin(y(1))];
[t, Y] = ode45(odefun, tspan, y0);
theta = Y(:,1);
figure;
for i = 1:length(t)
    x = a + L*sin(theta(i));
    y = b - L*cos(theta(i));
    plot([a,x], [b,y], 'r', a, b, 'o', x, y, 'o');
    xlim([a-L-0.5, a+L+0.5]);
    ylim([b-L-0.5, b+L+0.5]);
    drawnow;
end
end
