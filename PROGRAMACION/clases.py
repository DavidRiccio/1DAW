class Ips:
    def __init__(self, ip_adress: str):
        self.ip_adress = ip_adress
        self.ip_numbers = ip_adress.split(".")

    def ip_class(self):
        class_type = None
        match self.ip_numbers:
            case a if 1 <= self.ip_numbers[0] <= 126:
                class_type = "Class A"
            case b if 126 <= self.ip_numbers[0] <= 191:
                class_type = "Class B"
            case c if 192 <= self.ip_numbers[0] <= 223:
                class_type = "Class C"
            case d if 224 <= self.ip_numbers[0] <= 239:
                class_type = "Class D"
            case e if 240 <= self.ip_numbers[0] <= 255:
                class_type = "Class D"
        return class_type

    def getmask(self, cidr: int):
        mask_binary = "1" * cidr + "0" * (32 - cidr)
        mask_octets = [mask_binary[value : value + 8] for value in range(0, 32, 8)]
        mask = [str(int(octet, 2)) for octet in mask_octets]
        return ".".join(mask)

    @property
    def is_public(self) -> bool:
        first_octet = self.ip_numbers[0]
        second_octet = self.ip_numbers[1]
        PRIVATE_NETS = (10, [172, (16, 31)], [192, 168])
        is_public = None
        if first_octet in PRIVATE_NETS:
            match first_octet:
                case a if first_octet == PRIVATE_NETS[0]:
                    is_public = False
                case b if first_octet == PRIVATE_NETS[1][0] and PRIVATE_NETS[1][1][
                    0
                ] <= second_octet >= PRIVATE_NETS[1][1][1]:
                    is_public = False
                case c if first_octet == PRIVATE_NETS[2][
                    0
                ] and second_octet == PRIVATE_NETS[2][1]:
                    is_public = False
        else:
            is_public = True

        return is_public

    def __str__(self) -> str:
        return ".".join(self.ip_numbers)


e1 = Ips("192.168.16.85")


print(e1.getmask(26))
