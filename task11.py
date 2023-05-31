import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.integrate import solve_ivp

alpha = 10
beta = 28
gamma = 8/3

def F(t, state):
    x, y, z = state
    x1 = alpha * (y - x)
    y1 = x * (beta - z) - y
    z1 = x * y - gamma * z
    return x1, y1, z1

def runge_kutta4(F, t, init, t_eval):
    n = len(init)
    h = t_eval[1] - t_eval[0]
    sol = np.zeros((n, len(t_eval)))
    sol[:, 0] = init

    for i in range(1, len(t_eval)):
        k1 = np.array(F(t, sol[:, i-1]))
        k2 = np.array(F(t + h/2, sol[:, i-1] + h/2 * k1))
        k3 = np.array(F(t + h/2, sol[:, i-1] + h/2 * k2))
        k4 = np.array(F(t + h, sol[:, i-1] + h * k3))

        sol[:, i] = sol[:, i-1] + h/6 * (k1 + 2*k2 + 2*k3 + k4)
        t += h

    return sol

init = [0, 1, 20]
t = [0, 50]
t_eval = np.linspace(t[0], t[1], 50000)

sol_rk4 = runge_kutta4(F, t, init, t_eval)
sol_solve_ivp = solve_ivp(F, t, init, t_eval=t_eval).y

error = np.abs(sol_rk4 - sol_solve_ivp)

fig = plt.figure()
ax1 = fig.add_subplot(121, projection="3d")
ax1.plot(sol_rk4[0], sol_rk4[1], sol_rk4[2])
ax1.set_xlabel("x")
ax1.set_ylabel("y")
ax1.set_zlabel("z")
ax1.set_title("Runge-Kutta 4-го порядка")

ax2 = fig.add_subplot(122, projection="3d")
ax2.plot(sol_solve_ivp[0], sol_solve_ivp[1], sol_solve_ivp[2])
ax2.set_xlabel("x")
ax2.set_ylabel("y")
ax2.set_zlabel("z")
ax2.set_title("solve_ivp")

plt.figure()
plt.plot(t_eval, error.T)
plt.xlabel("Time")
plt.ylabel("Error")
plt.title("Comparison of Errors")
plt.legend(["x", "y", "z"])
plt.show()
