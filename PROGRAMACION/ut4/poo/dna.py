from __future__ import annotations


class DNA:
    ADENINE = "A"
    CYTOSINE = "C"
    GUANINE = "G"
    THYMINE = "T"

    def __init__(self, sequence: str):
        self.sequence = sequence

    def __str__(self):
        return self.sequence

    @property
    def adenines(self) -> int:
        return self.sequence.count(DNA.ADENINE)

    @property
    def cytosines(self) -> int:
        """Número de citosinas de la secuencia de ADN"""

        return self.sequence.count(DNA.CYTOSINE)

    @property
    def guanines(self) -> int:
        """Número de guaninas de la secuencia de ADN"""

        return self.sequence.count(DNA.GUANINE)

    @property
    def thymines(self) -> int:
        """Número de timinas de la secuencia de ADN"""

        return self.sequence.count(DNA.THYMINE)

    def __add__(self, other: "DNA") -> "DNA":
        """Se define la suma de dos secuencias de ADN como el máximo de cada base nitrogenada
        (base a base). Por ejemplo 'T' sería mayor que 'A'.
        Si las secuencias no tienen la misma longitud, habrá que aplicar el máximo base a base
        hasta donde se pueda, y completar el resto de la secuencia con la parte que falte, bien
        de la primera o bien de la segunda secuencia, en función de cuál sea mayor.
        """
        dna_sum = []

        for base_self, base_other in zip(self.sequence, other.sequence):
            if base_self > base_other:
                dna_sum.append(base_self)
            else:
                dna_sum.append(base_other)

        if len(self.sequence) > len(other.sequence):
            dna_sum.extend(self.sequence[len(other.sequence) :])
        elif len(self.sequence) < len(other.sequence):
            dna_sum.extend(other.sequence[len(self.sequence) :])

        new_dna = "".join(dna_sum)
        return DNA(new_dna)

    def __len__(self):
        """Longitud de la secuencia de ADN"""
        return len(self.sequence)

    def stats(self) -> dict[str, float]:
        ALL_DNA = (DNA.ADENINE, DNA.GUANINE, DNA.CYTOSINE, DNA.THYMINE)
        values = {}
        for value in ALL_DNA:
            DNA_PERCENTAGE = self.sequence.count(value) / len(self.sequence) * 100
            values[value] = DNA_PERCENTAGE
        return values

    def __mul__(self, other: "DNA") -> "DNA":
        min_length = min(len(self.sequence), len(other.sequence))
        dna_mul = []
        for value in range(min_length):
            if self.sequence[value] == other.sequence[value]:
                dna_mul.append(self.sequence[value])

        new_dna = "".join(dna_mul)
        return DNA(new_dna)

    @classmethod
    def build_from_file(cls, path: str) -> "DNA":
        """Construye una secuencia de ADN a partir de un fichero.
        El formato del fichero es tener una única línea con todas las bases
        una detrás de otra."""
        with open(path, "r") as file:
            sequence = file.read().strip()
        return cls(sequence)

    def dump_to_file(self, path: str) -> None:
        """Vuelca una secuencia de ADN a un fichero de salida.
        El formato del fichero es tener una única línea con todas las bases
        una detrás de otra."""
        with open(path, "w") as f:
            f.write(self.sequence)

    def __getitem__(self, index: int) -> str:
        """Devuelve la base que ocupa la posición 'index'"""
        return self.sequence[index]

    def __setitem__(self, index: int, base: str) -> None:
        ALL_DNA = (DNA.ADENINE, DNA.GUANINE, DNA.CYTOSINE, DNA.THYMINE)
        if base not in ALL_DNA:
            base = DNA.ADENINE
        self.sequence = self.sequence[:index] + base + self.sequence[index + 1 :]
