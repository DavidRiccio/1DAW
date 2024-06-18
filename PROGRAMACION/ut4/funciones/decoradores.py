def allow_entry(func):
    def wrapper(*args, **kwargs):
        for arg in args:
            if not isinstance(arg, int) or arg < 0:
                print('Error: Los argumentos deben ser números enteros positivos.')
                return None
        for arg in kwargs.values():
            if not isinstance(arg, int) or arg < 0:
                print('Error: Los argumentos deben ser números enteros positivos.')
                return None
        return func(*args, **kwargs)
    return wrapper




@allow_entry
def avg (num):
    return sum(num) / len(num)

print(avg([1, 2, 3, 4, 5]))