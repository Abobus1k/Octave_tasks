params.m1 = 1;
params.l1 = 1;
params.m2 = 1;
params.l2 = 1;
init_deviations.theta1_0 = pi/4;
init_deviations.theta2_0 = pi/2;
init_deviations.omega1_0 = 4;
init_deviations.omega2_0 = 1;
t_range = linspace(0, 10, 60);
[t, x1, y1, x2, y2] = pendul2(params, init_deviations, t_range);
figure;
for i = 1:length(t)
    plot([0, x1(i), x2(i)], [0, y1(i), y2(i)], 'k.-', 'LineWidth', 1);
    axis([-2 2 -2 2]);
    axis square;
    xlabel('x');
    ylabel('y');
    title('Double Pendulum Animation');
    drawnow;
end
