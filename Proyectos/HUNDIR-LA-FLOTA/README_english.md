<div align="center">
<h1> Battleship </h1>
</div>

<div align="center">
<img src="https://pbs.twimg.com/media/Be6NmaCIMAAvYWZ.jpg" width="600" height="300">
</div>

## Game Development:

The game is played by a single person on a randomly generated board.

The initial board (board) will be a 10x10 grid (as a list of lists) where each cell can be:
- Empty, represented by an empty string.
- Ship, represented by a combination of a letter and a digit.

The following ships will be present:
- 1 ship of length 5 (5A)
- 1 ship of length 4 (4A)
- 2 ships of length 3 (3A and 3B)
- 1 ship of length 2 (2A)

In each "turn," the player needs to specify the target position: A4, B7, C1, ... where letters represent rows and numbers represent columns.
Shooting is not allowed on an occupied cell or a cell outside the board.

In each "turn," the board with the attempts is displayed, where:
- Unexplored cell is represented by ⬛
- Water is represented by 🟦
- Touched ship is represented by 🟧
- Sunk ship is represented by 🟥

Each turn should display:
- Number of turns.
- Number of remaining ships to sink.
- Current score.
- The game ends when all the ships are sunk.

#### Scores:

| Move            | Score                   |
| --------------- | ----------------------- |
| WATER           | -1                      |
| TOUCHED         | 2 \* Length of the ship |
| TOUCHED & SUNK  | 4 \* Length of the ship |

:warning: **The score cannot be less than 0**

---

#### 1. Game Board Creation
For its creation, we set up a series of variables with the following names:

   - **COLUMN**: We'll use this to access the coordinate where an attack is desired.
   - **ROW**: Similar to the COLUMN variable, it's used for coordinate access.
   - **size**: This variable determines the size of the board.
   - **board2**: This variable is used to store the board visible to the player, through which they will interact.
   - **board**: We create this variable to store the function that generates the backboard.
  
```python
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size = 10
board2 = []
board = generate_board()
```

Once the above is completed, we will proceed to create the table as follows:

```python
for _ in range(size):
    row = []
    for col in range(size):
        row.append(UNEXPLORED)
    board2.append(row)
```

As well, we will print on the screen the table with the corresponding columns and rows:

```python
print(' ', end=' ')
for col in COLUMN:
    print(col, end=' ')
print()
for index, row in enumerate(ROW):
    print(row, end=' ')
    print(''.join(board2[index]), end='')
    print('')
```

#### 2. Board Traversal

Once the board is generated, on which the player can choose the exact coordinate, we need to traverse the board to find the exact index where it is located. Additionally, we must change its color depending on whether it is water, touched, or sunk. That's why we decided to create these variables to help us with the traversal:
   - **ship_hit**: This variable will be used to store the ships that the player has hit during the moves.
   - **coordinates**: It will store the coordinates used by the player in each move.
   - **score**: This visible variable will calculate the player's score.
   - **shoots**: It's the variable that will store the number of moves the player has made.
   - **ships**: This variable will store the number of ships, and it will help us display on the screen the number of ships remaining to be sunk on the game board.

```python
ship_hit = []
coordinates = []
score = 0
shoots = 0
ships = 5
```

Once the aforementioned variables are declared and created, it was decided to implement a **while loop** since the number of necessary iterations is unknown. Therefore, the following code will be entirely contained within a **while loop**:

```python
while 0 < ships:
    question = input('Introduzca la coordenada: ').upper()

    while len(question) < 2 or not question[0].isalpha() or not question[1:].isdigit():
        question = input('Introduzca una coordenada válida (Formato: Letra-Numero): ').upper()

    letter = ord(question[0]) - 65
    num = int(question[1:]) - 1

    while letter > 9 or letter < 0 or num > 9 or num < 0:
        question = input('Introduzca una coordenada válida: ').upper()
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
        coordinates.append(question)
        print(f'Shoots: {shoots}')

        for index1, row in enumerate(board):
            for index2, col in enumerate(row):
                if board[index1][index2] == target_board and ship_hit.count(target_board) == length:
                    board2[index1][index2] = SUNKEN
        if board2[letter][num] == SUNKEN:
            ships -= 1
            score += 4 * length
            print(f'Score: {score}')
            if ships > 0:
                print(' ', end=' ')
                for col in COLUMN:
                    print(col, end=' ')
                print()
                for index, row in enumerate(ROW):
                    print(row, end=' ')
                    print(''.join(board2[index]), end='')
                    print('')
                print(f'Quedan {ships} barcos.')
        else:
            score += 2 * length
            print(f'Score: {score}')
            print(' ', end=' ')
            for col in COLUMN:
                print(col, end=' ')
            print()
            for index, row in enumerate(ROW):
                print(row, end=' ')
                print(''.join(board2[index]), end='')
                print('')
            print(f'Quedan {ships} barcos.')
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
```

