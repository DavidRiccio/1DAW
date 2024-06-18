#TABLERO HECHO CON UNA SOLA LISTA.
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size2 = 10

Board2 = [ '⬛' for i in range(100)]
acc = 0
for x in Board2:
    print(x, end="")
    acc += 1
    if acc == 10:
        print("")
        acc = 0

#PRUEBA ------------------------
while True:
    lista1=[1, 2, 3, 5, 15, 12, 10, 20]
    num = int(input("Introduce un numero: "))
    if num in lista1:
        Board2[num -1]= '🟦'
        for x in Board2:
            print(x, end="")
            acc += 1
            if acc == 10:
                print("")
                acc = 0