# ********************
# CUALIFICANDO NÚMEROS
# ********************


def run(number: int) -> str:
    str_number=str(number)[::-1]
    length=len(str_number)
    qnumber = ''
    for value in range(length):
        qnumber+=str_number[value]
        if (value + 1) % 3 == 0 and value != length -1:
            qnumber +=','

    return qnumber[::-1]


if __name__ == '__main__':
    run(1)