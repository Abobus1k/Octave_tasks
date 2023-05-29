function retval = FRACTO(f, x0)
    c = [1,0,0,-1]
    root = roots(c)
    result =[];
    eps = 1e-10
    ANS1 = [];
    matrix = zeros(x0*20,x0*20);
    x = -x0:0.1:x0;
    y = -x0:0.1:x0;
    [X,Y] = meshgrid(x,y);
    for i = 1:length(X)
      for j = 1:length(Y)
        z = X(i,j)+Y(i,j)*1i;
        fz =  newton(f, z);
        if(abs(fz-root(1))<eps)
          matrix(i,j)=20;
        elseif(abs(fz-root(2))<eps)
          matrix(i,j)=30;
        elseif(abs(fz-root(3))<eps)
          matrix(i,j)=40;
        else
          matrix(i,j)=10;
        end
      end
    end
    figure
    image(matrix);
    colorbar
    hold off;
end


function [root, iter] = newton(f, x0)
  df = @(x) 3*x^2;
  tol = 1e-10;
  maxiter=100;
    iter = 0;
    while iter < maxiter
        fx = f(x0);
        if abs(fx) < tol
            root = x0;
            return;
        end
        dfx = df(x0);
        x1 = x0 - fx / dfx;
        if abs(x1 - x0) < tol
            root = x1;
            return;
        end
        x0 = x1;
        iter = iter + 1;
    end
    root = -1;
end
