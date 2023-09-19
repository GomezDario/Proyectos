


def factorial_numero(num):
    factorial = 1

    while num > 0:
        factorial = factorial * num
        num -= 1

    return factorial




unNumero = 0
miLista = []

while unNumero < 3:
    miLista.append(factorial_numero(5))
    unNumero +=1

print(miLista)

