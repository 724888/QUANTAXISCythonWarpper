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


cdef class QACQuotation:
    """quotation cython accelerator
    """

    cdef public double open_price
    cdef public double high_price
    cdef public double low_price
    cdef public double close_price
    cdef public double volume
    cdef public double amount
    cdef public char code
    cdef public char datetime
    cdef public char time
    cdef public char date
    cdef public double last_close
    cdef public double bid1_price
    cdef public double bid1_volume
    cdef public double ask1_price
    cdef public double ask1_volume
    cdef public double bid2_price
    cdef public double bid2_volume
    cdef public double ask2_price
    cdef public double ask2_volume
    cdef public double bid3_price
    cdef public double bid3_volume
    cdef public double ask3_price
    cdef public double ask3_volume
    cdef public double bid4_price
    cdef public double bid4_volume
    cdef public double ask4_price
    cdef public double ask4_volume
    cdef public double bid5_price
    cdef public double bid5_volume
    cdef public double ask5_price
    cdef public double ask5_volume



