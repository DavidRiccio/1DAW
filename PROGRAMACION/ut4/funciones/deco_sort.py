# ******************************
# ORDENANDO MEDIANTE DECORADORES
# ******************************


def sort(order='asc'):
    def decorator(func):
        def wrapper(*args, **kwargs):
            result = func(*args, **kwargs)
            if isinstance(result, (list)):
                if order == 'asc':
                    return sorted(result)
                elif order == 'desc':
                    return sorted(result, reverse=True)
        return wrapper
    return decorator

@sort(order='desc')
def extract_evens(values: list) -> list:
    even_values = [value for value in values if value % 2 == 0]
    return even_values

if __name__ == '__main__':
    result = extract_evens([6, 3, 2, 9, 7, 4])

