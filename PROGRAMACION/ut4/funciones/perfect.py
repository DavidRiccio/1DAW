# *****************
# NÚMEROS PERFECTOS
# *****************


def is_perfect(n:int)->bool:
    values=[]
    for value in range(1,n):
        if n % value ==0:
            values.append(value)
    if sum(values)==n:
        return True
    else:
        return False


