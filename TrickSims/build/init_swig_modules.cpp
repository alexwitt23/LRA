#include <Python.h>
#if PY_VERSION_HEX >= 0x03000000
extern "C" {

PyObject * PyInit__m90cba249b503e7b9ed9f0d592ad44d59(void) ; /* /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/S_source.hh */
PyObject * PyInit__m67528b5919f90a46eeeb39e7c6323718(void) ; /* /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/models/rocket/include/rocket.hh */
PyObject * PyInit__sim_services(void) ;
PyObject * PyInit__top(void) ;
PyObject * PyInit__swig_double(void) ;
PyObject * PyInit__swig_int(void) ;
PyObject * PyInit__swig_ref(void) ;

void init_swig_modules(void) {

    PyImport_AppendInittab("_m67528b5919f90a46eeeb39e7c6323718", PyInit__m67528b5919f90a46eeeb39e7c6323718) ;
    PyImport_AppendInittab("_m90cba249b503e7b9ed9f0d592ad44d59", PyInit__m90cba249b503e7b9ed9f0d592ad44d59) ;
    PyImport_AppendInittab("_sim_services", PyInit__sim_services) ;
    PyImport_AppendInittab("_top", PyInit__top) ;
    PyImport_AppendInittab("_swig_double", PyInit__swig_double) ;
    PyImport_AppendInittab("_swig_int", PyInit__swig_int) ;
    PyImport_AppendInittab("_swig_ref", PyInit__swig_ref) ;
    return ;
}

}
#else
extern "C" {

void init_m90cba249b503e7b9ed9f0d592ad44d59(void) ; /* /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/S_source.hh */
void init_m67528b5919f90a46eeeb39e7c6323718(void) ; /* /mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/models/rocket/include/rocket.hh */
void init_sim_services(void) ;
void init_top(void) ;
void init_swig_double(void) ;
void init_swig_int(void) ;
void init_swig_ref(void) ;

void init_swig_modules(void) {

    init_m67528b5919f90a46eeeb39e7c6323718() ;
    init_m90cba249b503e7b9ed9f0d592ad44d59() ;
    init_sim_services() ;
    init_top() ;
    init_swig_double() ;
    init_swig_int() ;
    init_swig_ref() ;
    return ;
}

}
#endif
