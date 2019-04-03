from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)
import sys
import os
sys.path.append(os.getcwd() + "/trick")

import _sim_services
from sim_services import *

# create "all_cvars" to hold all global/static vars
all_cvars = new_cvar_list()
combine_cvars(all_cvars, cvar)
cvar = None

# /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/S_source.hh
import _m90cba249b503e7b9ed9f0d592ad44d59
from m90cba249b503e7b9ed9f0d592ad44d59 import *
combine_cvars(all_cvars, cvar)
cvar = None

# /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/models/rocket/include/rocket.hh
import _m67528b5919f90a46eeeb39e7c6323718
from m67528b5919f90a46eeeb39e7c6323718 import *
combine_cvars(all_cvars, cvar)
cvar = None

# S_source.hh
import _m90cba249b503e7b9ed9f0d592ad44d59
from m90cba249b503e7b9ed9f0d592ad44d59 import *

import _top
import top

import _swig_double
import swig_double

import _swig_int
import swig_int

import _swig_ref
import swig_ref

from shortcuts import *

from exception import *

cvar = all_cvars

