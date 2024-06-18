# ***********************
# SUMANDO CON ANIDAMIENTO
# ***********************


def sum_nested(items:list):
    total = 0
    for element in items:
        if isinstance(element, list):
            total += sum_nested(element)  
        else:
            total += element
    return total


