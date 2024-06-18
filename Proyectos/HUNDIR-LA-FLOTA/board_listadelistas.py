# TABLERO HECHO CON LISTAS DE LISTAS.
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size = 10
UNEXPLORED = '⬛'
board2 = []
for _ in range(size):
    row = []
    for col in range(size):
        row.append(UNEXPLORED)
    board2.append(row)

# PARA QUE SE IMPRIMA SIN CARACTERES
print(' ', end=' ')
for c in COLUMN:
    print(c, end=' ')
print()
for i, r in enumerate(ROW):
    print(r, end=" ")
    print( "".join(board2[i]), end="")
    print("")

#PRUEBA ------------------------
while True:
    lista1=[1, 2, 3, 5, 15, 12, 10, 20]
    num = int(input("Introduce un numero: "))
    if num in lista1:
        board2[0][num -1]= '🟦'
        for i in range(size):
            print( "".join(board2[i]), end="")
            print("")