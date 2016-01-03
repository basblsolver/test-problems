# ------------------------------------------------------------------------------
# Name
#   Example 3.22                                                     (mb_1_1_15)
# Source:
#   Mitsos, A., & Barton, P.I. (2007). A Test Set for Bilevel Programs.
#   Technical Report. Massachusetts Institute of Technology
#
# Optimal solution:
#   F* = 0.210, f* = -0.069 at (x*,y*) = (-0.555,0.455)
# ------------------------------------------------------------------------------
# OUTER VARIABLES
var x >= -1, <= 1,
  suffix cat 1;

# INNER VARIABLES
var y >= -1, <= 1,
  suffix cat 2;

# KKT MULTIPLIERS
var mu1 >= 0, <= 10,
  suffix cat 3;

var mu2 >= 0, <= 10,
  suffix cat 3;

var mu3 >= 0, <= 10,
  suffix cat 3;

# Note: In (Mitsos, 2007): (x - 0.6)^2 + y^2, looks typos @REM
# OUTER OBJECTIVE
minimize outer_obj: (x + 0.6)^2 + y^2,
  suffix cat 1;

# INNER OBJECTIVE AS CONSTRAINT: <= 0
subject to inner_obj: y^4 + (4/30)*(-x+1)*y^3 + (-0.02*x^2+0.16*x-0.4)*y^2 + (0.004*x^3-0.036*x^2+0.08*x)*y <= 0,
  suffix cat 2;

# INNER CONSTRAINT
subject to inner_con: 0.01*(1+x^2) - y^2 <= 0,
  suffix cat 2;

# STATIONARITY AND COMPLEMENTARITY CONDITIONS
subject to stationarity: 0.004*x^3-0.036*x^2+0.08*x + (-0.04*x^2+0.32*x-0.8-2*mu3)*y + (-0.4*x+0.4)*y^2 + 4*y^3 - mu1 + mu2 = 0,
  suffix cat 3;

subject to complementarity_1: mu1*(-1 - y) = 0,
  suffix cat 3;

subject to complementarity_2: mu2*(y - 1) = 0,
  suffix cat 3;

subject to complementarity_3: mu3*(0.01*(1+x^2) - y^2) = 0,
  suffix cat 3;










