# *******************************
# ASEGURANDO ARGUMENTOS POSITIVOS
# *******************************
def assert_positive(func):
    def wrapper(*args, **kwargs):
        for arg in args:
            if arg <= 0:
                return 0
        return func(*args, **kwargs)
    return wrapper

@assert_positive
def factorial(n: int) -> int:
    result = 1
    if n == 0:
        return result
    else:
        for i in range(1, n + 1):
            result *= i
        return result


 