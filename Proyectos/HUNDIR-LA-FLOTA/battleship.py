import random
import string

EMPTY = ''

UNEXPLORED = '⬛'
WATER = '🟦'
TOUCHED = '🟧'
SUNKEN = '🟥'


def generate_board(
    size: int = 10,
    ships: tuple[tuple[int, int]] = ((5, 1), (4, 1), (3, 2), (2, 1)),
) -> list[list[str]]:
    board = [[EMPTY for _ in range(size)] for _ in range(size)]
    for sheep_size, num_ships in ships:
        placed_ships = 0
        while placed_ships < num_ships:
            sheep_id = f'{sheep_size}{string.ascii_uppercase[placed_ships]}'
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
            print(f'[{item:2s}]', end='')
        print()


# TU CÓDIGO DESDE AQUÍ HACIA ABAJO
# ↓↓↓↓↓↓↓↓↓

print(
    """
          _______  _        _______  _______  _______  _______ 
|\     /|(  ____ \( \      (  ____ \(  ___  )(       )(  ____ 
| )   ( || (    \/| (      | (    \/| (   ) || () () || (    \/
| | _ | || (__    | |      | |      | |   | || || || || (__    
| |( )| ||  __)   | |      | |      | |   | || |(_)| ||  __)   
| || || || (      | |      | |      | |   | || |   | || (      
| () () || (____/\| (____/\| (____/\| (___) || )   ( || (____/
(_______)(_______/(_______/(_______/(_______)|/     \|(_______/
         """
)

init_game = input('¿Quiere saber las instrucciones? [Y/N]').upper()
if init_game == 'Y':
    print()
    print('INSTRUCCIONES DE JUEGO:')
    print('El jugador deberá de usar el formato LETRA-NÚMERO, por ejemplo A1.')
    print('El juego acabará una vez hayas hundido todos los barcos.')
    print('')
    print('PUNTUACIÓN DEL JUEGO:')
    print(
        '- Si tocas agua se resta 1 a tu puntuación, pero tu puntuacion no puede ser en ningún momento menor a 0.s'
    )
    print(
        '- Si tocas un barco tu puntuación será la multiplicación de 2 por la longitud que tenga el barco.'
    )
    print(
        '- Si hundes un barco, tu puntación será la multiplición de 4 por la longitud que tenga el barco.'
    )
    print('¡Intenta hacer la mayor puntuación posible!')
    print('¡A jugar! ٩(^‿^)۶')
    print()
    star_game = input('Precione el enter para empezar la partida, ¡SUERTE! (*・‿・)ノ⌒*:･ﾟ✧')
else:
    print(
        """
 _______  _______  _______  _______  ___      _______  _______  __   __  ___   _______ 
|  _    ||   _   ||       ||       ||   |    |       ||       ||  | |  ||   | |       |
| |_|   ||  |_|  ||_     _||_     _||   |    |    ___||  _____||  |_|  ||   | |    _  |
|       ||       |  |   |    |   |  |   |    |   |___ | |_____ |       ||   | |   |_| |
|  _   | |       |  |   |    |   |  |   |___ |    ___||_____  ||       ||   | |    ___|
| |_|   ||   _   |  |   |    |   |  |       ||   |___  _____| ||   _   ||   | |   |    
|_______||__| |__|  |___|    |___|  |_______||_______||_______||__| |__||___| |___|   
      """
    )

COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size = 10
board2 = []
board = generate_board()

for _ in range(size):
    row = []
    for col in range(size):
        row.append(UNEXPLORED)
    board2.append(row)

# PARA QUE SE IMPRIMA SIN CARACTERES
print(' ', end=' ')
for col in COLUMN:
    print(col, end=' ')
print()
for index, row in enumerate(ROW):
    print(row, end=' ')
    print(''.join(board2[index]), end='')
    print('')
# PRUEBA ------------------------
ship_hit = []
coordinates = []
score = 0
shoots = 0
ships = 5


while 0 < ships:
    question = input('Introduzca la coordenada: ').upper()

    letter = ord(question[0]) - 65
    num = int(question[1:]) - 1

    while letter > 9 or letter < 0 or num > 9 or num < 0:
        question = input('Intoduzca una coordenada válida: ').upper()
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
        print(' ', end=' ')
        for col in COLUMN:
            print(col, end=' ')
        print()
        for index, row in enumerate(ROW):
            print(row, end=' ')
            print(''.join(board2[index]), end='')
            print('')
        coordinates.append(question)
        print(f'Quedan {ships} barcos.')

    elif board[letter][num] is not EMPTY and question not in coordinates:
        target_board = board[letter][num]
        ship_hit.append(board[letter][num])
        length = int(target_board[0])
        board2[letter][num] = TOUCHED
        shoots += 1
        print(f'Shoots: {shoots}')

        for index, lista in enumerate(board):
            for j, element in enumerate(lista):
                if board[index][j] == target_board and ship_hit.count(target_board) == length:
                    board2[index][j] = SUNKEN
        if board2[letter][num] == SUNKEN:
            ships -= 1
            score += 4 * length
            print(f'Score: {score}')
            if ships > 0:
                print(f'Quedan {ships} barcos.')
        else:
            score += 2 * length
            print(f'Score: {score}')
            print(f'Quedan {ships} barcos.')

        print(' ', end=' ')
        for col in COLUMN:
            print(col, end=' ')
        print()
        for index, row in enumerate(ROW):
            print(row, end=' ')
            print(''.join(board2[index]), end='')
            print('')
        coordinates.append(question)
    else:
        print(' ', end=' ')
        for col in COLUMN:
            print(col, end=' ')
        print()
        for index, row in enumerate(ROW):
            print(row, end=' ')
            print(''.join(board2[index]), end='')
            print('')
        print('Esa ya fue utilizada')
        print(f'Quedan {ships} barcos.')

print(
    """
 __ __   ___   __ __      __    __  ____  ____       __ 
|  |  | /   \ |  |  |    |  |__|  ||    ||    \     |  |
|  |  ||     ||  |  |    |  |  |  | |  | |  _  |    |  |
|  ~  ||  O  ||  |  |    |  |  |  | |  | |  |  |    |__|
|___, ||     ||  :  |    |  `  '  | |  | |  |  |     __ 
|     ||     ||     |     \      /  |  | |  |  |    |  |
|____/  \___/  \__,_|      \_/\_/  |____||__|__|    |__|
                                                        
"""
)
