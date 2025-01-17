# This file was automatically generated by SWIG (http://www.swig.org).
# Version 3.0.12
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info >= (2, 7, 0):
    def swig_import_helper():
        import importlib
        pkg = __name__.rpartition('.')[0]
        mname = '.'.join((pkg, '_swig_double')).lstrip('.')
        try:
            return importlib.import_module(mname)
        except ImportError:
            return importlib.import_module('_swig_double')
    _swig_double = swig_import_helper()
    del swig_import_helper
elif _swig_python_version_info >= (2, 6, 0):
    def swig_import_helper():
        from os.path import dirname
        import imp
        fp = None
        try:
            fp, pathname, description = imp.find_module('_swig_double', [dirname(__file__)])
        except ImportError:
            import _swig_double
            return _swig_double
        try:
            _mod = imp.load_module('_swig_double', fp, pathname, description)
        finally:
            if fp is not None:
                fp.close()
        return _mod
    _swig_double = swig_import_helper()
    del swig_import_helper
else:
    import _swig_double
del _swig_python_version_info

try:
    _swig_property = property
except NameError:
    pass  # Python < 2.2 doesn't have 'property'.

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_setattr_nondynamic(self, class_type, name, value, static=1):
    if (name == "thisown"):
        return self.this.own(value)
    if (name == "this"):
        if type(value).__name__ == 'SwigPyObject':
            self.__dict__[name] = value
            return
    method = class_type.__swig_setmethods__.get(name, None)
    if method:
        return method(self, value)
    if (not static):
        if _newclass:
            object.__setattr__(self, name, value)
        else:
            self.__dict__[name] = value
    else:
        raise AttributeError("You cannot add attributes to %s" % self)


def _swig_setattr(self, class_type, name, value):
    return _swig_setattr_nondynamic(self, class_type, name, value, 0)


def _swig_getattr(self, class_type, name):
    if (name == "thisown"):
        return self.this.own()
    method = class_type.__swig_getmethods__.get(name, None)
    if method:
        return method(self)
    raise AttributeError("'%s' object has no attribute '%s'" % (class_type.__name__, name))


def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)

try:
    _object = object
    _newclass = 1
except __builtin__.Exception:
    class _object:
        pass
    _newclass = 0

class swig_double(_object):
    __swig_setmethods__ = {}
    __setattr__ = lambda self, name, value: _swig_setattr(self, swig_double, name, value)
    __swig_getmethods__ = {}
    __getattr__ = lambda self, name: _swig_getattr(self, swig_double, name)

    def __str__(self):
        return _swig_double.swig_double___str__(self)

    def __repr__(self):
        return _swig_double.swig_double___repr__(self)

    def __add__(self, obj1):
        return _swig_double.swig_double___add__(self, obj1)

    def __sub__(self, obj1):
        return _swig_double.swig_double___sub__(self, obj1)

    def __mul__(self, obj1):
        return _swig_double.swig_double___mul__(self, obj1)

    def __div__(self, obj1):
        return _swig_double.swig_double___div__(self, obj1)

    def __truediv__(self, obj1):
        return _swig_double.swig_double___truediv__(self, obj1)

    def __floordiv__(self, obj1):
        return _swig_double.swig_double___floordiv__(self, obj1)

    def __mod__(self, obj1):
        return _swig_double.swig_double___mod__(self, obj1)

    def __pow__(self, obj1):
        return _swig_double.swig_double___pow__(self, obj1)

    def __radd__(self, obj1):
        return _swig_double.swig_double___radd__(self, obj1)

    def __rsub__(self, obj1):
        return _swig_double.swig_double___rsub__(self, obj1)

    def __rmul__(self, obj1):
        return _swig_double.swig_double___rmul__(self, obj1)

    def __rdiv__(self, obj1):
        return _swig_double.swig_double___rdiv__(self, obj1)

    def __rtruediv__(self, obj1):
        return _swig_double.swig_double___rtruediv__(self, obj1)

    def __rfloordiv__(self, obj1):
        return _swig_double.swig_double___rfloordiv__(self, obj1)

    def __rmod__(self, obj1):
        return _swig_double.swig_double___rmod__(self, obj1)

    def __rpow__(self, obj1):
        return _swig_double.swig_double___rpow__(self, obj1)

    def __iadd__(self, obj1):
        return _swig_double.swig_double___iadd__(self, obj1)

    def __isub__(self, obj1):
        return _swig_double.swig_double___isub__(self, obj1)

    def __imul__(self, obj1):
        return _swig_double.swig_double___imul__(self, obj1)

    def __idiv__(self, obj1):
        return _swig_double.swig_double___idiv__(self, obj1)

    def __itruediv__(self, obj1):
        return _swig_double.swig_double___itruediv__(self, obj1)

    def __ifloordiv__(self, obj1):
        return _swig_double.swig_double___ifloordiv__(self, obj1)

    def __imod__(self, obj1):
        return _swig_double.swig_double___imod__(self, obj1)

    def __ipow__(self, obj1):
        return _swig_double.swig_double___ipow__(self, obj1)

    def __lt__(self, obj1):
        return _swig_double.swig_double___lt__(self, obj1)

    def __le__(self, obj1):
        return _swig_double.swig_double___le__(self, obj1)

    def __eq__(self, obj1):
        return _swig_double.swig_double___eq__(self, obj1)

    def __ne__(self, obj1):
        return _swig_double.swig_double___ne__(self, obj1)

    def __gt__(self, obj1):
        return _swig_double.swig_double___gt__(self, obj1)

    def __ge__(self, obj1):
        return _swig_double.swig_double___ge__(self, obj1)

    def __neg__(self):
        return _swig_double.swig_double___neg__(self)

    def __pos__(self):
        return _swig_double.swig_double___pos__(self)

    def __abs__(self):
        return _swig_double.swig_double___abs__(self)

    def __int__(self):
        return _swig_double.swig_double___int__(self)

    def __long__(self):
        return _swig_double.swig_double___long__(self)

    def __float__(self):
        return _swig_double.swig_double___float__(self)

    def __len__(self):
        return _swig_double.swig_double___len__(self)

    def __init__(self):
        this = _swig_double.new_swig_double()
        try:
            self.this.append(this)
        except __builtin__.Exception:
            self.this = this
    __swig_destroy__ = _swig_double.delete_swig_double
    __del__ = lambda self: None
swig_double_swigregister = _swig_double.swig_double_swigregister
swig_double_swigregister(swig_double)

# This file is compatible with both classic and new-style classes.


