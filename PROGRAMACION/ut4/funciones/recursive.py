def rinverted (text:str)->str:
    if len(text) <= 1 :
        return text
    else:
        return text[-1] + rinverted(text[:-1])

print(rinverted("Recursión"))