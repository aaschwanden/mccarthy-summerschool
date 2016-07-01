#!/usr/bin/env python

import numpy as np

def u_def_slab(H, alpha, n):

    f = np.sin(alpha*np.pi/180)
    return 2 * A * (rho * g * f)**n * ((H**(n+1))/(n+1)) * secpera

def u_def_channel(R, alpha, n):
    
    f = np.sin(alpha*np.pi/180)
    return 2 * A * (0.5 * rho * g * f)**n * ((R**(n+1))/(n+1)) * secpera

rho = 910
g = 9.81
alpha = 1.7
A = 2.4e-24
n = 3
secpera = 31556926

R = 1500
H = 900

print('Exercise 1: Flow speeds')
print('-----------------------\n')
print('channel speed for radius {}m: {:3.0f} m/yr'.format(R,
                                                          u_def_channel(R, alpha, n)))
print('channel speed for thickness {}m: {:3.0f} m/yr'.format(H,
                                                             u_def_channel(R, alpha, n)/8))
print('slab speed for thickness {}m: {:3.0f} m/yr'.format(H,
                                                          u_def_slab(H, alpha, n)))
print('Exercise 4: Ice thickness')
print('-------------------------\n\n')
print('If you assume an ice thickness of 1000m +/- 10%:')
H = 1000
print('u(H=900m) = {}m/yr'.format(u_def_slab(H*.9, alpha, n)))
print('u(H=1000m) = {}m/yr'.format(u_def_slab(H, alpha, n)))
print('u(H=1100m) = {}m/yr'.format(u_def_slab(H*1.1, alpha, n)))
print('\n')
print('u(H=1100m)-u(H=1000m)')
print('-------------------- = {}%'.format((u_def_slab(H, alpha, n)-u_def_slab(H*1.1, alpha, n))/u_def_slab(H, alpha, n)*100))
print('      u(H=1000m)   ')
print('\n')
print('u(H=900m)-u(H=1000m)')
print('-------------------- = {}%'.format((u_def_slab(H, alpha, n)-u_def_slab(H*0.9, alpha, n))/u_def_slab(H, alpha, n)*100))
print('      u(H=1000m)   ')
