from __future__ import annotations


class IntegerStack:
    """
    Pila de enteros:
    ╔═════╗
    ║ TOP ║
    ╠═════╣
    ║   4 ║
    ║   3 ║
    ║   5 ║
    ║   7 ║
    ╚═════╝
    """

    def __init__(self, *, max_size: int = 10):
        self.max_size = max_size
        self.items = []

    def push(self, item: int) -> bool:
        """Añade item a la pila.
        Si la pila está llena retornar False, en otro caso retornar True"""
        if len(self.items) == self.max_size:
            return False
        self.items.insert(0, item)
        return True

    def pop(self) -> int:
        """Extraer el elemento que está en el TOP de la pila"""
        return self.items.pop(0)

    def top(self) -> int:
        """Devolver el elemento que está en el TOP de la pila (sin extracción)"""
        return self.items[0]

    def is_empty(self) -> bool:
        """Indica si la pila está vacía"""
        return not self.items

    def is_full(self) -> bool:
        """Indica si la pila está llena -> max_size"""
        return len(self.items) == self.max_size

    def expand(self, factor: int = 2) -> None:
        """Expande el tamaño máximo de la pila en el factor indicado"""
        self.max_size *= factor

    def dump_to_file(self, path: str) -> None:
        """Vuelca la pila a un fichero.
        - Cada item en una línea.
        - El primer elemento del fichero corresponde con el TOP de la pila."""

        with open(path, "w") as f:
            for value in self.items[: len(self.items) - 1]:
                f.write(str(value) + "\n")
            if self.items:
                f.write(str(self.items[-1]))

    @classmethod
    def load_from_file(cls, path: str) -> IntegerStack:
        """Crea una pila desde un fichero.
        - Un item por línea.
        - El primer elemento del fichero corresponde con el TOP de la pila.
        - Si la pila se llena al ir añadiendo elementos habrá que expandir con los valores
        por defecto"""
        new_stack = IntegerStack()
        content = reversed(open(path).readlines())
        for line in content:
            value = int(line.strip())
            if not new_stack.push(value):
                new_stack.expand()
                new_stack.push(value)
        return new_stack

    def __getitem__(self, index: int) -> int:
        """Devuelve el elemento de la pila en el índice indicado"""
        return self.items[index]

    def __setitem__(self, index: int, item: int) -> None:
        """Establece el valor de un elemento de la pila mediante el índice indicado"""
        self.items[index] = item

    def __len__(self):
        """Número de elementos que contiene la pila"""
        return len(self.items)

    def __str__(self):
        """Cada elemento en una línea distinta empezando por el TOP de la pila"""
        return "\n".join(str(item) for item in self.items)

    def __add__(self, other: IntegerStack) -> IntegerStack:
        """Sumar dos pilas.
        - La segunda pila va "encima" de la primera
        - El tamaño máximo de la pila resultante es la suma de los tamaños
        máximos de cada pila."""
        new_stack = IntegerStack(max_size=self.max_size + other.max_size)
        new_stack.items = other.items + self.items
        return new_stack

    def __iter__(self) -> IntegerStackIterator:
        return IntegerStackIterator(self)


class IntegerStackIterator:
    def __init__(self, stack):
        self.stack = stack
        self.pointer = 0

    def __next__(self):
        if self.pointer >= len(self.stack.items):
            raise StopIteration
        stack = self.stack.items[self.pointer]
        self.pointer += 1
        return stack
