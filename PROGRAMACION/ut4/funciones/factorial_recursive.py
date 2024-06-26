# *******************************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO (CON RECURSIVIDAD)
# *******************************************************


def factorial(n: int) -> int|None:
    if n == 0:
        return 1
    elif n < 0:
        return None
    else:
        return n * factorial(n - 1)
