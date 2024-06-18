
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size2 = 10
Board2 = [ '⬛' * size2 for i in range(10)]

#PROBLEMA cada COLUMNA es texto y el texto es inmutable.
# da error si intentas cambiar de unexplored a water por ejemplo.

while True:
    print(' ', end=' ')
    for col in COLUMN:
        print(col, end=' ')
    print()
    for index, row in enumerate(ROW):
        print(row, end=" ")
        print(Board2[index])
    
    num = int(input("Introduce un numero: "))




