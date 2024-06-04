#!/usr/bin/env python

import numpy as np
import pint
from pint import UnitRegistry

ureg = UnitRegistry()


def u_def_slab(H: float, alpha: float, n: float) -> float:
    """
    Compute the speed of a slab.

    Parameters
    ----------
    H : float
        The thickness of the slab.
    alpha : float
        The slope of the slab.
    n : float
        The exponent of the flow law.

    Returns
    -------
    float
        The speed of the slab.
    """
    f = np.sin(alpha)
    return 2 * A * (rho * g * f) ** n * ((H ** (n + 1)) / (n + 1))


def u_def_channel(R: float, alpha: float, n: float) -> float:
    """
    Compute the speed of a channel.

    Parameters
    ----------
    R : float
        The radius of the channel.
    alpha : float
        The slope of the channel.
    n : float
        The exponent of the flow law.

    Returns
    -------
    float
        The speed of the channel.
    """
    f = np.sin(alpha)
    return 2 * A * (0.5 * rho * g * f) ** n * ((R ** (n + 1)) / (n + 1))


n = 3  # exponent of the flow law, dimensionless
rho = 910 * ureg.kg / ureg.m**3  # density of ice, mass / lenth**3
g = 9.81 * ureg.m / ureg.s**2  # acceleration due to gravity, lenght / time**2
alpha = 1.7 * ureg.degree  # slope, degrees
A = 2.4e-24 / ureg.s / ureg.Pa**n  # Rate factor of 0C ice, Pressure**-n * time**-1

H = 900 * ureg.m  # thickness, length
R = 1500 * ureg.m  # radius, length

u_channel_radius = u_def_channel(R, alpha, n).to_base_units().to("m/yr")
u_channel_thickness = u_def_channel(R, alpha, n).to_base_units().to("m/yr") / 8
u_slab = u_def_slab(H, alpha, n).to_base_units().to("m/yr")

print("Exercise 1: Flow speeds")
print("-----------------------\n")
print(f"channel speed for radius {R}m: {u_channel_radius:.0f}")
print(f"channel speed for thickness {H}m: {u_channel_thickness:.0f}")
print(f"slab speed for thickness {H}m: {u_slab:.0f}")
