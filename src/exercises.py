#!/usr/bin/env python

import numpy as np
import pint
from pint import UnitRegistry

ureg = UnitRegistry()

def u_def_slab(H: float, alpha: float, n: float) -> float: 

    f = np.sin(alpha*np.pi/180)
    return 2 * A * (rho * g * f)**n * ((H**(n+1))/(n+1))

def u_def_channel(R: float, alpha: float, n: float) -> float:
    
    f = np.sin(alpha*np.pi/180)
    return 2 * A * (0.5 * rho * g * f)**n * ((R**(n+1))/(n+1)) * secpera

n = 3
rho = 910 * ureg.kg / ureg.m**3
g = 9.81 * ureg.m / ureg.s**2
alpha = 1.7 * ureg.degree
A = 2.4e-24 / ureg.s / ureg.Pa**n

H = 900 * ureg.m
R = 1500 * ureg.m
secpera = 31556926

u_def_slab(H, alpha, n).to_base_units().to("m/yr")

print('Exercise 1: Flow speeds')
print('-----------------------\n')
print('channel speed for radius {}m: {:3.0f} m/yr'.format(R,
                                                          u_def_channel(R, alpha, n)))
print('channel speed for thickness {}m: {:3.0f} m/yr'.format(H,
                                                             u_def_channel(R, alpha, n)/8))
print('slab speed for thickness {}m: {:3.0f} m/yr'.format(H,
                                                          u_def_slab(H, alpha, n)))
