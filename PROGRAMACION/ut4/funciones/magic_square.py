# ***************
# CUADRADO MÁGICO
# ***************


def is_magic_square(values:list):
    n = len(values)
    
    # Calcular la suma esperada de una fila, columna o diagonal
    suma_esperada = n * (n ** 2 + 1) // 2
    
    # Verificar filas y columnas
    for i in range(n):
        if suma_esperada != sum(values[i]) or suma_esperada != sum(values[j][i] for j in range(n)):
            return False
    
    # Verificar diagonales
    diagonal_principal = sum(values[i][i] for i in range(n))
    diagonal_secundaria = sum(values[i][n - i - 1] for i in range(n))
    if diagonal_principal != suma_esperada or diagonal_secundaria != suma_esperada:
        return False
    
    return True

