<div align="center">
<h1> Battleship </h1>
</div>

<div align="center">
<img src="https://pbs.twimg.com/media/Be6NmaCIMAAvYWZ.jpg" width="600" height="300">
</div>

## Desarrollo del juego:

Sólo juega una persona con un tablero board generado aleatoriamente.
Este tablero (board) inicial tendrá un tamaño de 10x10 (como lista de listas) donde cada celda puede ser:
Vacío representado por la cadena vacía.
Barco representado por una combinación de letra+dígito.

Habrá los siguientes barcos:
- 1 barco de longitud 5 (5A)
- 1 barco de longitud 4 (4A)
- 2 barcos de longitud 3 (3A y 3B)
- 1 barco de longitud 2 (2A)

En cada "turno" habrá que indicar la posición de tiro: A4, B7, C1, ... donde las letras representan filas y los números representan columnas.
No se permite posición de tiro sobre una celda ocupada o sobre una celda fuera del tablero.
En cada "turno" habrá que mostrar el tablero con los intentos realizados:
- Celda inexplorada representada por ⬛
- Agua representada por 🟦
- Barco tocado representado por 🟧
- Barco hundido representado por 🟥
  
En cada turno habrá que mostrar:
- Número de turnos.
- Número de barcos que quedan por hundir.
- Puntuación hasta el momento.
- El juego termina cuando se han hundido todos los barcos.

#### Puntuaciones:

| Jugada           | Puntuación              |
| ---------------- | ----------------------- |
| AGUA             | -1                      |
| TOCADO           | 2 \* Longitud del barco |
| TOCADO Y HUNDIDO | 4 \* Longitud del barco |

:warning: **La puntuación no puede ser menor que 0**

---

## Creación del código:
### Pasos seguidos:

#### 1. Creación del tablero de juego
Para la creación de la misma, creamos una serie de variables con los siguientes nombres:
   - **COLUMN**: La utilizaremos para poder acceder a la coordenada en la que se desee atacar
   - **ROW**: Al igual que la variable COLUMN será de utilizadad para el acceso de las cooderdenadas
   - **size**: Esta variable determinará el tamaño del tablero
   - **board2**: Se usará esta variable para almacenar el tablero que le aparecerá al jugador, a través del cual interactuará con él.
   - **board**: Creamos esta variable para poder almacenar la función que crea el backboard.
  
```python
COLUMN = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ROW = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
size = 10
board2 = []
board = generate_board()
```

Una vez hecho la anterior procederemos a crear la tabla de la siguiente forma:

```python
for _ in range(size):
    row = []
    for col in range(size):
        row.append(UNEXPLORED)
    board2.append(row)
```

Asimismo, imprimiremos en plantalla con la tabla con las columnas y filas correspondientes:

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

#### 2. Recorrido del tablero

Una vez generado el tablero en el cuál el jugador podrá elegir la coordenada exacta deberemos de recorrer el tablero para encontrar el índice exacto en el que se encuentra, además deberemos de cambiar su color dependiendo de si es agua, tocado o hundido. Es por ello que decidimos crear estas variables para ayudarnos a realizar el recorrido:
   - **ship_hit**: Se usará esta variable para almacenar los barcos que el jugador ha tocado en los lanzamientos.
   - **coordinates**: En ella se almacenarán las coordenadas que el jugador use en cada lanzamiento.
   - **score**: Será la variable visible que calculará la puntuación que tiene el jugador
   - **shoots**: Es la variable que almacanará el número de lanzamientos que ha hecho el jugador.
   - **ships**: Esta variable almacenará el número de barcos que hay, será de ayuda ya que con esta variable podremos imprimir por pantalla el número de barcos que quedarían por hundir en el tablero de juego.

```python
ship_hit = []
coordinates = []
score = 0
shoots = 0
ships = 5
```

Una vez declaradas y creadas las anteriores variables, se decidió implementar un **bucle while** ya que no se conoce el número de iteraciones necesarias. Por tanto el siguiente código estará en su totalidad contenido dentro de un **bucle while**:

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

