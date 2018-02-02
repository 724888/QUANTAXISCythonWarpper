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


cpdef 