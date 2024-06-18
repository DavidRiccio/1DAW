from triangulo import Triangulo

    def test_calculo_area(self):
        # Crea un triángulo con lados 7, 8 y 9
        mi_triangulo = Triangulo(7, 8, 9)
        # El área debe ser aproximadamente 26.83
        self.assertAlmostEqual(mi_triangulo.calcular_area(), 26.83, places=2)

if __name__ == "__main__":
    unittest.main()
