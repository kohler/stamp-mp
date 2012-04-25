#include <assert.h>
#include <math.h>
#include <stdarg.h>
#include <stdio.h>

double _ZGTt3log(double x) { return log(x); }

void _ZGTt13__assert_fail (__const char *__assertion, __const char *__file,
			   unsigned int __line, __const char *__function)
{
    __assert_fail(__assertion, __file, __line, __function);
}

void tm_printf(const char *format, ...)
{
    va_list ap;
    va_start(ap, format);
    vprintf(format, ap);
    va_end(ap);
}

void _ZGTt9tm_printf(const char *format, ...)
{
    va_list ap;
    va_start(ap, format);
    vprintf(format, ap);
    va_end(ap);
}


