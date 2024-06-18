import re

def calc(expression: str) -> int | float:

    pattern=r'(\d+)\s*([-+*/])\s*(\d+)'
    match = re.match(pattern, expression)
    
    if match:
        operator = match.group(2)
        number1 = int(match.group(1))
        number2 = int(match.group(3))

        match operator:
            case '+':
                result= number1 + number2
            case'-':
                result= number1 - number2
            case'*':
                result= number1 * number2
            case'/':
                result= number1 / number2 

    return result
