# *******************
# NÚMERO EN INTERVALO
# *******************


def in_range(value:int,lower_limit:int,upper_limit:int)->bool:
    values=[item for item in range(lower_limit,upper_limit+1)]
    if value in values:
        return True
    else:
        return False
    

