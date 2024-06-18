# **************
# HIPERFACTORIAL
# **************
def powers(base:int,exponent:int)->int:
    if exponent == 0:
        return 1
    else:
        return base * powers(base, exponent - 1)

def hyperfactorial(n:int)->int:
    if n == 1:
        return 1
    else:
        return powers(n, n) * hyperfactorial(n - 1)