#### 3. Explanation of the While Loop Code:

We initiate the while loop with the following condition:

```python
while 0 < ships:
```

This condition is set so that the while loop runs as long as the number in the variable "ships" is greater than 0. Also, once the condition for entering the while loop is established, we create an input and add the `.upper()` function. This is done to allow the insertion of coordinates with both uppercase and lowercase letters:

```python
    question = input(
        "Introduce la coordenada: "
    ).upper()
```

Similarly, a condition is created where if the player enters coordinates incorrectly, it enters another **while loop** where they have to input it correctly to exit.

```python
    while len(question) < 2 or not question[0].isalpha() or not question[1:].isdigit():
        question = input('Introduzca una coordenada válida (Formato: Letra-Numero): ').upper()
```

Once the coordinate is entered, we proceed to break down the two parts of interest to locate the launch point. Therefore, we create the variable **letter** and the variable **num**. The **letter** variable is determined using the `ord()` function, subtracting to convert the ASCII value of the letter into a zero-based index representing its position in the alphabet. Finally, the **num** variable converts the number entered in the input back to an integer.

```python
    letter = ord(question[0]) - 65
    num = int(question[1:]) - 1
```

Additionally, we must verify if the entered coordinates are within the range of the board; if not, the player is instructed to input a valid coordinate.

```python
    while letter > 9 or letter < 0 or num > 9 or num < 0:
        question = input("Introduzca una coordenada válida: ").upper()
        letter = ord(question[0]) - 65
        num = int(question[1:]) - 1
```

Once confirmed that the coordinate entered by the player is valid, we will proceed to place the coordinate on the board. Using an **if** condition, we declare that if the coordinate is **EMPTY**, i.e., an empty string, and also not in the list of used coordinates, it should enter this loop. In this loop, the board will be printed with a blue box signaling that it is **WATER**. Additionally, 1 will be added to the number of shots, and depending on the score, 1 point will be subtracted or not. Next, the loop that prints the table with the corresponding cell colored in blue will be included again, along with displaying the number of remaining ships.

```python
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
```

However, if the previous condition is not met, we should enter the **elif** block. In this case, after marking the cell as touched and adding the ship's ID to the "ship_hit" variable, a check is performed to determine if the ship's length is equal to the number of times its ID appears in our "ship_hit" variable. If this is true, it means the ship is sunk. With a nested loop, a survey is conducted on the back board to find the indices of the ship and mark them as **SUNKEN** on the front board. Additionally, the operation to calculate the score must be changed based on whether the ship is sunk or just touched. The remaining ships will also be displayed, and the board will be printed again.

```python
    elif board[letter][num] is not EMPTY and question not in coordinates:
        target_board = board[letter][num]
        ship_hit.append(board[letter][num])
        length = int(target_board[0])
        board2[letter][num] = TOUCHED
        shoots += 1
        coordinates.append(question)
        print(f'Shoots: {shoots}')

        for index1, row in enumerate(board):
            for index2, col in enumerate(row):
                if board[index1][index2] == target_board and ship_hit.count(target_board) == length:
                    board2[index1][index2] = SUNKEN
        if board2[letter][num] == SUNKEN:
            ships -= 1
            score += 4 * length
            print(f'Score: {score}')
            if ships > 0:
                print(' ', end=' ')
                for col in COLUMN:
                    print(col, end=' ')
                print()
                for index, row in enumerate(ROW):
                    print(row, end=' ')
                    print(''.join(board2[index]), end='')
                    print('')
                print(f'Quedan {ships} barcos.')
        else:
            score += 2 * length
            print(f'Score: {score}')
            print(' ', end=' ')
            for col in COLUMN:
                print(col, end=' ')
            print()
            for index, row in enumerate(ROW):
                print(row, end=' ')
                print(''.join(board2[index]), end='')
                print('')
            print(f'Quedan {ships} barcos.')
```
Finally, within our while loop, we find this **else** block that only executes if the player enters a repeated coordinate.

```python
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
```

Once the main structure of the game is complete, we decide to print a **WELCOME** to invite the player to participate. Before starting the game, the player is given the option to review the rules of the game, allowing them to decide whether to view them or not.

```python
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

init_game = input('¿Quieres leer las instrucciones? [Y/N]').upper()
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
```

Similarly, when the player finishes sinking all the ships, a **YOU WIN!** message will be printed, along with the score they won with and the number of attempts it took to sink the ships.

```python
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
print(f'Con un puntaje de {score} y solo te llevó {shoots} shoots.')
```
##### Authors:
- [Nichole Louis](https://github.com/nicholelouis)
- [David Riccio](https://github.com/DavidRiccio)
- [Lili Guo Zeng](https://github.com/liliguoz)
  
