function retval = SOLVER(f, x0)
    x = linspace(-x0*2, x0*2, 1000);
    plot(x, f(x));
    hold on;
    xlabel('x');
    ylabel('y');
    grid on;

    X0 = linspace(-x0, x0, 1000);
    ANS1 = [];
    ANS2 = [];

    time1 = 0;
    time2 = 0;

    for i = 1:length(X0)
        tic;
        [fz, converged1] = newton(f, X0(i));
        time1 = time1 + toc;
        tol = 1e-6;
        if converged1 && (abs(f(fz)) < tol || abs(fz) < tol || abs(fz) < x0 * tol)
            ANS1(end+1) = fz;
        end

        tic;
        [fz, converged2] = bisection(f, X0(i)-1, X0(i)+1);
        time2 = time2 + toc;
        if converged2 && (abs(f(fz)) < tol || abs(fz) < tol || abs(fz) < x0 * tol)
            ANS2(end+1) = fz;
        end
    end

    retval1 = uniquetol(ANS1, 1e-6);
    retval2 = uniquetol(ANS2, 1e-6);
    if f(0) == 0
      plot(retval1, f(retval1), 'ro',0,f(0),'ro');
      plot(retval2, f(retval2), 'go',0,f(0),'ro');
    endif
    if f(0) != 0
      plot(retval1, f(retval1), 'ro');
      plot(retval2, f(retval2), 'go');
    endif
    plot(retval1, f(retval1), 'ro');
    plot(retval2, f(retval2), 'go');
    hold off;

    retval = struct('Newton', retval1, 'Bisection', retval2, 'NewtonTime', time1, 'BisectionTime', time2);
end

function [root, converged] = newton(f, x0)
    tol = 1e-6;
    maxiter = 1000;
    iter = 0;
    converged = false;

    while iter < maxiter
        fx = f(x0);
        if abs(fx) < tol
            root = x0;
            converged = true;
            return;
        end
        dfx = derivative(f, x0);
        if abs(dfx) < tol
            break;
        end
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

function [root, converged] = bisection(f, a, b)
    tol = 1e-6;
    maxiter = 1000;
    iter = 0;
    converged = false;
    roots = [];

    while iter < maxiter
        fa = f(a);
        fb = f(b);
        if abs(fa) < tol
            roots(end+1) = a;
            converged = true;
        end
        if abs(fb) < tol
            roots(end+1) = b;
            converged = true;
        end
        if fa * fb >= 0
            break;  
        end
        c = (a + b) / 2;
        fc = f(c);
        if abs(fc) < tol
            roots(end+1) = c;
            converged = true;
        end
        if fa * fc < 0
            b = c;
        else
            a = c;
        end
        iter = iter + 1;

        if converged && numel(roots) >= 2 && abs(roots(end) - roots(end-1)) < tol
            break;
        end
    end

    root = uniquetol(roots, tol);
    return;
end

function df = derivative(f, x)
    h = 1e-10;
    df = (f(x + h) - f(x)) / h;
end
