# *******************************
# DECORANDO CON VALORES ABSOLUTOS
# *******************************


def fabs(func):
    def num_abs(a:int,b:int,*args)->int:
        a=abs(a)
        b=abs(b)
        return func(a,b,)
    return num_abs

@fabs
def fprod(a:int,b:int)->int:
    return a * b