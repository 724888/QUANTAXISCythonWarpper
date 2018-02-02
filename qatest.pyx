# encoding: utf-8
# cython: profile=True
# cython: linetrace=True
# distutils: define_macros=CYTHON_TRACE_NOGIL=1


cimport cython

@cython.profile(False)
def my_often_called_function():
   pass


cdef extern from"stdio.h":
    extern int printf(const char *format, ...) 

cpdef SayHello():
    printf("hello,world\n")

cpdef f(double x):
    return x**2-x

cpdef integrate_f(double a, double b, int N):
    cdef int i
    cdef double s, dx
    s = 0
    dx = (b-a)/N
    for i in range(N):
        s += f(a+i*dx)
    return s * dx

def integrate(Function f, double a, double b, int N):
    cdef int i
    cdef double s, dx
    if f is None:
        raise ValueError("f cannot be None")
    s = 0
    dx = (b-a)/N
    for i in range(N):  
        s += f.evaluate(a+i*dx)
    return s * dx

cdef class Function:
    cpdef double evaluate(self, double x) except *:
        return x

cdef class WaveFunction(Function):
    # Not available in Python-space:
    cdef double offset
    # Available in Python-space:
    cdef public double freq
    # Available in Python-space:
    @property
    def period(self):
        return 1.0 / self.freq
    @period.setter
    def period(self, value):
        self.freq = 1.0 / value
