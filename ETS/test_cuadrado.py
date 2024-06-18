from cuadrado import Cuadrado

    
    def test_calculo_perimetro():
        # Crea un cuadrado con lado 5
        cuadrado = Cuadrado(5)
        # El perímetro debe ser 20 (4 * 5)
        cuadrado.calcular_perimetro()
        assert cuadrado.calcular_perimetro() == 20 

