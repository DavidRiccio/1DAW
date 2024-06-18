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

# TABLERO HECHO CON LISTAS DE LISTAS.
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
size = 10
board2 = []
score = 0
num_inputs = 0

print(f'Número de turnos: {num_inputs}')
print(f'Score: {score}')

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
while True:
    question = input(
        "Introduce la coordenada a la que quieres disparar ej A4: "
    ).upper()

    letter = ord(question[0]) - 65
    num = int(question[1:]) - 1

    while letter > 9 or letter < 0 or num > 9 or num < 0:
        question = input("Intoduzca una coordenada valida: ").upper()
        letter = ord(question[0]) - 65
        num = int(question[1:]) - 1
    if board[letter][num] is EMPTY:
        board2[letter][num] = WATER
        num_inputs += 1
        print(f'Número de turnos: {num_inputs}')
        if score > 0:
            score -= 1
        else:
            score = 0
        print(f'Score: {score}')
    elif board[letter][num] is not EMPTY:
        board2[letter][num] = TOUCHED
        num_inputs += 1
        print(f'Número de turnos: {num_inputs}')

        

    # Imprime el tablero después de cada turno
    print(" ", end=" ")
    for c in COLUMN:
        print(c, end=" ")
    print()
    for i, r in enumerate(ROW):
        print(r, end=" ")
        print("".join(board2[i]), end="")
        print("")

    
