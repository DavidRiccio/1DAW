class Plane:
    blackbox = True
    num_passengers = 0
    rows = 30
    seats_per_row = 6
    seat_letters = ["A", "B", "C", "D", "E", "F"]

    def __init__(
        self, fuel_capacity: float, max_passengers: int, storage_capacity: float
    ):
        self.fuel_capacity = fuel_capacity
        self.max_passengers = max_passengers
        self.storage_capacity = storage_capacity
        self.passengers_info = []

    def add_passenger(self, name, id):
        if Plane.num_passengers >= self.max_passengers:
            print("El avión está lleno. No se puede añadir más pasajeros.")
            return

        row = (Plane.num_passengers // Plane.seats_per_row) + 1
        seat_index = Plane.num_passengers % Plane.seats_per_row
        seat_letter = Plane.seat_letters[seat_index]

        self.passengers_info.append((name, id, row, seat_letter))
        Plane.num_passengers += 1

        print(f"Se añadió pasajero {name}. Asiento: Fila {row}, Asiento {seat_letter}")

    def add_charge(self, weight: float):
        if self.storage_capacity >= weight:
            self.storage_capacity -= weight
        else:
            print(f"Carga de {self.storage_capacity}")

    @staticmethod
    def show_manufacturers():
        return ("Airbus", "Boeing", "Bombardier")

    @classmethod
    def count_passengers(cls):
        print(f"El numero de pasajeros es {Plane.num_passengers}")


Plane1 = Plane(100.0, 30 * 6, 105.0)
Plane1.add_passenger("Juan", "12345678A")
Plane1.add_passenger("María", "98765432B")
Plane1.add_passenger("Rudiger", "983490218F")
Plane1.count_passengers()
