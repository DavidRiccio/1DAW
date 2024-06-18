class Triangulo:
    def __init__(self, a, b, c):
        self.a = float(a)
        self.b = float(b)
        self.c = float(c)

    def calcular_area(self):
       
        s = (self.a + self.b + self.c) / 2
        return (s * (s - self.a) * (s - self.b) * (s - self.c)) ** 0.5

# Ejemplo de uso
a, b, c = 7, 8, 9
mi_triangulo = Triangulo(a, b, c)
print(f"Área del triángulo: {mi_triangulo.calcular_area():.2f}")
