function retval = SOLVER(f, x0)
    check = 1;
    x = linspace(-x0*2, x0*2, 1000);
    plot(x, f(x));
    hold on;
    xlabel('x');
    ylabel('y');
    grid on;

    X0 = linspace(-x0, x0, 1000);
    ANS1 = [];
    for i = 1:length(X0)
        [fz, converged] = newton(f, X0(i));
        if converged && abs(f(fz)) < 1e-6 && fz > -x0 && fz < x0
            ANS1(end+1) = fz;
        end
    end
    if abs(f(0)) < 1e-6
      check = 0
    endif
    retval = uniquetol(ANS1, 1e-6);
    if check == 0
      plot(retval, f(retval),'ro',0,f(0), 'ro');
    endif
    if check == 1
      plot(retval,f(retval),'ro')
    endif
    hold off;
end

function [root, converged] = newton(f, x0)
    if f(x0) == 0
      root = x0;
      converged = true;
      return;
    endif
    tol = 1e-6;
    maxiter = 1000;
    iter = 0;
    converged = false;

    while iter < maxiter
        fx = f(x0);
        dfx = derivative(f, x0); % Вычисление производной с использованием функции derivative
        x1 = x0 - fx / dfx;
        if abs(x1 - x0) < tol
            root = x1;
            converged = true;
            return;
        end
        x0 = x1;
        iter = iter + 1;
    end

    root = NaN;
    return;
end

function df = derivative(f, x)
    h = 1e-10;
    df = (f(x + h) - f(x)) / h;
end
