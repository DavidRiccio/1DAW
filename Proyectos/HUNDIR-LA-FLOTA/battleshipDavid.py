import random
import string

EMPTY = ""

UNEXPLORED = "⬛"
WATER = "🟦"
TOUCHED = "🟧"
SUNKEN = "🟥"


def generate_board(
    size: int = 10,
    ships: tuple[tuple[int, int]] = ((5, 1), (4, 1), (3, 2), (2, 1)),
) -> list[list[str]]:
    board = [[EMPTY for _ in range(size)] for _ in range(size)]
    for sheep_size, num_ships in ships:
        placed_ships = 0
        while placed_ships < num_ships:
            sheep_id = f"{sheep_size}{string.ascii_uppercase[placed_ships]}"
            row, col = random.randint(0, size), random.randint(0, size)
            step = random.choice((-1, 1))
            row_step, col_step = (step, 0) if random.randint(0, 1) else (0, step)
            breadcrumbs = []
            for _ in range(sheep_size):
                try:
                    if not (0 <= row < size and 0 <= col < size):
                        raise IndexError()
                    if board[row][col] == EMPTY:
                        board[row][col] = sheep_id
                        breadcrumbs.append((row, col))
                    else:
                        raise IndexError()
                    row += row_step
                    col += col_step
                except IndexError:
                    # reset board
                    for bc in breadcrumbs:
                        board[bc[0]][bc[1]] = EMPTY
                    break
            else:
                placed_ships += 1

    return board


def show_board(board: list[list[str]]) -> None:
    for row in board:
        for item in row:
            print(f"[{item:2s}]", end="")
        print()


# TU CÓDIGO DESDE AQUÍ HACIA ABAJO
# ↓↓↓↓↓↓↓↓↓
print()
print('''
          _______  _        _______  _______  _______  _______ 
|\     /|(  ____ \( \      (  ____ \(  ___  )(       )(  ____ 
| )   ( || (    \/| (      | (    \/| (   ) || () () || (    \/
| | _ | || (__    | |      | |      | |   | || || || || (__    
| |( )| ||  __)   | |      | |      | |   | || |(_)| ||  __)   
| || || || (      | |      | |      | |   | || |   | || (      
| () () || (____/\| (____/\| (____/\| (___) || )   ( || (____/
(_______)(_______/(_______/(_______/(_______)|/     \|(_______/
         '''           
)
print()
print('LAS INSTRUCCIONES SON LAS SIGUIENTES:')
print('FORMATO LETRA-NUMERO EJEMPLO A4')
print('EL JUEGO ACABA CUANDO TODOS LOS BARCOS HAN SIDO ELIMINADOS')
print()
first_question=input('HAS ENTENDIDO LAS INSTRUCCIONES: Y/N ').upper()


if first_question=='Y':
    # TABLERO HECHO CON LISTAS DE LISTAS.
    print('''
    _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______ 
    |  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |
    | |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |
    |       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |
    |  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|
    | |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   |    
    |_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|   
        ''')
    COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    ROW = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    size = 10
    UNEXPLORED = "⬛"
    board2 = []
    board = generate_board()
    for _ in range(size):
        row = []
        for col in range(size):
            row.append(UNEXPLORED)
        board2.append(row)

    # PARA QUE SE IMPRIMA SIN CARACTERES
    print(" ", end=" ")
    for c in COLUMN:
        print(c, end=" ")
    print()
    for i, r in enumerate(ROW):
        print(r, end=" ")
        print("".join(board2[i]), end="")
        print("")
    # PRUEBA ------------------------
    ship_hit = []
    sunkens = []
    coordinates = []
    score = 0
    shoots = 0
    ships = 5


    print(f'Shoots: {shoots}')
    print(f'Score: {score}')

    while 0 < ships:
        
        COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        ROW = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

        question = input(
            "Introduce la coordinates a la que quieres disparar ej A4: "
        ).upper()

        letter = ord(question[0]) - 65
        num = int(question[1:]) - 1

        while letter > 9 or letter < 0 or num > 9 or num < 0:
            question = input("Intoduzca una coordinates valida: ").upper()
            letter = ord(question[0]) - 65
            num = int(question[1:]) - 1

        if board[letter][num] is EMPTY and question not in coordinates:
            board2[letter][num] = WATER
            shoots += 1
            print(f'Shoots: {shoots}')
            if score > 0:
                score -= 1
            else:
                score = 0
            print(f'Score: {score}')
            print(" ", end=" ")
            for c in COLUMN:
                print(c, end=" ")
            print()
            for i, r in enumerate(ROW):
                print(r, end=" ")
                print("".join(board2[i]), end="")
                print("")
            coordinates.append(question)
            print(f"Quedan {ships} barcos.")

        elif board[letter][num] is not EMPTY and question not in coordinates:

            
            target_board = board[letter][num]
            ship_hit.append(board[letter][num])
            length = int(target_board[0])
            board2[letter][num] = TOUCHED
            shoots += 1
            print(f'Shoots: {shoots}')
            
            for i, listas in enumerate(board):
                for j, elemento in enumerate(listas):
                    if board[i][j] == target_board and ship_hit.count(target_board) == length:
                        board2[i][j] = SUNKEN
            if board2[letter][num] == SUNKEN:
                ships -= 1
                score += 4 * length
                print(f'Score: {score}')
                if ships > 0:
                    print(f"Quedan {ships} barcos.")
            else:
                score += 2 * length
                print(f'Score: {score}')
                print(f"Quedan {ships} barcos.")

            print(" ", end=" ")
            for c in COLUMN:
                print(c, end=" ")
            print()
            for i, r in enumerate(ROW):
                print(r, end=" ")
                print("".join(board2[i]), end="")
                print("")
            coordinates.append(question)
        else:
            print(" ", end=" ")
            for c in COLUMN:
                print(c, end=" ")
            print()
            for i, r in enumerate(ROW):
                print(r, end=" ")
                print("".join(board2[i]), end="")
                print("")
            print("Esa ya fue utilizada")
            print(f"Quedan {ships} barcos.")
    print('''
 __ __   ___   __ __      __    __  ____  ____       __ 
|  |  | /   \ |  |  |    |  |__|  ||    ||    \     |  |
|  |  ||     ||  |  |    |  |  |  | |  | |  _  |    |  |
|  ~  ||  O  ||  |  |    |  |  |  | |  | |  |  |    |__|
|___, ||     ||  :  |    |  `  '  | |  | |  |  |     __ 
|     ||     ||     |     \      /  |  | |  |  |    |  |
|____/  \___/  \__,_|      \_/\_/  |____||__|__|    |__|
                                                        
''')
else: 
    first_question=input('ESTAS SEGURO? Y/N ').upper()
    if first_question=='N':
        print('Has decicido no jugar ADIOS!')