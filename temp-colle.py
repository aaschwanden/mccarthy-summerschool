#!/usr/bin/env python

import numpy as np
import pylab as plt
import matplotlib.colors as colors
import matplotlib.cm as cmx

jet = cm = plt.get_cmap('jet')
cNorm = colors.Normalize(vmin=0, vmax=12)
scalarMap = cmx.ScalarMappable(norm=cNorm, cmap=jet)

# better use udunits
secpera = 31556925.9747

c_i = 2009   # J kg-1 K-1
k_i = 2.1    # J m-1 K-1 s-1
rho_i = 910  # kg m-3
kappa = k_i/(c_i*rho_i) * secpera

a = 0
b = 20
nx = 200

u_0 = -13
delta_u_0 = 7.

dt = 12.

z = np.linspace(a, b, nx+1, endpoint=True)
A = np.sqrt(2*np.pi/(2*kappa))


# Plot analytical solution for Colle Gnifetti
fig=plt.figure()
ax = fig.add_subplot(111)
k = 0
for t in np.linspace(0, 1, 12):
    T = u_0 + delta_u_0*np.exp(-A*z)*np.sin(2*np.pi*t-np.pi/2-A*z)
    colorVal = scalarMap.to_rgba(k)
    ax.plot( T, z, color=colorVal, linewidth=2)
    k += 1
plt.legend(['January','February','March','April','May','June','July','August','September','October','November','December'],
           loc='upper right', bbox_to_anchor=(1.1,1))
ax.set_xlabel(u'temperature (\u00B0C)')
ax.set_ylabel('depth below surface (m)')
ax.invert_yaxis()
plt.savefig('figures/colle-analytical.pdf', bbox_inches='tight')