#### 3. Explicación del código del bucle while:

Empezamos el bucle while con la siguiente condición:

```python
while 0 < ships:
```

Esta condición se establece para que el bucle while se ejecute mientras el número de la variable ships sea mayor que 0. Asimismo, una vez hecha la condición por la que ingresamos al bucle while creamos el input y además le añadimos una función
.upper() para que se puedan insertar las letras de las coodernadas tanto en mayúsculas como en minúsculas:

```python
    question = input(
        "Introduce la coordenada: "
    ).upper()
```

De la misma forma se crea una condición en la cuál si el jugador inserta las coordenadas de una forma incorrecta ingresa en otro **bucle while** donde tendrá que insertarla de forma correcta para poder salir de el.

```python
    while len(question) < 2 or not question[0].isalpha() or not question[1:].isdigit():
        question = input('Introduzca una coordenada válida (Formato: Letra-Numero): ').upper()
```

Una vez puesta la coodernada prodeceremos a trocear las dos partes que nos interesan para poder localizar el punto de lanzamiento. Por tanto crearemos la varible **letter** y la variable **num**. La varible **letter** se localiza utilizando la función ord(), se realiza una resta para convertir el valor ASCII de la letra en un índice basado en cero que representa su posición en el alfabeto. Y por último la variable **num** volverá a int el número insertado en el input.

```python
    letter = ord(question[0]) - 65
    num = int(question[1:]) - 1
```

Asimismo, deberemos verificar si las coodernadas insertadas están dentro del rango del tablero, de no ser asi se le indica al jugador que introduzca una coordenada válida.

```python
    while letter > 9 or letter < 0 or num > 9 or num < 0:
        question = input("Introduzca una coordenada válida: ").upper()
        letter = ord(question[0]) - 65
        num = int(question[1:]) - 1
```

Una vez verificada que la coordenada insertada por el jugador es válida, se procederá a ubicar la coordenada en el tablero. Utilizando una condición **if**, declaramos que si la coordenada es **EMPTY**, es decir, una cadena vacía, y además no está en la lista de coordenadas usadas, se debe ingresar a este bucle. En este bucle, se imprimirá el tablero con un recuadro azul señalizando que es **WATER**. Además, se sumará 1 al número de lanzamientos y, dependiendo de la puntuación, se restará o no 1 punto. A continuación, se incluirá nuevamente el bucle que imprimirá la tabla con la casilla correspondiente coloreada de azul, además de mostrar el número de barcos restantes.

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

Sin embargo, si la condición anterior no se cumple, se debe ingresar al bloque **elif**. En este caso, después de marcar la casilla como tocada y agregar el ID del barco a la variable "ship_hit", se realiza una comprobación para determinar si la longitud del barco es igual al número de veces que su ID aparece en nuestra variable "ship_hit". Si esto es cierto, significa que el barco está hundido y con un bucle anidado, se realiza un sondeo en el back board para encontrar los índices del barco y marcarlos como **SUNKEN** en el front board. Además, se debe cambiar la operación para calcular la puntuación si este esta hundido o solo tocado. También se imprimirán los barcos restantes y nuevamente el tablero.

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
Finalmente, dentro de nuestro bucle while, encontramos este bloque else que solo se ejecuta si el jugador ingresa una coordenada repetida.

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

Una vez terminada la estructura principal del juego, decidimos imprimir un **WELCOME**  para invitar al jugador a participar. Antes de comenzar a jugar se le brinda al jugador la opción de revisar las reglas del juego, permitiéndole decidir si verlas o no.

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

Asimismo, cuando el jugador termine de hundir todos los barcos, se le imprimirá un **YOU WIN!**, el puntaje con el que ganó y el número de intentos que tuvo para hundir los barcos.

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
##### Autores:
- [Nichole Louis](https://github.com/nicholelouis)
- [David Riccio](https://github.com/DavidRiccio)
- [Lili Guo Zeng](https://github.com/liliguoz)
  
