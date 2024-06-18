import math

class Cuadrado:
    def __init__(self, lado):
        self.lado = lado

    def calcular_area(self):
        """Calcula el área del cuadrado."""
        return self.lado ** 2

    def calcular_perimetro(self):
        """Calcula el perímetro del cuadrado."""
        return 4 * self.lado

