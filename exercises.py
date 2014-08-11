#!/usr/bin/env python

import numpy as np

rho = 910
g = 9.81
alpha = 1.7
A = 2.4e-24
n = 3
secpera = 31556926

R = 1500
H = 900

f = np.sin(alpha*np.pi/180)

u_def_channel = 2 * A * (0.5 * rho * g * f)**n * ((R**(n+1))/(n+1)) * secpera / 365.
u_def_slab = 2 * A * (rho * g * f)**n * ((H**(n+1))/(n+1)) * secpera / 365.

print('channel speed for radius {}m: {:3.1f} m/day'.format(R, u_def_channel))
print('slab speed for thickness {}m: {:3.1f} m/day'.format(H, 2*u_def_slab))
