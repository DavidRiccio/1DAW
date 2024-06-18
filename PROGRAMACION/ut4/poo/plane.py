class Plane:
    blackbox = True
    num_passengers = 0
    seat_letters = ["A", "B", "C", "D", "E", "F","G","H","I","J"]

    def __init__(
        self, fuel_capacity: float,  storage_capacity: float, rows:int,seats_per_row:int=6
    ):
        self.fuel_capacity = fuel_capacity
        self.storage_capacity = storage_capacity
        self.passengers_info = []
        self.rows=rows
        self.seats_per_row=seats_per_row

    @property
    def max_passengers(self):
        return self.rows * self.seats_per_row

    def add_passenger(self, name, id):
        if Plane.num_passengers >= self.max_passengers:
            print("El avión está lleno. No se puede añadir más pasajeros.")
            return
        row = (Plane.num_passengers // self.seats_per_row) + 1
        seat_index = Plane.num_passengers % self.seats_per_row
        seat_letter = self.seat_letters[seat_index]
        self.passengers_info.append((name, id, row, seat_letter))
        Plane.num_passengers += 1
        print(f"Se añadió pasajero {name}. Asiento: Fila {row}, Asiento {seat_letter}")

    def add_charge(self, weight: float):
        if self.storage_capacity >= weight:
            self.storage_capacity -= weight
        else:
            print(f"Carga de {self.storage_capacity}")

    def show_passengers_info(self):
        for passenger in self.passengers_info:
            print(f"Nombre: {passenger[0]}, ID: {passenger[1]}, Fila: {passenger[2]}, Asiento: {passenger[3]}")

    @staticmethod
    def show_manufacturers():
        return ("Airbus", "Boeing", "Bombardier")

    @classmethod
    def count_passengers(cls):
        print(f"El numero de pasajeros es {Plane.num_passengers}")


Plane1 = Plane(100.0, 105.0,30,9)
Plane1.count_passengers()
Plane1.show_passengers_info()
Plane1.add_passenger("Juan", "12345678A")
Plane1.add_charge(50)

Plane1.show_passengers_info() 
Plane1.show_manufacturers() 
Plane1.count_passengers()
print(Plane1.max_passengers)