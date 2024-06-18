# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************

def count_vowels(texto):
    if len(texto) == 0:
        return 0
    else:
        if texto[0] in 'aeiou':
            return 1 + count_vowels(texto[1:])
        else:
            return count_vowels(texto[1:])

